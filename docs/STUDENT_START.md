# 5주차 AMG MCP 설치와 첫 실습

이번 실습은 AI에 요청해서 TouchDesigner 안에 10×10 원 100개를 만드는 수업입니다. AI가 만든 결과를 직접 관찰하고 검사하는 것까지 진행합니다.

## 수업 전에 준비

1. 강사가 공유한 [최신 배포 ZIP](https://github.com/AhnthinkworlD/AMG_MCP_Class/releases/latest)을 내려받아 **전부 압축을 풉니다.** 설치 파일 하나만 꺼내지 마세요.
2. TouchDesigner를 준비합니다. 수업 검증 기준은 **2025.32820**입니다. 다른 빌드는 강사와 먼저 확인합니다.
3. 수업에서는 **Codex의 로컬 MCP 연결**을 기준으로 진행합니다. 앱에서 로그인과 메시지 전송이 되는지 미리 확인합니다. 사용할 수 있는 모델과 사용량은 본인의 계정에 따라 달라집니다. [공식 MCP 안내](https://learn.chatgpt.com/docs/extend/mcp?surface=cli)
4. **Mac만:** [검증 버전 Python 3.14.7 Mac 설치본](https://www.python.org/ftp/python/3.14.7/python-3.14.7-macos11.pkg)을 먼저 설치하고, Python 설치 폴더의 `Install Certificates.command`도 실행합니다. Windows는 설치 파일이 필요한 Python을 자동으로 준비합니다.

Mac 설치·서버 시작은 [Apple Silicon·Intel 원격 검사](MAC_CI_VERIFICATION.md)를 통과했습니다. 실제 TD 실습은 수업 전 Mac 학생 한 명과 먼저 확인합니다. 이미 Python 3.10 이상이 있다면 설치 파일이 실행 가능 여부를 점검하지만, 모든 Python 버전의 Mac 조합을 시험한 것은 아닙니다.

## 설치부터 연결까지

| 순서 | Windows | Mac | 다음 단계로 넘어가는 기준 |
|---|---|---|---|
| 1. 설치 | `01_Install_Windows.bat` 더블클릭 | `01_Install_Mac.command` 더블클릭 | **INSTALL OK** |
| 2. TD 예제 열기 | `touchdesigner/AMG_MCP_Class_10x10.toe` 열기 | 같은 파일 열기 | 로딩 완료 |
| 3. 연결 점검 | `02_Check_Windows.bat` 더블클릭 | `02_Check_Mac.command` 더블클릭 | **CHECK OK**, 내가 연 파일 이름 |
| 4. AI 등록 | 아래 설명대로 Codex 설정 | 같은 방식으로 Codex 설정 | MCP 재시작 후 연결 프롬프트 성공 |

첫 설치는 인터넷으로 필요한 파일을 받으므로 잠시 기다립니다. 창에 **FAILED**가 보이면 다음 단계로 넘어가지 말고 창과 로그를 강사에게 보여주세요.

## Codex에 AMG MCP 등록

1. 설치가 끝나면 열린 `AMG_MCP_Class` 폴더에서 `Codex_설정.toml`을 찾습니다. Windows는 사용자 홈의 `AMG_MCP_Class`, Mac은 `~/AMG_MCP_Class`입니다.
2. Codex 설정에서 **MCP servers → Add server**를 열고 아래 값을 넣습니다.
   - 이름: `amg_td`
   - 방식: **STDIO**
   - Command: 생성된 TOML의 `command` 값. 자기 컴퓨터의 경로를 사용합니다.
   - Arguments: `-m`과 `td_mcp_server.main`을 각각 인수로 추가합니다.
   - 환경 변수: `TD_MCP_URL` = `http://127.0.0.1:9987/`
3. 저장하고 해당 MCP 서버를 **Restart**합니다. 이미 `amg_td`가 있다면 새 항목을 중복 추가하지 말고 기존 항목을 수정합니다.
4. 설정 화면이 다른 버전이면 강사와 [AI 등록 안내](CONNECT_AI.md)를 따라 생성된 TOML을 기존 설정에 병합합니다. 기존 설정 파일 전체를 덮어쓰지 않습니다.

등록 후에도 TD는 열어 둡니다. 이 수업은 로컬 TD와 연결하므로 브라우저 채팅창에 프롬프트만 붙이는 것으로 연결되지는 않습니다.

## 첫 실습

아래 파일의 **본문 전체**를 순서대로 AI에 붙여넣습니다. 한 요청이 끝나고 실제 결과를 확인한 다음 다음 파일을 사용합니다.

1. [01 연결 확인](../prompts/01-connect.txt): AI가 현재 TD 파일과 기준 예제 경로를 확인합니다.
2. [02 10×10 제작](../prompts/02-build.txt): 새 Container 안에 원 100개를 만듭니다.
3. [03 실제 결과 검사](../prompts/03-check.txt): 원 개수, 값에 따른 색과 크기, 시간 변화, 오류와 재로드를 확인합니다.
4. 기본 예제를 통과하면 [04 원 400개로 확장](../prompts/04-build-20x20.txt) 또는 [05 크기는 고정하고 색만 변화](../prompts/05-build-color-only.txt) 중 하나를 진행합니다.

목표는 위치가 고정된 10×10 원입니다. 값이 커지면 원이 커지고 흰색에 가까워집니다. 값이 낮아지면 원이 작아지고 파란색 비율이 높아집니다. 값 0에서 원이 사라지는 것은 정상입니다.

AI에게 설명만 듣고 끝내지 말고 **실제 TD 화면과 검사 결과**를 확인합니다. 기준 예제는 보존하고 새 Container에서 작업합니다.

## 문제가 생겼을 때

| 보이는 문제 | 먼저 할 일 |
|---|---|
| 설치에서 FAILED | 인터넷과 설치 로그 확인. Mac은 공식 Python 설치 여부 확인 |
| 점검에서 FAILED | TD 예제가 열렸는지 확인하고 로딩 후 다시 점검 |
| CHECK OK인데 AI가 연결 못 함 | AI 등록과 MCP 재시작 확인. 포트는 9987 |
| 다른 파일 이름이 나옴 | 작업 대상을 강사와 확인. 다른 TD 파일과 연결된 채로 제작하지 않기 |
| Mac `.command`가 실행되지 않음 | [Mac 설치 안내](INSTALL_MACOS.md)의 실행 방법을 강사와 확인 |
| 무료 사용량이나 계정 제한에 걸림 | 같은 실습을 짝과 진행하고 요청문·예상 결과·실제 결과를 함께 기록 |

로그는 `AMG_MCP_Class/logs` 폴더에 있습니다. Mac 점검 로그에는 CPU와 macOS 정보도 기록됩니다. 강사에게는 실패한 창과 해당 점검 로그를 전달합니다.
