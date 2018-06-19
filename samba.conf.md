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
net use
net use * /delete
