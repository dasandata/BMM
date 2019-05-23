
## Kernel Version Lock

```bash
[root@dasandata:~]# cat /etc/yum/pluginconf.d/versionlock.list
cat: /etc/yum/pluginconf.d/versionlock.list: 그런 파일이나 디렉터리가 없습니다
[root@dasandata:~]#
[root@dasandata:~]# yum -y install yum-plugin-versionlock

Installed:
  yum-plugin-versionlock.noarch 0:1.1.31-50.el7

Complete!
[root@dasandata:~]#

[root@dasandata:~]# rpm -qa | grep versionlock
yum-plugin-versionlock-1.1.31-50.el7.noarch
[root@dasandata:~]#

[root@dasandata:~]# rpm -ql  yum-plugin-versionlock-1.1.31-50.el7.noarch
/etc/yum/pluginconf.d/versionlock.conf
/etc/yum/pluginconf.d/versionlock.list
/usr/lib/yum-plugins/versionlock.py
/usr/lib/yum-plugins/versionlock.pyc
/usr/lib/yum-plugins/versionlock.pyo
/usr/share/doc/yum-plugin-versionlock-1.1.31
/usr/share/doc/yum-plugin-versionlock-1.1.31/COPYING
/usr/share/doc/yum-plugin-versionlock-1.1.31/README
/usr/share/man/man1/yum-versionlock.1.gz
/usr/share/man/man5/yum-versionlock.conf.5.gz
[root@dasandata:~]#
[root@dasandata:~]# yum versionlock add kernel
Loaded plugins: fastestmirror, langpacks, priorities, versionlock
Adding versionlock on: 0:kernel-3.10.0-957.el7
Adding versionlock on: 0:kernel-3.10.0-957.12.2.el7
Adding versionlock on: 0:kernel-3.10.0-957.12.2.el7_lustre_BIGLAB
versionlock added: 3
[root@dasandata:~]#
[root@dasandata:~]# yum versionlock add kernel-firmware
Loaded plugins: fastestmirror, langpacks, priorities, versionlock
Loading mirror speeds from cached hostfile
 * base: data.aonenetworks.kr
 * epel: mirror01.idc.hinet.net
 * extras: data.aonenetworks.kr
 * updates: ftp.kaist.ac.kr
155 packages excluded due to repository priority protections
versionlock added: 0
[root@dasandata:~]#
[root@dasandata:~]# yum versionlock add kernel-devel
Loaded plugins: fastestmirror, langpacks, priorities, versionlock
Adding versionlock on: 0:kernel-devel-3.10.0-957.12.2.el7_lustre_BIGLAB
versionlock added: 1
[root@dasandata:~]#
[root@dasandata:~]# yum versionlock add kernel-headers
Loaded plugins: fastestmirror, langpacks, priorities, versionlock
Adding versionlock on: 0:kernel-headers-3.10.0-957.12.2.el7_lustre_BIGLAB
versionlock added: 1
[root@dasandata:~]#
[root@dasandata:~]# cat /etc/yum/pluginconf.d/versionlock.list

# Added locks on Wed May 22 18:53:21 2019
0:kernel-3.10.0-957.el7.*
0:kernel-3.10.0-957.12.2.el7.*
0:kernel-3.10.0-957.12.2.el7_lustre_BIGLAB.*

# Added locks on Wed May 22 18:53:44 2019
0:kernel-devel-3.10.0-957.12.2.el7_lustre_BIGLAB.*

# Added locks on Wed May 22 18:53:53 2019
0:kernel-headers-3.10.0-957.12.2.el7_lustre_BIGLAB.*
[root@dasandata:~]#
```
