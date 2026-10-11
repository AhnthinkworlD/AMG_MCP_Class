# Windows와 Mac 원격 설치 검증

패키지 1.0.2는 기존 AMG 서버 1.0.0과 연결 수정 Bridge를 사용합니다. Mac 설치 파일의 Python 선택과 점검 로그를 보강하고 학생 공지·설치·실습 안내를 추가했습니다.

## 검증 범위

GitHub Actions에서 Windows, Apple Silicon Mac, Intel Mac의 설치 파일·가상환경·설정 생성·패키지 해시·MCP stdio 서버 시작을 확인합니다. 실제 runner의 CPU·OS·Python·의존성 버전과 설치 로그를 artifact로 저장합니다.

현재 원격 실행 결과는 준비 중입니다. 실행 완료 후 이 문서에 실제 결과와 run 링크를 기록합니다.

Mac의 Finder 더블클릭, TouchDesigner 실행·렌더·AI를 통한 실제 제작은 별도 실기 점검입니다. 강사는 [Mac 사전 점검](TEACHER_MAC_CHECK.md)을 사용합니다. Windows TD의 실제 제작·새 시작 근거는 [예제 검사](EXAMPLE_VERIFICATION.md)와 [연결 수정 검사](CONNECTION_VERIFICATION_1.0.1.md)입니다.
