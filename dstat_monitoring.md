# dstat
```
yum -y install dstat
```

## Total
```bash
dstat -t -d -n $((60*1))
```

## Network
```bash
dstat -tnN total,em4,em1 $((60*60))
```

## Disk
```bash
dstat -tdD total,sda,sdb,sdc,dm-0 $((60*60))
```
