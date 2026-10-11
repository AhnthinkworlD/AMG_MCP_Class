# Mac 사전 점검과 수업 진행

Mac 학생 전원에게 같은 날 처음 설치시키기 전에 한 명과 먼저 설치와 실제 TD 제작을 확인합니다. [GitHub의 Apple Silicon·Intel 원격 검사](MAC_CI_VERIFICATION.md)는 설치 파일 실행·의존성 설치·MCP 서버 시작을 통과했습니다. TD 렌더와 Finder 실행은 별도로 확인합니다.

## 사전 점검 순서

1. Mac 학생 한 명에게 [학생 안내](STUDENT_START.md)와 최신 Release 링크를 보냅니다. Apple Silicon 또는 Intel 중 어떤 CPU인지 확인합니다.
2. 공식 Python 설치 → `01_Install_Mac.command` → INSTALL OK를 확인합니다.
3. 수업 TOE 열기 → `02_Check_Mac.command` → CHECK OK를 확인합니다. 해당 점검 로그를 받습니다. 로그의 CPU·macOS·Python 선택 경로와 TD 빌드·프로젝트명을 읽습니다.
4. Codex에 해당 학생의 생성 설정으로 등록하고 재시작합니다. [연결 프롬프트](../prompts/01-connect.txt)의 결과가 학생이 연 파일을 가리키는지 확인합니다.
5. [제작](../prompts/02-build.txt) → [검증](../prompts/03-check.txt)을 실행합니다. 새 원 100개, 값 0/0.5/1의 크기와 색, 시간 변화, 오류·경고, TOX 재로드를 확인합니다.
6. CPU·macOS·TD·Python·AI 클라이언트 버전과 통과한 단계를 기록합니다. 실제 확인한 조합만 Mac 실기 통과로 표시합니다.

| 점검 | 통과 기준 | 근거 |
|---|---|---|
| 설치 | INSTALL OK | 설치 창과 install 로그 |
| TD 연결 | CHECK OK, 정확한 프로젝트명 | check 로그 |
| AI 연결 | td_begin_session 정상 | AI 응답 |
| 작품 | 위치 100샘플, 실제 원과 색·크기·시간 변화 | TD TOP 캡처와 검사 응답 |
| 재로드 | 저장 TOX가 같은 조건에서 같은 출력 | AI 검사 결과 |

## 학생에게 보낼 사전 점검 요청문

```text
5주차에 Mac에서도 AI와 TouchDesigner를 연결해 실습하려고 합니다.
Mac 사용자 한 분과 수업 전에 설치와 예제 제작을 먼저 확인하려고 해요.
https://github.com/AhnthinkworlD/AMG_MCP_Class/releases/latest 에서 ZIP 전체를 받아 압축을 풀고 docs/STUDENT_START.md를 따라 진행해 주세요.
Mac은 공식 Python을 먼저 설치해야 합니다.
설치 후 INSTALL OK, TD 예제를 연 뒤 점검에서 CHECK OK가 나오는지 확인하고, AMG_MCP_Class/logs의 점검 로그를 보내주세요.
그다음 AI 연결과 원 100개 제작은 함께 확인하겠습니다.
```

## 수업 진행

처음 10~15분은 설치 화면을 한 단계씩 함께 넘깁니다. INSTALL OK 학생 → TD 열기, CHECK OK 학생 → AI 등록, AI 연결 확인 학생 → 제작 순서로 진행합니다. 설치·TD 연결·AI 등록을 한 번에 설명하지 않습니다.

연결에 실패한 학생은 짝과 화면을 공유해 동일 프롬프트를 실행하고, 본인은 원→배치/색/크기 요청문과 성공 조건을 작성합니다. 강사는 실패 로그를 모아 해당 환경의 문제를 해결합니다.

마지막에는 “AI가 설명한 결과”와 “실제 TD에서 확인한 결과”를 비교하게 합니다. 10×10 기본 실습을 통과한 학생만 20×20 또는 색만 변화하는 예제로 확장합니다.
