# CIFS mount

## cifs mount command.
```bash
mount -t cifs //192.168.0.x/share  /mnt/cifs -o username=root,password=pass,iocharset=utf8,file_mode=0777,dir_mode=0777
```

## /etc/fstab.
```bash
//192.168.0.x/share  /mnt/cifs  cifs  username=root,password=pass,iocharset=utf8,file_mode=0777,dir_mode=0777  0 0
```
