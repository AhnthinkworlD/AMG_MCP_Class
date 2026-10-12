# AI 클라이언트에 등록하기

설치는 서버 파일을 준비하고 설정 예시를 생성한다. AI에 서버를 등록하는 단계는 별도로 수행한다. 터미널의 연결 점검이 성공해도 AI 등록 완료를 뜻하지 않는다.

## Codex

설치가 생성한 사용자 홈 `AMG_MCP_Class/Codex_설정.toml`을 연다. 사용 중인 Codex의 사용자 설정 `~/.codex/config.toml`에 해당 서버 항목을 병합한다. 이미 `[mcp_servers.amg_td]`가 있다면 그 항목의 command/args/env를 교체하며 같은 이름의 TOML 표를 중복 추가하지 않는다. 다른 서버 설정은 보존한다.

Mac 설정에는 Windows 전용 네 도구를 끄는 `disabled_tools`가 포함된다. 적용 후 MCP 서버를 재시작/재연결한다. [OpenAI 공식 MCP 설정](https://learn.chatgpt.com/docs/extend/mcp?surface=cli)

## mcpServers JSON 방식 클라이언트

`AMG_MCP_Class/AI클라이언트_설정.json`의 `mcpServers.AMG_MCP` 항목을 해당 클라이언트의 MCP 설정에 병합한다. JSON 전체를 기존 계정 설정 위에 덮어쓰지 않는다. 도구 비활성화 기능이 있다면 Mac에서 `td_capture_screenshot`, `td_simulate_click`, `td_simulate_text`, `td_simulate_key`를 끈다.

## 확인

TD를 먼저 열고 [연결 프롬프트](../prompts/01-connect.txt)를 AI에 그대로 붙여넣는다. 실제 프로젝트·Root·인스턴스가 맞으면 실습을 시작한다. `td_begin_session`이 없으면 AI의 MCP 등록/재연결부터 확인한다.


## 기존 9981 등록

AMG 수업 Bridge는 **9987**이다. `TD_MCP_URL`이 9981이면 설치가 생성한 9987 설정으로 수정한다. 저장 뒤 MCP 서버를 재시작한다. 설정 변경 전 실행한 프로세스는 이전 주소를 계속 사용할 수 있다. [새 시작 검증](CONNECTION_VERIFICATION_1.0.1.md).


Codex 설정의 Command에는 생성된 TOML `command`의 **큰따옴표 안 경로만** 복사합니다. Windows 경로는 복사하기 쉽게 `/`로 생성합니다. 인수 `-m`과 `td_mcp_server.main`은 별도로 추가합니다.
