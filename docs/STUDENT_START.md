# 5주차 수업 전 준비: Windows·Mac 설치와 Codex 연결

수업 전에 **설치와 연결 확인까지** 준비합니다. 10×10 제작·결과 검사는 수업에서 함께 진행합니다.

**[학생용 준비 PDF 보기](student-preparation-v9.pdf)** · **[PDF 바로 다운로드](https://raw.githubusercontent.com/AhnthinkworlD/AMG_MCP_Class/main/docs/student-preparation-v9.pdf)** · **[수업 ZIP 받기](https://github.com/AhnthinkworlD/AMG_MCP_Class/releases/download/v1.0.4/amg-mcp-class-1.0.4.zip)**

본인 운영체제로 이동하세요: **[Windows](#windows)** / **[Mac](#mac)** → **[Codex 등록](#codex)** → **[연결 확인](#check)**

완료 기준: **INSTALL OK → CHECK OK → Codex가 실제 MCP로 수업 파일 읽기**

---

이번 수업에서는 AI에 요청해 TouchDesigner 안에 10×10 원 100개를 만들고 결과를 검사합니다. **수업 전에는 설치·연결 확인까지만** 진행해주세요. 제작 요청02·검사 요청03은 수업에서 함께 실행합니다.

## 준비물과 완료 기준

- 수업에 사용할 노트북·충전기·인터넷
- TouchDesigner: **수업 검증 기준 2025.33230**. 이미 설치했으면 Help/About에서 버전을 확인해주세요. 다른 빌드를 쓰거나 예제가 열리지 않으면 버전을 강사에게 알려주세요.
- Codex를 로컬로 사용할 수 있는 데스크톱 앱과 로그인 계정. 메시지를 보내 실제 응답을 받는지 확인해주세요. 계정의 사용 권한·사용량은 개인별로 다를 수 있습니다.
- 수업 ZIP 전체: **amg-mcp-class-1.0.4.zip**

완료 순서: **INSTALL OK → CHECK OK → Codex의 실제MCP 연결 확인**. 각 단계를 확인한 다음 진행합니다.

## 1. 프로그램과 수업 파일 준비

1. [TD 공식 다운로드](https://derivative.ca/download)에서 수업 기준 버전을 확인합니다. Mac은 Apple 메뉴 → 이 Mac에 관하여에서 Apple Silicon/Intel을 확인하고 맞는 TD 설치본을 선택합니다.
2. [OpenAI 공식 시작 안내](https://learn.chatgpt.com/docs/quickstart)에서 데스크톱 앱을 설치하고 로그인합니다. 현재 공식 안내는ChatGPT 데스크톱 앱에서Codex를 사용하는 흐름도 포함합니다. 이미 Codex 앱을 사용하고 있으면 로그인·로컬 채팅·메시지 응답을 먼저 확인합니다. 브라우저 채팅만으로는 이번 로컬STDIO 연결을 진행할 수 없습니다.
3. [수업 ZIP 다운로드](https://github.com/AhnthinkworlD/AMG_MCP_Class/releases/download/v1.0.4/amg-mcp-class-1.0.4.zip)를 누릅니다. [Release 페이지](https://github.com/AhnthinkworlD/AMG_MCP_Class/releases/tag/v1.0.4)의 **Assets → amg-mcp-class-1.0.4.zip**에서 받아도 됩니다. 자동으로 표시되는Source code ZIP과 구분해주세요.
4. Windows는ZIP 우클릭 → 모두 압축 풀기, Mac은ZIP 더블클릭으로 **폴더 전체**를 풉니다. 풀린 폴더는 설치가 끝날 때까지 보관합니다.

풀린 폴더에 다음 파일이 있는지 확인합니다.

| 용도 | 파일 |
| --- | --- |
| Windows 설치·점검 | 01_Install_Windows.bat / 02_Check_Windows.bat |
| Mac 설치·점검 | 01_Install_Mac.command / 02_Check_Mac.command |
| TD 수업 예제 | touchdesigner/AMG_MCP_Class_10x10.toe |
| 사전 연결 확인 | prompts/01-connect.txt |
| 수업 중 제작·검사 | prompts/02-build.txt / prompts/03-check.txt |
| 상세 안내 | docs/STUDENT_START.md / docs/CONNECT_AI.md |

**다운로드하여 푼 폴더**에는 설치 파일과TD 예제가 있습니다. **설치가 새로 만드는AMG_MCP_Class 폴더**에는Codex 설정과 로그가 있습니다. 두 폴더를 구분해주세요.

## Windows

**Windows 설치와 TD 점검**

1. 풀린 폴더의 **01_Install_Windows.bat**을 더블클릭합니다. 관리자 권한으로 실행할 필요는 없습니다.
2. 첫 설치는 필요한 파일을 인터넷으로 받습니다. 창을 닫지 말고 **INSTALL OK**를 기다립니다. Windows는 별도 Python 사전 설치가 필요 없습니다.
3. 설치 후 열린AMG_MCP_Class 폴더에서 **Codex_설정.toml**을 찾습니다. 기본 위치는 `C:\Users\본인계정\AMG_MCP_Class`입니다.
4. 다운로드하여 푼 폴더의 **touchdesigner/AMG_MCP_Class_10x10.toe**를 열고 로딩이 끝날 때까지 기다립니다.
5. 풀린 폴더의 **02_Check_Windows.bat**을 실행합니다. **CHECK OK**, `project_name`에 내가 연 파일, `protocol_version: 2`를 확인합니다.
6. TD 예제를 열어둔 채 아래Codex 연결로 넘어갑니다.

## Mac

**Mac 설치와 TD 점검**

1. [검증에 사용한Python 3.14.7 Mac 설치본](https://www.python.org/ftp/python/3.14.7/python-3.14.7-macos11.pkg)을 설치합니다. TD에 포함된 Python과 별도로 필요합니다. 이미 외부 Python 3.10 이상을 설치했다면 수업 설치 파일이 실행 가능 여부를 점검합니다.
2. Finder → 응용 프로그램 → **Python 3.14 → Install Certificates.command**를 실행합니다. 다른 Python 버전은 해당 버전 폴더를 확인합니다.
3. 풀린 수업 폴더의 **01_Install_Mac.command**를 실행하고 **INSTALL OK**를 기다립니다.
4. 설치 후 열린AMG_MCP_Class 폴더에서 **Codex_설정.toml**을 찾습니다. Finder에서 Shift+Command+G를 누르고 `~/AMG_MCP_Class`를 입력해도 열 수 있습니다.
5. 풀린 수업 폴더의 **touchdesigner/AMG_MCP_Class_10x10.toe**를 열고 로딩을 기다립니다.
6. **02_Check_Mac.command**를 실행합니다. **CHECK OK**, `project_name`에 내가 연 파일, `protocol_version: 2`를 확인합니다. TD는 계속 열어둡니다.

### Mac에서 .command 더블클릭이 실행되지 않으면

Terminal에서 `cd `를 입력합니다. 끝의 공백을 남긴 채 **압축을 푼 수업 폴더**를Terminal 창으로 끌어 넣고Enter를 누릅니다. 아래를 한 줄씩 실행합니다.

```sh
bash ./01_Install_Mac.command
```

INSTALL OK를 확인하고 TD 예제를 연 다음 실행합니다.

```sh
bash ./02_Check_Mac.command
```

보안 경고가 나오면 강사의 GitHub에서 받은 파일인지 확인하고 시스템이 제공하는 실행 허용 안내를 따릅니다. 학교 정책으로 차단되면 오류 내용을 강사에게 알려주세요.

## Codex

**설치한 MCP를 Codex에 등록하기**

설치·CHECK OK와 **Codex 등록은 별도 단계**입니다. 설치가 Codex의 기존 설정을 자동으로 덮어쓰지 않습니다. 자기 컴퓨터에 생성된 **Codex_설정.toml**을 메모장/텍스트 편집기로 엽니다.

### Windows: 설정 화면에서 등록

1. Codex의 **Settings → MCP servers → Add server**를 엽니다. 이미 `amg_td`가 있으면 새로 중복 추가하지 않고 기존 항목을 수정합니다.
2. 다음 값을 넣습니다.

| 항목 | 넣을 값 |
| --- | --- |
| Name | amg_td |
| 연결 방식 | STDIO |
| Command | 자기 Codex_설정.toml의 command 큰따옴표 안 경로만 |
| Arguments 첫 번째 | -m |
| Arguments 두 번째 | td_mcp_server.main |
| 환경 변수 이름 / 값 | TD_MCP_URL / http://127.0.0.1:9987/ |
| 환경 변수 이름 / 값 | TD_MCP_TIMEOUT / 15 |

`command =`와 큰따옴표는 Command 입력칸에 넣지 않습니다. `-m td_mcp_server.main`을 Command 뒤에 붙이지 않고 **Arguments 두 개로** 추가합니다. 다른 사람의 경로를 복사하지 않습니다. 9987 주소는 환경 변수이며, 서버 등록 방식은 STDIO입니다.

3. **Save → Restart**합니다. TD는 열어두고 Codex에서 새 로컬 채팅을 시작합니다. 프로젝트 폴더 선택을 요구하면 수업 자료를 풀어둔 폴더를 선택합니다.

### Mac: 생성된 설정 파일 전체를 병합

Mac용 파일에는 Windows 전용 캡처/자동 입력 도구를 제외하는 `disabled_tools` 설정이 포함됩니다. 이 설정을 함께 적용하도록 아래 방법을 사용합니다. Windows에서 등록 화면을 찾지 못한 경우에도 같은 방법을 쓸 수 있습니다.

1. 자기 `~/AMG_MCP_Class/Codex_설정.toml`의 **전체 내용**을 복사합니다.
2. Codex의 사용자 설정 파일 `~/.codex/config.toml`을 엽니다. Mac Finder에서 Shift+Command+G → `~/.codex` → `config.toml`을 텍스트 편집기로 열 수 있습니다. Windows에서는 파일 탐색기 주소창에 `%USERPROFILE%\.codex`를 입력합니다.
3. 기존 config.toml을 복사해 백업한 뒤 수업 서버 항목을 병합합니다. `[mcp_servers.amg_td]`가 없으면 끝에 추가하고, 이미 있으면 그 서버의 항목과 환경 변수만 교체합니다. 다른 설정 전체를 지우거나 같은 TOML 표를 중복 추가하지 않습니다. 파일이 없는 경우에만 생성된 내용으로 `config.toml`을 새로 만듭니다. `.txt` 확장자가 붙지 않게 저장합니다.
4. Mac 파일의 `disabled_tools` 한 줄과 `[mcp_servers.amg_td.env]` 아래 **TD_MCP_URL/TD_MCP_TIMEOUT**까지 함께 넣습니다. 경로와 값을 임의로 다른 사람의 것으로 바꾸지 않습니다.
5. 저장 후 MCP 서버를 Restart합니다. 메뉴를 찾지 못하면 앱을 종료하고 다시 엽니다. TD는 계속 열어둔 상태로 새 로컬 채팅을 시작합니다.

설정 파일 병합이 익숙하지 않으면 변경 전에 강사에게 문의해주세요. [공식 MCP 설정 안내](https://learn.chatgpt.com/docs/extend/mcp)와 수업 ZIP의 docs/CONNECT_AI.md에도 같은 원리가 설명되어 있습니다.

## Check

**연결 확인: 그대로 복사할 요청문**

아래는 수업 ZIP의 **prompts/01-connect.txt**와 같은 내용입니다. TD 예제를 열어두고 Codex 로컬 채팅에 본문 전체를 붙여넣습니다.

```text
연결된 TouchDesigner를 MCP 도구로 확인해줘.
먼저 현재 프로젝트 이름·경로·TD 버전과 사용할 수 있는 도구를 읽어줘.
수업 프로젝트 AMG_MCP_Class_10x10.toe와 W05_REFERENCE_10X10 기준 예제가 맞는지 확인해줘.
연결 대상이 다르거나 도구 호출이 실패하면 만들기 전에 원인과 확인할 항목을 알려줘.
노드와 파일은 변경하지 말고, 확인한 대상과 다음 실습을 진행할 수 있는지 알려줘.
```

Codex가 **실제 MCP 도구를 호출해** 파일 이름과 기준 예제를 읽었는지 확인합니다. `td_begin_session` 등의 도구 실행이 없고 일반 설명만 나오면 연결이 확인된 것이 아닙니다. 올바른 TOE와 **W05_REFERENCE_10X10**을 확인하면 준비 완료입니다. 다른 파일이 확인되면 제작을 시작하지 않습니다.

## 5. 수업 시작 전 마지막 확인

- [ ] 수업 ZIP을 전부 풀었고 설치·점검 파일, TD 예제, prompts 폴더가 있다.
- [ ] TD 기준 버전을 확인했고 수업 TOE가 열린다.
- [ ] INSTALL OK를 확인했다.
- [ ] CHECK OK와 내가 연 파일 이름을 확인했다.
- [ ] Codex에 amg_td를 등록하고 Restart했다.
- [ ] 01-connect 요청으로 실제 MCP 연결 대상을 확인했다.
- [ ] 노트북·충전기와 수업 파일을 준비했고, Codex 로그인·응답이 가능하다.

수업 중에는 01 연결 → 02 제작 → 03 검사 순서로 한 요청씩 실행합니다. 사전 준비에서 02/03을 미리 실행할 필요는 없습니다.

## 문제가 생기면 알려줄 내용

- 어느 단계인가요? 설치 / TD 열기 / CHECK / Codex 등록 / 연결 요청
- 운영체제와 TD 버전, Mac이면 Apple Silicon/Intel과 macOS 버전
- 실패 창과 오류 메시지, 설치 폴더 AMG_MCP_Class/logs의 해당 로그
- CHECK에는 성공했는데 Codex에서 실패한다면 Command의 자기 경로·Arguments 두 개·포트 9987·Restart 여부

연락: ahnthinkgood@gmail.com. 계정 권한·사용량·학교 설치 정책 때문에 어려우면 수업 전에 알려주세요. 추가 구독을 먼저 구매할 필요는 없습니다.

Mac은 설치·MCP 서버 시작의 원격 검사를 통과했지만, 개인 Mac의 TD 렌더·Finder 실행까지 모두 확인한 것은 아닙니다. **본인 기기의 CHECK와 Codex 연결을 직접 확인**하고 실패 내용을 알려주세요.

2026-10-12 수업 준비 안내 / 수업 Release v1.0.4·TD 검증 기준 2025.33230. 근거: 수업 ZIP의 STUDENT_START·INSTALL_WINDOWS·INSTALL_MACOS·CONNECT_AI와 [OpenAI 공식 시작 안내](https://learn.chatgpt.com/docs/quickstart),[공식 MCP 설정](https://learn.chatgpt.com/docs/extend/mcp).

---

[공지문 원문](student-notice-v9.txt) · [학생에게 보낼 짧은 공지](../학생공지_복사해서전달.txt)

2026-10-13 안내 페이지 게시 / 설치 패키지 v1.0.4와 기존 검증된 서버·예제 사용
