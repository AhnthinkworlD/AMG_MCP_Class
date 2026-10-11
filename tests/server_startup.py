"""Start the installed MCP server and discover tools; no TD process is used."""
import argparse
from pathlib import Path
import subprocess
import sys
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
import install
parser=argparse.ArgumentParser()
parser.add_argument('--root',type=Path,required=True)
parser.add_argument('--report',type=Path)
args=parser.parse_args()
code="""
import asyncio,sys,json,platform
from importlib.metadata import version
from mcp import ClientSession,StdioServerParameters
from mcp.client.stdio import stdio_client
async def run():
    params=StdioServerParameters(command=sys.executable,args=['-m','td_mcp_server.main'])
    async with stdio_client(params) as (reader,writer):
        async with ClientSession(reader,writer) as session:
            await session.initialize()
            names={t.name for t in (await session.list_tools()).tools}
            assert {'td_begin_session','td_preview_top','td_create_node','td_save_component_tox'} <= names
            print(json.dumps({'MCP_stdio_startup':True,'tool_count':len(names),'TouchDesigner_tested':False,
                'python':sys.version.split()[0],'platform':sys.platform,'architecture':platform.machine(),
                'os_version':platform.mac_ver()[0] or platform.release(),'mcp':version('mcp'),'httpx':version('httpx')}))
asyncio.run(run())
"""
result=subprocess.run([str(install.python_path(args.root.resolve())),'-c',code],check=True,timeout=30,capture_output=True,text=True)
print(result.stdout,end='')
if args.report:
    import json
    report=json.loads(result.stdout.strip())
    args.report.parent.mkdir(parents=True,exist_ok=True)
    args.report.write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
