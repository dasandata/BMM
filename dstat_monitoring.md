# dstat
```
yum -y install dstat
```

## Network
```bash
dstat -tnN total,em4,em1 $((60*60))
```

## Disk
```bash
dstat -tdD total,sda,sdb,sdc,dm-0 $((60*60))
```
