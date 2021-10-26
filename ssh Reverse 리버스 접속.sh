# http://egloos.zum.com/mcchae/v/11194088

ssh -p17777  -nNT -o TCPKeepAlive=yes  -o ServerAliveInterval=60  -R 12345:127.0.0.1:22  <id>@<remote_hostname>

# 리버스 접속 : SSH를 이용하여 회사쪽에 접속 하여 생성된 터널을 이용하여 회사에서 ssh 접속을 가능하기 위해 사용됨
# -nNT : ssh를 백그라운드에서 실행하며 X11의 접속이 가능하게 하며 포트전송만을 진행하며 가상 단말의 할당을 금지하는 옵션
# -o : 설정 파일과 같은 형식에서 옵션을 주고 싶을때 사용
# TCPKeepAlive=yes, ServerAliveInterval=60 : 연결을 계속 유지하기 위해 60초 마다 시그널을 보내기 위해 사용
# -R 12345:127.0.0.1:22 : Reverse 터널을 사용하며 접속지의 12345라는 포트를 자신의 22 포트에 연결시키는 옵션

ssh -p 12345  root@127.0.0.1

#iDrac - ssl
ssh -p7775  -nNT -o TCPKeepAlive=yes -R 8080:<remote_hostname>:443
