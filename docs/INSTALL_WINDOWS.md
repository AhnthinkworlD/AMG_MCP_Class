# Windows — 더블클릭으로 설치하기

1. **TouchDesigner 2025.33230**을 기준으로 수업 예제를 준비한다. 이 빌드에서 실제 제작·실행을 검증했다. Windows는 별도 Python을 미리 설치하지 않아도 된다.
2. GitHub Releases에서 `amg-mcp-class-1.0.3.zip`을 다운로드하고 **모두 압축 풀기**를 한다. ZIP 안에서 BAT만 꺼내지 않는다.
3. `01_Install_Windows.bat`을 더블클릭한다. 인터넷으로 의존성을 설치하므로 첫 실행은 시간이 걸린다. **INSTALL OK**를 기다린다. 관리자 권한은 필요 없다.
4. `touchdesigner/AMG_MCP_Class_10x10.toe`를 열고 로딩이 끝날 때까지 기다린다.
5. `02_Check_Windows.bat`을 더블클릭한다. **CHECK OK**와 내가 연 `project_name`을 확인한다. `protocol_version: 2`, `required_actions_present: true`, `project_children_read: true`가 표시된다.
6. 설치 후 열린 사용자 홈의 `AMG_MCP_Class` 폴더에서 `AI클라이언트_설정.json` 또는 `Codex_설정.toml`을 [AI 등록 안내](CONNECT_AI.md)에 따라 등록한다.
7. AI에서 [연결 프롬프트](../prompts/01-connect.txt)를 사용한 뒤 [제작](../prompts/02-build.txt), [검증](../prompts/03-check.txt)을 진행한다.

기본 설치 위치는 `%USERPROFILE%\AMG_MCP_Class`이며 로그는 그 안 `logs` 폴더에 남는다. Python이 없으면 BAT이 Python.org의 공식 Python 3.13.16 전체 런타임 ZIP을 내려받고 공개 SHA256을 대조한 뒤 `AMG_MCP_Class/python-3.13.16`에 준비한다. 임베디드 Python이 아닌 공식 전체 런타임을 사용한다. 시스템 PATH·기존 Python·TD 내장 Python은 변경하지 않는다. Windows x64에서 검증했다. 인터넷이나 학교 정책이 다운로드를 차단하면 설치 창과 로그에 실패가 표시된다.

TD Bridge는 `/W03_BEGINNER_WATER/AMG_W04`, 포트 **9987**, Active **On**이다. 동일 포트의 TD Bridge는 하나만 켠다. 점검은 현재 프로젝트를 읽고, 기존 노드나 TOE를 저장하지 않는다. 단순 연결 성공으로 10×10 제작 검증이 완료된 것은 아니다.

창에 FAILED가 보이면 로그와 [문제 해결](TROUBLESHOOTING.md)을 확인한다. Windows가 다운로드 경고를 표시하면 본인 강사의 GitHub에서 받은 파일인지 확인하고 제공된 실행 옵션을 따른다. 조직에서 실행을 차단한 경우 정책을 우회하지 말고 담당자에게 문의한다.


Python 자동 준비의 [공식 배포 정보](https://www.python.org/ftp/python/3.13.16/windows-3.13.16.json). 실제 무-Python 설치 검사 결과는 [검증 문서](VERIFICATION.md)에 기록한다.
