# Windows와 Mac 원격 설치 검증

**패키지 1.0.2의 Windows·Apple Silicon Mac·Intel Mac 설치와 MCP 서버 시작을 실제 원격 환경에서 통과했습니다.**

[GitHub Actions 실행 결과](https://github.com/AhnthinkworlD/AMG_MCP_Class/actions/runs/38157778464) · [환경별 수치](../verification/ci-install-1.0.2.json)

| 환경 | OS 버전 | CPU | 설치된 Python | MCP | 설치와 서버 시작 |
|---|---|---|---|---|---|
| Apple Silicon Mac | 14.8.9 | arm64 | 3.14.7 | 2.3.0 | 통과 |
| Intel Mac | 15.7.9 | x86_64 | 3.14.7 | 2.3.0 | 통과 |
| Windows | 2025Server | AMD64 | 3.13.16 | 2.3.0 | 통과 |

## 확인한 범위

실제 설치 진입 파일 실행, 의존성 설치, 가상환경 생성, OS별 AI 설정 생성, 패키지 해시와 단위검사 4개, MCP stdio 초기화·도구 55개 조회를 확인했습니다. Windows는 외부 Python 선택을 차단한 자동 런타임 준비 경로를 사용했습니다. Mac은 설치된 Python을 찾아 실행했으며 두 환경 모두 Python 3.14.7을 선택했습니다. Python 없는 Mac의 자동 설치는 제공하지 않습니다.

각 runner의 실제 CPU·OS·Python·MCP·httpx 정보와 설치 로그는 해당 실행의 artifact에 남겼습니다. 클래스 Python 선택과 실패 종료·로그 처리는 Windows Git Bash fixture에서도 별도로 검사했습니다. 이 fixture를 Mac 실기 결과로 계산하지 않습니다.

## 아직 남은 실제 수업 점검

**Mac의 Finder 더블클릭·TouchDesigner 실행·렌더·AI를 통한 원 100개 제작은 아직 미검증입니다.** 원격 Actions에는 TD를 설치하거나 렌더하지 않았습니다. 강사는 수업 전에 Mac 학생 한 명과 [사전 점검 절차](TEACHER_MAC_CHECK.md)를 진행합니다. Apple Silicon에서 실습이 통과했다고 Intel TD 전체 호환으로 확대하지 않습니다.

Windows TD 2025.32820의 실제 제작·값과 시간 변화·저장 재로드 근거는 [예제 검사](EXAMPLE_VERIFICATION.md)와 [연결 수정 검사](CONNECTION_VERIFICATION_1.0.1.md)입니다. 서버 wheel은 기존 AMG_MCP 1.0.0/protocol 2이며 Bridge의 콜백 참조는 연결 수정본을 사용합니다.

학생에게는 [설치와 첫 실습](STUDENT_START.md)을 안내합니다. AI에 등록한 후 재시작해야 연결되며, 설치 점검과 AI 등록을 별개 단계로 확인합니다.
