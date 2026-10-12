# AMG_MCP — 학생용 설치 패키지

## 학생은 이 안내 하나로 시작하세요

**[5주차 사전 준비 · Windows/Mac 설치부터 Codex 연결까지](docs/STUDENT_START.md)**

위 페이지에서 준비 PDF와 수업 ZIP을 받고, 본인 운영체제의 설치·점검·Codex 등록·연결 확인 순서로 진행합니다. 제작·검사는 수업 시간에 함께 합니다.

## 2026-10-12 최신 TD 2025.33230

현재 수업 기준과 예제는 **2025.33230 Official**입니다. 최신 버전에서 예제3종과 저장 TOE 새 실행을 검사했습니다. [최신 실제 검증](docs/TD_LATEST_VERIFICATION.md). 아래32820 기록은 이전 제작 이력입니다.


## 학생은 여기부터 시작

[학생 설치와 첫 실습 안내](docs/STUDENT_START.md)를 먼저 읽습니다. [최신 Release](https://github.com/AhnthinkworlD/AMG_MCP_Class/releases/latest)에서 **amg-mcp-class-1.0.4.zip** 전체를 받습니다. 수업은 로컬 STDIO MCP를 지원하는 AI에서 진행하며, 등록 UI는 실제 확인한 Codex 예시를 제공합니다.

강사는 [Mac 사전 점검과 수업 진행](docs/TEACHER_MAC_CHECK.md), [복사해서 전달할 학생 공지](학생공지_복사해서전달.txt)를 사용합니다.


5주차는 기존 AMG_MCP 1.0 / protocol 2를 사용한다. 개발 중인 새 앱과 별개다.

**TD 기준: TouchDesigner 2025.33230.** 실제 제작·실행 검증을 이 빌드에서 수행했다. 다른 빌드의 전체 호환성은 별도 확인한다.

**준비:** TouchDesigner, MCP를 지원하는 AI 클라이언트, 인터넷 연결. Windows는 Python이 없어도 설치 BAT이 공식 Python 3.13.16을 수업용 폴더에 자동 준비한다. 이미 실행 가능한 Python 3.10+가 있으면 사용한다. Mac은 [공식 Python 설치본](https://www.python.org/downloads/macos/)을 먼저 설치한다.

GitHub Releases의 `amg-mcp-class-1.0.4.zip`을 받고 **압축을 모두 푼다.**

| 순서 | Windows | Mac |
|---|---|---|
| 1. 설치 | `01_Install_Windows.bat` 더블클릭 | `01_Install_Mac.command` 더블클릭 |
| 2. TD 열기 | `touchdesigner/AMG_MCP_Class_10x10.toe` 더블클릭 | 같은 TOE 열기 |
| 3. 연결 확인 | `02_Check_Windows.bat` 더블클릭 | `02_Check_Mac.command` 더블클릭 |
| 4. AI 등록 | 설치 후 열린 폴더의 설정 파일 등록 | 설치 후 열린 폴더의 설정 파일 등록 |

설치 화면에서 **INSTALL OK**, 연결 점검에서 **CHECK OK**가 나오면 다음 단계로 진행한다.
점검 화면의 `project_name`이 내가 연 TD 파일인지 확인한다. 연결 성공과 작품 제작 성공은 별도로 확인한다.
설치/점검 창은 Enter를 누를 때까지 남는다. 실패 로그는 사용자 홈 `AMG_MCP_Class/logs` 폴더에 저장된다.

- [Windows 자세한 안내](docs/INSTALL_WINDOWS.md)
- [Mac 자세한 안내·실행이 차단될 때](docs/INSTALL_MACOS.md)
- [AI 등록 방법](docs/CONNECT_AI.md)
- [문제 해결](docs/TROUBLESHOOTING.md)
- [강사용 검증 결과](docs/VERIFICATION.md)
- [GitHub 게시 방법](docs/PUBLISH.md)

설치는 사용자 홈의 가상환경에 서버를 넣고 AI 설정 예시를 생성한다. **AI 클라이언트 등록은 마지막에 직접 해야 한다.** 기존 AI 설정은 자동으로 덮어쓰지 않는다. Mac은 TOP 미리보기·네이티브 노드 조작을 사용하며 Windows용 창 캡처·자동 입력은 지원하지 않는다.

Mac 더블클릭 파일은 Release ZIP에 실행 권한을 넣었다. Code → Download ZIP에서 권한이 없어졌다면 Mac 안내의 터미널 대안을 사용한다. Windows 실제 설치·MCP 연결 결과와 Mac 실기 미검증을 구분해 검증 문서에 기록한다.


## 복사해서 사용할 제작 프롬프트

[연결→제작→검증→변형 프롬프트](docs/EXAMPLE_PROMPTS.md)와 [새 전문의 실제 제작 검증 결과](docs/W05_PROMPTS_V6_VERIFICATION.md)를 추가했다. 100개·400개·색만 변화 예제 3종의 완성 TOX와 실제 TOP 캡처를 포함한다.


## 2026-10-12 새 TD 시작 연결 수정

연결 수정은 **1.0.1**에 적용됐으며 최신 학생 배포는 **1.0.2**다. 저장된 콜백 이름의 대소문자 참조를 수정하고 새 TD 프로세스·9987 MCP 시작·렌더·Bridge 재로드를 통과했다. [수정 및 실제 검증 범위](docs/CONNECTION_VERIFICATION_1.0.1.md). 이전 9981 실패 기록은 당시 상태이며 현재 저장 설정은 9987이다. 실행 중이던 AI 연결에는 재시작이 필요하다. Mac 실기 미검증은 유지한다.


## 1.0.2 학생 안내와 Mac 설치 보강

학생 공지·설치·AI 등록·첫 실습을 정리했습니다. Mac은 기존 수업 Python 재사용과 PATH 차이를 처리하고 CPU·OS 정보를 로그에 남깁니다. [원격 검사와 실기 점검 범위](docs/MAC_CI_VERIFICATION.md).


## 실제 OS 설치 검사 결과

Windows·Apple Silicon·Intel Mac의 설치와 MCP 서버 시작을 [원격에서 통과했습니다](docs/MAC_CI_VERIFICATION.md). Mac TD 실습은 사전 점검이 남아 있습니다.


## 5주차 요청문 v6

학생이 배치·색·크기·완료 기준을 설명하고 AI가 기준 예제를 읽어 MCP로 구현하는 전문으로 갱신했습니다. [5개 요청문의 실행 결과](docs/W05_PROMPTS_V6_VERIFICATION.md)를 확인합니다. 1.0.4는 프롬프트·수업 안내·검증 예제 추가이며 기존 설치 스크립트와 서버 wheel은 유지합니다.
