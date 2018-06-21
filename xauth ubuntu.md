```bash

[user@hostname:~]$
[user@hostname:~]$ su -
Password:
[root@hostname:~]#
[root@hostname:~]#
[root@hostname:~]# firefox  &
[1] 10903
[root@hostname:~]# X11 connection rejected because of wrong authentication.
X11 connection rejected because of wrong authentication.
Failed to connect to Mir: Failed to connect to server socket: No such file or directory
Unable to init server: Broadway display type not supported: localhost:10.0
Error: cannot open display: localhost:10.0

[1]+  Exit 1                  firefox
[root@hostname:~]#
[root@hostname:~]# xauth -f /home/user/.Xauthority list | tail -1
hostname/unix:10  MIT-MAGIC-COOKIE-1  6b15134e5e96b2b24e4487c7ffd9dd8a
[root@hostname:~]#
[root@hostname:~]# xauth list
hostname/unix:10  MIT-MAGIC-COOKIE-1  779e286c00dcd8b3e403e4d5bdbb02ba
[root@hostname:~]# xauth add $(xauth -f /home/user/.Xauthority list | tail -1)
[root@hostname:~]#
[root@hostname:~]# firefox  &
[1] 10930
[root@hostname:~]#
[root@hostname:~]# xauth list
hostname/unix:10  MIT-MAGIC-COOKIE-1  6b15134e5e96b2b24e4487c7ffd9dd8a
[root@hostname:~]#

```
