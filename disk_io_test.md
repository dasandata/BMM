# 리눅스 디스크 쓰기 성능 측정  
## 1GB 연속 쓰기 테스트 (스루풋)
```
dd if=/dev/zero bs=1G count=1 of=write_1GB_test
```
## 1MB씩 1024회 쓰기 테스트 (레이턴시)
```
dd if=/dev/zero bs=1M count=1024 of=write_1GB_test
```
## 실행예시  
> [kite@kite-centos7:~]$  
[kite@kite-centos7:~]$ df -hT | grep -v tmpfs  
Filesystem              Type      Size  Used Avail Use% Mounted on  
**/dev/mapper/centos-root xfs        45G  7.1G   38G  16% /**  
/dev/sda1               xfs       497M  246M  252M  50% /boot  
**file:/file              nfs       3.7T  2.3T  1.5T  61% /nfs/file**  
[kite@kite-centos7:~]$  
[kite@kite-centos7:~]$ mkdir temp
[kite@kite-centos7:~]$ cd temp/
[kite@kite-centos7:temp]$
[kite@kite-centos7:temp]$ pwd
/home/kite/temp
[kite@kite-centos7:temp]$ **LocalDrive 1GB 연속 쓰기 테스트 (스루풋)**  
[kite@kite-centos7:temp]$ dd if=/dev/zero bs=1M count=1024 of=write_1GB_test  
1024+0 records in  
1024+0 records out  
1073741824 bytes (1.1 GB) copied, 0.842964 s, **1.3 GB/s**  
[kite@kite-centos7:temp]$  
[kite@kite-centos7:temp]$ **LocalDrive 1MB씩 1024회 쓰기 테스트 (레이턴시)**   
[kite@kite-centos7:temp]$ dd if=/dev/zero bs=1M count=1024 of=write_1GB_test  
1024+0 records in  
1024+0 records out  
1073741824 bytes (1.1 GB) copied, 1.06545 s, **1.0 GB/s**  
[kite@kite-centos7:temp]$  
[kite@kite-centos7:temp]$  
[kite@kite-centos7:temp]$ cd  
[kite@kite-centos7:~]$ cd /file  
[kite@kite-centos7:file]$  
[kite@kite-centos7:file]$ mkdir temp/  
[kite@kite-centos7:file]$ cd temp  
[kite@kite-centos7:temp]$ pwd  
/file/temp  
[kite@kite-centos7:temp]$  
[kite@kite-centos7:temp]$ **NFS Drive 1GB 연속 쓰기 테스트 (스루풋)**  
[kite@kite-centos7:temp]$ dd if=/dev/zero bs=1G count=1 of=write_1GB_test  
1+0 records in  
1+0 records out  
1073741824 bytes (1.1 GB) copied, 113.364 s, **9.5 MB/s()*  
[kite@kite-centos7:temp]$  
[kite@kite-centos7:temp]$ **NFS Drive 1MB씩 1024회 쓰기 테스트 (레이턴시)**  
[kite@kite-centos7:temp]$ dd if=/dev/zero bs=1M count=1024 of=write_1GB_test  
1024+0 records in  
1024+0 records out  
1073741824 bytes (1.1 GB) copied, 106.684 s, **10.1 MB/s**  
[kite@kite-centos7:temp]$  
[kite@kite-centos7:temp]$  
