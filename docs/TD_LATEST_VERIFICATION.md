# 최신 TouchDesigner 수업 기준과 실제 검증

현재 수업 기준은 **TouchDesigner 2025.33230 Official**입니다. 2026-10-12 [공식 다운로드](https://derivative.ca/download)에서 Windows·Mac 최신 정식 버전을 확인했습니다. 기존 AMG 서버1.0.0/protocol2를 그대로 사용하며 새 앱 개발판과 구분합니다.

## Windows 실제 검증

공식 설치 파일의 Derivative 서명을 확인하고 별도 경로에 최신 TD를 준비했습니다. 이전 버전은 보존했습니다. 기존에 실행하던 수업 검사 사본은 TOE 백업 후 최신 검사 프로세스로 교체했습니다. 사용자 원본4주차 TOE는 변경하지 않았습니다.

최신 TD에서 새 10×10 예제를 만들고, 20×20·크기고정색변화 예제를 검사했습니다. 샘플100/400/100, 실제 원 개수, 값0/0.5/1의 크기·색, 한셀대응, 시간3장, TOX재로드 차이0, 각 최종네트워크 오류0·경고0을 확인했습니다. 기본 예제는8노드 새생성과 기준geo/Noise 재사용이며 임의 빈 프로젝트의 무참조 생성이라고 주장하지 않습니다.

Bridge·TOE·TOX3종을 최신 TD로 저장했습니다. 학생 시작 TOE에는 Bridge와 기준 예제만 두었습니다. 저장 TOE를 **새 최신 TD 프로세스에서 다시 열고** 프로젝트·빌드·protocol2·100샘플·오류경고0을 확인했습니다. 실제 Codex 등록 MCP도 최신 TD에 연결됐습니다.

[실제 수치](../verification/td-latest-2025.33230.json)

![최신 TD 실제 출력](../verification/TD33230-animation-1.png)

## Mac 범위

Mac 설치와 MCP 서버 시작은 [Apple Silicon·Intel 원격 검사](MAC_CI_VERIFICATION.md)를 통과했습니다. **최신 TD의 Mac 실물 실행·렌더·Finder 더블클릭은 아직 미검증**입니다. Intel은 공식 페이지의 별도 AMD GPU 조건을 확인합니다. [Mac 사전 점검](TEACHER_MAC_CHECK.md)으로 실제 학생 장비를 확인합니다.

## 버전이 다시 올라오면

학생은 다운로드 페이지의 Official 최신 버전을 확인합니다. 현재 기록은2025.33230의 실행 근거이며, 이후 모든 버전의 호환을 보장하지 않습니다. 설치 후 TD About과 연결 점검 로그의 실제 빌드를 함께 읽습니다.
