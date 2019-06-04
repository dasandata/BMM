# CIFS mount

## cifs mount command.
```bash
mount -t cifs //192.168.0.x/share  /mnt/cifs -o username=root,password=pass
```

## /etc/fstab.
```bash
//192.168.0.x/share  /mnt/cifs  cifs  username=root,password=pass  0 0
```
