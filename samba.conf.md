```bash

[sonic]
comment = user account
path = /home/sonic
valid users = sonic
writable = yes
create mask = 0644
directory mask = 0755


[homes]
comment = Home Directories
path = /home/%S
valid users = %S
browseable = no
guest ok = no
writable = yes
create mask = 770
directory mask = 770


[MiSeq34_Run]
    path = /data
    writable = yes
    guest ok = yes
    guest only = yes
    create mode = 0777
    directory mode = 0777


```

# Windows cmd 창에서
```bash
net use  
net use * /delete  
```

# 2020.03 add
```bash
[global]
        workgroup = WORKGROUP
        security = user

        passdb backend = tdbsam
        map to guest = Bad User
        printing = cups
        printcap name = cups
        load printers = yes
        cups options = raw

        unix charset = UTF-8
        dos charset = CP932

[data]
    path = /data
    writable = yes
    guest ok = yes
    guest only = yes
    create mode = 0777
    directory mode = 0777
```
