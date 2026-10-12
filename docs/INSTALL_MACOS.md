# Mac — 실행 파일로 설치하기

1. macOS 13 이상에서 CPU에 맞는 TouchDesigner 2025를 준비한다. 수업 제작·Windows 실행 검증 기준은 **2025.33230**이며 Mac에서 해당 빌드의 실기는 미검증이다. [Derivative 안내](https://derivative.ca/UserGuide/MacOS)
2. 별도 [Python 3.14.7 공식 Mac 설치본](https://www.python.org/ftp/python/3.14.7/python-3.14.7-macos11.pkg)을 설치한다. Universal2는 Apple Silicon과 Intel을 지원한다. 공식 Python의 `/Applications/Python 버전/Install Certificates.command`도 실행한다. [Python 안내](https://docs.python.org/3/using/mac.html)
3. GitHub **Releases**의 `amg-mcp-class-1.0.3.zip`을 내려받아 전부 압축을 푼다.
4. `01_Install_Mac.command`를 더블클릭하고 **INSTALL OK**를 기다린다.
5. `touchdesigner/AMG_MCP_Class_10x10.toe`를 열고 로딩을 기다린다.
6. `02_Check_Mac.command`를 더블클릭한다. **CHECK OK**와 내가 연 `project_name`, `protocol_version: 2`, `required_actions_present: true`, `project_children_read: true`를 확인한다.
7. 설치 후 열린 `~/AMG_MCP_Class` 폴더의 설정 파일을 [AI 등록 안내](CONNECT_AI.md)에 따라 등록한다. [연결](../prompts/01-connect.txt) → [제작](../prompts/02-build.txt) → [검증](../prompts/03-check.txt) 프롬프트 순서로 실습한다.

가상환경 설치는 관리자 권한이나 Homebrew가 필요 없다. Python 설치의 권한은 학교 관리 정책을 따른다. 설치 로그는 `~/AMG_MCP_Class/logs`에 저장한다. 연결 성공과 실제 작품 제작 성공은 구분한다.

## 더블클릭이 실행되지 않을 때

Code → Download ZIP 또는 Git 클론은 실행 권한이 없을 수 있다. Terminal에서 `cd `를 입력하고 압축을 푼 폴더를 끌어 넣어 Enter를 누른 뒤 다음을 복사한다.

```sh
bash ./01_Install_Mac.command
```

TD 예제를 연 뒤 점검한다.

```sh
bash ./02_Check_Mac.command
```

macOS 보안 경고가 보이면 본인 강사의 GitHub 파일인지 확인한다. 시스템 설정 → 개인정보 보호 및 보안에서 허용된 실행 옵션을 사용한다. 학교 정책으로 차단된 경우 담당자에게 문의한다. Gatekeeper를 전역 비활성화하지 않는다.

Bridge는 `/W03_BEGINNER_WATER/AMG_W04`, 포트 **9987**, Active **On**이다. 같은 포트의 Bridge는 하나만 켠다. Mac은 Win32 창 캡처·키보드·마우스 자동 입력을 사용하지 않으며 `td_preview_top`과 네이티브 노드 조작으로 실습한다.

**현재 검증 범위:** [Apple Silicon·Intel의 실제 원격 Mac 설치와 MCP 서버 시작](MAC_CI_VERIFICATION.md)을 통과했다. 두 환경의 Python은 3.14.7이다. 개인 Mac의 Finder 더블클릭 및 TouchDesigner 제작·렌더 검사는 아직 수행하지 않았다. 강사에게 CPU, macOS·TD·Python 버전과 `logs`의 연결 점검 로그를 전달하면 해당 Mac 상태를 확인할 수 있다.


설치 파일은 기존 수업 가상환경, 설치된 Python 배포본과 PATH의 실행 가능한 Python 3.10 이상을 확인합니다. Apple의 `/usr/bin/python3` 설치 유도용 실행 파일은 사용하지 않습니다. 점검 로그에는 CPU·macOS 정보와 선택한 Python 경로를 기록합니다.
