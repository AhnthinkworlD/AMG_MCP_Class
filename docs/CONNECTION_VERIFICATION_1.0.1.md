# 새 TD 실행·Bridge 연결 수정 검증 — 2026-10-12

학생 배포 최신본은 **amg-mcp-class-1.0.1.zip**이다. 서버 wheel은 기존 AMG_MCP 1.0.0 / protocol 2를 사용한다.

## 수정과 원인

2026-10-11 검사는 이미 열린 TD의 Bridge에서 통과했다. 2026-10-12 배포 TOE를 새 프로세스로 열자 HTTP 404가 발생했다. 저장된 Web Server의 Callbacks 설정은 `webserver_callbacks`였지만 실제 콜백 DAT 이름은 `Webserver_callbacks`였다. 배포 Bridge TOX와 연결 TOE에서 이 참조 하나를 수정했다. 공식 toeexpand/toecollapse로 다시 구성하고 모든 다른 저장 노드·파라미터·스크립트 payload의 바이트가 동일함을 재읽어 확인했다. 이전 파일은 제작 기록과 이전 ZIP으로 보존했다.

## 실제 확인

- Windows / TD 2025.32820에서 수정 TOE를 **새 TD 프로세스**로 실행했다.
- 현재 Codex 설정을 읽어 새 표준 MCP stdio 프로세스에서 9987 세션·health·버전·지원 기능 조회를 통과했다. 도구 목록은 55개이며 전체 55개 기능 시험은 아니다.
- 기준 10×10의 tx/ty/tz 각 100샘플, 1280×1280 실제 렌더 3장과 시간 변화, 기준 네트워크 오류 0·경고 0을 확인했다.
- 수정 Bridge TOX를 허용된 components 경로에서 재로드했다. 검사 중 포트 9988로 분리해 protocol 2 세션을 실제 시작했으며 오류 0·경고 0이었다. 검사 Bridge는 제거했다.
- Root 전체 요약 검사는 노드 수 제한으로 truncated=true였다. 오류 0·경고 0은 **별도로 끝까지 검사한 기준 예제와 재로드 Bridge**의 결과다.
- Python wheel, 설치 코드, 완성 예제 3종, PPT/PDF, 사용자 원본 4주차 TOE는 변경하지 않았다.

[수치와 변경 해시](../verification/connection-1.0.1.json)

![새 TD 시작 후 실제 렌더](../verification/fresh-start-1.0.1-1.png)

## AI 재연결

제작자 PC의 `amg_td` 저장 설정은 9981 → 9987로 수정했고 다른 설정과 실행 명령은 보존했다. 이 대화에 이미 실행 중인 MCP 프로세스는 여전히 9981을 사용했다. **AI 설정을 저장하는 것과 현재 연결을 재시작하는 것은 별도다.** 설정의 MCP 서버 화면에서 amg_td를 재시작한 뒤 [연결 프롬프트](../prompts/01-connect.txt)를 사용한다. 재시작 항목이 없는 클라이언트는 해당 클라이언트를 재실행한다. [OpenAI 공식 설정 안내](https://learn.chatgpt.com/docs/extend/mcp?surface=cli)

Mac 실기와 GitHub Actions 원격 실행은 여전히 미검증이다. 위 결과를 Mac 전체 통과나 다른 AI의 첫 시도 재현 성공으로 확대하지 않는다.
