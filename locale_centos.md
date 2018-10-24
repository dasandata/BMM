```bash

[dasan@hostname:~]$
[dasan@hostname:~]$ sudo -i
[root@hostname:~]#
[root@hostname:~]# su - dasan
Last login: Sat Jun 23 16:22:27 KST 2018 on pts/1
-bash: warning: setlocale: LC_CTYPE: cannot change locale (en.US.utf8): No such file or directory
-bash: warning: setlocale: LC_COLLATE: cannot change locale (en.US.utf8): No such file or directory
-bash: warning: setlocale: LC_MESSAGES: cannot change locale (en.US.utf8): No such file or directory
-bash: warning: setlocale: LC_NUMERIC: cannot change locale (en.US.utf8): No such file or directory
-bash: warning: setlocale: LC_TIME: cannot change locale (en.US.utf8): No such file or directory
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
	LANGUAGE = (unset),
	LC_ALL = (unset),
	LANG = "en.US.utf8"
    are supported and installed on your system.
perl: warning: Falling back to the standard locale ("C").
[dasan@hostname:~]$
[dasan@hostname:~]$ env | grep LC_
[dasan@hostname:~]$
[dasan@hostname:~]$ logout
[root@hostname:~]#
[root@hostname:~]#
[root@hostname:~]# localectl status
   System Locale: LANG=en.US.utf8
       VC Keymap: us
      X11 Layout: us
[root@hostname:~]#
[root@hostname:~]# cat /etc/locale.conf
LANG=en.US.utf8
[root@hostname:~]#
[root@hostname:~]# vi  /etc/locale.conf
[root@hostname:~]#
[root@hostname:~]# cat /etc/locale.conf
LANG=en_US.utf-8
[root@hostname:~]#
[root@hostname:~]#
[root@hostname:~]# localectl status
   System Locale: LANG=en_US.utf-8
       VC Keymap: us
      X11 Layout: us
[root@hostname:~]#


[root@hostname:~]# logout
[dasan@hostname:~]$
[dasan@hostname:~]$ sudo -i
[sudo] password for dasan:
[root@hostname:~]#
[root@hostname:~]# su - dasan
Last login: Sat Jun 23 16:23:27 KST 2018 on pts/1
[dasan@hostname:~]$
[dasan@hostname:~]$ logout
[root@hostname:~]#
[root@hostname:~]#
[root@hostname:~]# su -  testuser
Last login: Sat Jun 23 16:11:20 KST 2018 on pts/0
[testuser@hostname ~]$
[testuser@hostname ~]$ logout
[root@hostname:~]#
[root@hostname:~]#


```
