# 강사용 검증 결과 — 2026-10-11

| 검사 | 결과 |
|---|---|
| ZIP을 풀고 Windows BAT으로 새 가상환경 설치 | 통과 |
| 한글·공백·대괄호가 있는 다운로드/설치 경로 | 통과 |
| 잘못된 기본 py 경로를 피하고 실행 가능한 Python 선택 | 통과 |
| MCP 서버 import·stdio 시작·55개 도구 조회 | 통과 |
| 설치된 서버 → 실제 실행 중인 TD → Root·버전 조회 | 통과 |
| 필수 액션·TOP 미리보기 도구·프로젝트 자식 읽기 | 통과 |
| TD 연결 실패 시 FAILED와 실패 종료 코드 | 통과 |
| 기존 설치를 다시 실행 | 통과 |
| 연결 결과가 포함된 사용자 홈 로그 저장 | 통과 |
| OS 설정·배포 파일 해시 단위 검사 4개 | 통과 |
| Mac 셸 구문·인자 전달·성공/실패 전달 | 통과 — Windows의 Git Bash에서 검사 |
| Release ZIP의 Mac 실행 권한 | 확인 |
| 실제 Mac Finder 더블클릭·Python 설치·TD 제작 | 미검증 |
| GitHub Actions Windows/Apple Silicon/Intel | 실행 준비 완료, 원격 실행 전 |

Windows 검사는 기존 Python 3.11 환경과 자동 준비한 Python 3.13.16 환경에서 수행했다. MCP 2.3.0, TD 2025.32820 / AMG protocol 2를 사용했다. BAT의 연결 점검으로 현재 실행 중인 `W04_통합인터랙션_클릭수정.1.toe`를 읽었다. 사용자 프로젝트를 변경하거나 저장하지 않았다.

기존 10×10 제작·TOP 출력·값/시간 변화·TOX 재로드 검증을 재사용한다. 이번 변경은 설치 진입 파일이며 실습 네트워크는 변경하지 않았다. 배포된 wheel/TOX/TOE는 기존 배포와 해시가 동일하다.

Mac에서 같은 결과를 얻었다고 보고하지 않는다. 저장소 업로드 후 Actions → AMG MCP install check → Run workflow로 실제 Windows·Apple Silicon·Intel의 설치 파일과 MCP stdio 시작을 검사할 수 있다. GitHub 러너에는 수업 TD가 없으므로 별도 Mac 학생 1명 이상의 `02_Check_Mac.command`와 제작·저장/재로드 검사가 필요하다.

Windows 로그는 `%USERPROFILE%\AMG_MCP_Class\logs`, Mac 로그는 `~/AMG_MCP_Class/logs`에 남는다. 설치 후 AI 서버 등록은 별도 단계다.


## Python이 없는 Windows 학생 PC를 위한 추가 검증

Python 실행 경로를 PATH에서 제거하고 외부 Python/py 검색을 차단한 상태에서 전체 배포 ZIP을 풀어 BAT을 실행했다. 공식 Python 3.13.16 전체 런타임 ZIP을 다운로드하고 [공식 manifest](https://www.python.org/ftp/python/3.13.16/windows-3.13.16.json)의 SHA256과 비교한 뒤 사용자 수업 폴더에 준비했다. 시스템 Python, 레지스트리, PATH와 TD 내장 Python은 변경하지 않는다.

- 자동 Python 준비 → 가상환경 → 서버 설치 → AI 설정 생성: 통과.
- 준비한 Python 3.13.16으로 실제 TD MCP 연결·55개 도구·필수 액션·프로젝트 Root 조회: 통과.
- 같은 BAT 재실행 시 준비한 가상환경을 재사용하고 Python 재다운로드 생략: 통과.
- 설치 전 점검 파일 실행 시 다운로드 없이 실패 안내: 통과.
- TD 연결 실패 시 실패 종료 코드와 로그: 통과.
- 손상된 다운로드 ZIP은 해시 불일치로 실행·압축 해제 전에 차단: 통과.

검사 경로에 한글·공백·대괄호가 포함됐다. 근거 `.build/w05-python/verification.json`과 검사 로그. Mac은 Python 사전 설치가 필요하며 실제 Mac 검증은 여전히 미완료다.


## MCP 제작 기능·프롬프트 검증 추가

[최신 실제 제작 검증](EXAMPLE_VERIFICATION.md): 10×10/20×20/크기고정 색변화의 새 예제 3종. CHOP·실제 원·값0/0.5/1·셀 대응·시간·TOX 재로드를 검사했다. 포트9987 배포본 통과와 현재등록9981의 구버전 연결 실패를 구분한다. Mac실기미검증유지.


## 2026-10-12 새 TD 시작 연결 수정

최신 학생 배포는 **1.0.1**이다. 저장된 콜백 이름의 대소문자 참조를 수정하고 새 TD 프로세스·9987 MCP 시작·렌더·Bridge 재로드를 통과했다. [수정 및 실제 검증 범위](CONNECTION_VERIFICATION_1.0.1.md). 이전 9981 실패 기록은 당시 상태이며 현재 저장 설정은 9987이다. 실행 중이던 AI 연결에는 재시작이 필요하다. Mac 실기 미검증은 유지한다.


## 1.0.2 학생 안내와 Mac 설치 보강

학생 공지·설치·AI 등록·첫 실습을 정리했습니다. Mac은 기존 수업 Python 재사용과 PATH 차이를 처리하고 CPU·OS 정보를 로그에 남깁니다. [원격 검사와 실기 점검 범위](MAC_CI_VERIFICATION.md).
