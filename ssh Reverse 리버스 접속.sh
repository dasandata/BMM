
# http://egloos.zum.com/mcchae/v/11194088

ssh -p7775  -nNT -o TCPKeepAlive=yes  -o ServerAliveInterval=60  -R 12345:127.0.0.1:22  <id>@<remote_hostname>


ssh -p 12345  root@127.0.0.1

#iDrac - ssl
ssh -p7775  -nNT -o TCPKeepAlive=yes -R 8080:<remote_hostname>:443
