# 연결 문제 해결

| 증상 | 조치 |
|---|---|
| Python 명령 없음 / 버전이 3.10 미만 | 별도 Python을 설치하고 터미널을 다시 연다. |
| wheel 파일 없음 | ZIP을 완전히 풀고 install.py와 서버 wheel이 같은 폴더에 있는지 확인한다. |
| 패키지 다운로드 실패 | 인터넷·Python 버전을 확인하고 오류 문구를 강사에게 전달한다. |
| Connection refused | TD 실행, Web Server Active, Port 9987을 확인한다. |
| unknown_action: get_capabilities | 구형 0.9/protocol1 브리지다. 이 배포의 TOX와 포트로 연결한다. |
| 다른 프로젝트가 응답 | 실제 인스턴스·프로젝트명과 포트 충돌을 확인한다. |
| 터미널 점검 성공, AI에 도구 없음 | AI 설정 등록과 MCP 재연결을 확인한다. |
| Mac의 Win32/ctypes 오류 | 창 캡처·자동 입력 도구를 호출하지 말고 td_preview_top을 사용한다. |
| Server and TD AMG_HOME differ | 사용자 지정 AMG_HOME이 있다면 두 프로세스에 같은 값을 적용한다. |

포트를 바꿀 때는 TD Web Server와 생성된 AI 설정의 TD_MCP_URL을 함께 바꾼다. Windows 점검은 `-Port 새포트`, Mac 점검은 `--port 새포트`로 실행한다. 사용자 원본을 보존하고 오류를 해결한 후 다시 확인한다.
