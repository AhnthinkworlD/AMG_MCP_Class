"""기존 AMG_MCP 1.0 수업용 설치/읽기 점검. Windows와 macOS 공통.

AI 클라이언트의 기존 설정과 TD 프로젝트는 변경하지 않습니다.
"""
import argparse
import asyncio
import json
import os
from pathlib import Path
import subprocess
import sys
import venv

WHEEL = 'td_mcp_server-1.0.0-py3-none-any.whl'
WINDOWS_ONLY = ['td_capture_screenshot', 'td_simulate_click',
                'td_simulate_text', 'td_simulate_key']


def python_path(root, platform=None):
    platform = platform or sys.platform
    parts = ('Scripts', 'python.exe') if platform == 'win32' else ('bin', 'python')
    return Path(root) / '.venv' / parts[0] / parts[1]


def configurations(python, port, platform=None):
    platform = platform or sys.platform
    env = {'TD_MCP_URL': f'http://127.0.0.1:{port}/', 'TD_MCP_TIMEOUT': '15'}
    server = {'command': str(python), 'args': ['-m', 'td_mcp_server.main'], 'env': env}
    toml = ('[mcp_servers.amg_td]\ncommand = ' + json.dumps(str(python), ensure_ascii=False)
            + '\nargs = ["-m", "td_mcp_server.main"]\n')
    if platform != 'win32':
        toml += 'disabled_tools = ' + json.dumps(WINDOWS_ONLY) + '\n'
    toml += '\n[mcp_servers.amg_td.env]\n'
    toml += '\n'.join(k + ' = ' + json.dumps(v) for k, v in env.items()) + '\n'
    return {'mcpServers': {'AMG_MCP': server}}, toml


def unpack(result):
    if getattr(result, 'is_error', getattr(result, 'isError', False)):
        raise RuntimeError(' / '.join(c.text for c in result.content if c.type == 'text'))
    for c in result.content:
        if c.type == 'text':
            try:
                value = json.loads(c.text)
            except ValueError:
                raise RuntimeError(c.text)
            return value.get('result', value)
    raise RuntimeError('MCP가 텍스트 응답을 반환하지 않았습니다.')


async def probe(port):
    from mcp import ClientSession, StdioServerParameters
    from mcp.client.stdio import stdio_client
    params = StdioServerParameters(command=sys.executable, args=['-m', 'td_mcp_server.main'],
        env=dict(os.environ, TD_MCP_URL=f'http://127.0.0.1:{port}/', TD_MCP_TIMEOUT='5',
                 TD_MCP_RETRY_ATTEMPTS='0'))
    async with stdio_client(params) as (reader, writer):
        async with ClientSession(reader, writer) as session:
            await session.initialize()
            tools = await session.list_tools()
            context = unpack(await session.call_tool('td_begin_session', {}))
            caps = context.get('capabilities', {})
            required = {'create_node', 'set_param', 'connect', 'save_top_image', 'capture_top',
                        'save_component_tox', 'load_component_tox', 'validate_network'}
            missing = sorted(required - set(caps.get('actions', [])))
            if missing:
                raise RuntimeError('수업 필수 기능 누락: ' + ', '.join(missing))
            if 'td_preview_top' not in {tool.name for tool in tools.tools}:
                raise RuntimeError('TOP 미리보기 MCP 도구 누락')
            children = unpack(await session.call_tool('td_list_children',
                {'parent_path': context['project_root']}))
            version = unpack(await session.call_tool('td_get_td_version', {}))
            summary = {k: context.get(k) for k in ['project_name', 'project_root',
                'instance_id', 'bridge_path', 'bundle_version', 'protocol_version']}
            summary.update(platform=sys.platform, endpoint=f'http://127.0.0.1:{port}/',
                td=version, tool_count=len(tools.tools), required_actions_present=True,
                project_children_read=True, gui_tools_windows_only=WINDOWS_ONLY,
                scope='read-only connection; no network creation or project save')
            print(json.dumps(summary, ensure_ascii=False, indent=2))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', type=Path, default=Path.home() / 'AMG_MCP_Class')
    parser.add_argument('--port', type=int, default=9987)
    parser.add_argument('--check-only', action='store_true', help='설치하지 않고 현재 연결만 읽기 점검')
    parser.add_argument('--probe', action='store_true', help=argparse.SUPPRESS)
    args = parser.parse_args()
    if sys.version_info < (3, 10):
        parser.error('Python 3.10 이상을 설치하세요.')
    if not 1 <= args.port <= 65535:
        parser.error('포트는 1~65535 범위여야 합니다.')
    if args.probe:
        asyncio.run(probe(args.port))
        return
    root = args.root.expanduser().resolve()
    python = python_path(root)
    if args.check_only:
        if not python.is_file():
            parser.error('가상환경이 없습니다. 먼저 install.py를 실행하세요.')
        subprocess.run([str(python), str(Path(__file__).resolve()), '--probe',
                        '--port', str(args.port)], check=True, timeout=50)
        return
    wheel = Path(__file__).resolve().parent / WHEEL
    if not wheel.is_file():
        parser.error('이 스크립트를 수업용 wheel과 같은 폴더에 두세요.')
    if not python.exists():
        venv.EnvBuilder(with_pip=True).create(root / '.venv')
    subprocess.run([str(python), '-m', 'pip', 'install', '--only-binary=:all:', str(wheel)], check=True)
    subprocess.run([str(python), '-c', 'from td_mcp_server.main import mcp; '
                    'from mcp import ClientSession; print("MCP 서버 import 정상")'], check=True)
    client_json, toml = configurations(python, args.port)
    root.mkdir(parents=True, exist_ok=True)
    (root / 'AI클라이언트_설정.json').write_text(
        json.dumps(client_json, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    (root / 'Codex_설정.toml').write_text(toml, encoding='utf-8')
    print(f'설치 완료: {root}\nAI클라이언트_설정.json 또는 Codex_설정.toml을 등록하세요.')
    print('기존 AI 설정과 TD 파일은 변경하지 않았습니다. TD 예제를 열고 --check-only로 점검하세요.')


if __name__ == '__main__':
    try:
        main()
    except Exception as error:
        print('AMG_MCP 설치/점검 실패: ' + str(error), file=sys.stderr)
        sys.exit(1)
