# 강사용 GitHub 배포와 Mac 검사

## 저장소에 올리기

이 배포 폴더의 **내용물**을 기존 AMG_MCP 배포 저장소 루트에 올린다. README, docs, install.py, 서버 wheel, touchdesigner, prompts, tests, .github 등을 같은 구조로 유지한다. 개인 계정 설정·가상환경·선호 DB는 포함하지 않는다. 개발 중인 새 앱 저장소와 구분한다.

저장소 URL은 아직 지정되지 않아 다운로드 안내는 저장소의 Releases 메뉴를 기준으로 작성했다. 특정 저장소나 브랜치를 추정해 원격 게시하지 않았다.

## 학생용 Release

GitHub Releases에서 새 릴리스를 만들고 `amg-mcp-class-1.0.3.zip`을 Assets에 올린다. 릴리스 설명에 Windows/Mac 안내를 연결한다. 저장소 기본 ZIP도 지원하지만 학생에게는 이 고정 패키지를 안내하는 것이 좋다.

## Mac 컴퓨터 없이 검사하기

저장소 기본 브랜치에 `.github/workflows/install-check.yml`을 올린 뒤 Actions → AMG MCP install check → Run workflow를 선택한다. 수동 실행이며 정기 모니터나 자동 배포가 아니다.

Windows, Mac Apple Silicon, Mac Intel에서 Python 3.11 설치, 가상환경 설치·서버 import·설정 생성·MCP stdio 서버 시작을 검사한다. [GitHub 공식 runner 목록](https://docs.github.com/en/actions/reference/runners/github-hosted-runners)

**이 CI에는 TouchDesigner가 없으므로 실제 TD 실행·노드 제작·렌더 검증은 하지 않는다.** GitHub에서 실행하기 전에는 CI 통과로 보고하지 않는다. TD 실기는 Mac 학생 1~2명에게 INSTALL_MACOS의 사전 점검을 진행하도록 요청한다.

## 배포 전 확인

- Windows 설치 안내와 체크 명령이 통과한다.
- GitHub의 두 Mac 설치 검사 결과를 확인한다.
- Mac 학생의 실제 TD 제작·TOP 확인·TOX 저장/재로드 결과를 기록한다.
- 사용자가 다운받을 수 있는 저장소/Release 접근 권한을 확인한다.

설치 검사와 TD 실기 검사 상태를 릴리스 설명에 구분해 적는다.
