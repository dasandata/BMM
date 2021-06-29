# 기본 Fan 스피드 정보 확인.

```
[root@spinach:~]# ipmitool sdr type fan

FAN1             | 41h | ok  | 29.1 | 3200 RPM
FAN2             | 42h | ok  | 29.2 | 3200 RPM
FAN3             | 43h | ok  | 29.3 | 3200 RPM
FAN4             | 44h | ok  | 29.4 | 3200 RPM
FAN5             | 45h | ok  | 29.5 | 3200 RPM
FAN6             | 46h | ok  | 29.6 | 3200 RPM
FAN7             | 47h | ok  | 29.7 | 3200 RPM
FAN8             | 48h | ok  | 29.8 | 3200 RPM
FAN9             | 49h | ok  | 29.9 | 3700 RPM
FAN10            | 4Ah | ok  | 29.10 | 3800 RPM

[root@spinach:~]#
```

#  
해당 명령의 마지막 값은 64 = 100 % 및 0 = 최소 속도로 듀티 사이클을 설정합니다. 즉, "0x32"는 50 %입니다. "0x64"는 100 % 듀티 사이클입니다. "0x48"은 75 % 듀티 사이클입니다.

```
[root@spinach:~]#
[root@spinach:~]# ipmitool raw 0x30 0x70 0x66 0x01 0x00 0x64
[root@spinach:~]#
[root@spinach:~]# ipmitool raw 0x30 0x70 0x66 0x01 0x01 0x64
[root@spinach:~]#
[root@spinach:~]# ipmitool raw 0x30 0x70 0x66 0x01 0x02 0x64
[root@spinach:~]#
[root@spinach:~]# ipmitool raw 0x30 0x70 0x66 0x01 0x03 0x64
[root@spinach:~]#
```

```
[root@spinach:~]# ipmitool sdr type fan

FAN1             | 41h | ok  | 29.1 | 11200 RPM
FAN2             | 42h | ok  | 29.2 | 11900 RPM
FAN3             | 43h | ok  | 29.3 | 11100 RPM
FAN4             | 44h | ok  | 29.4 | 12100 RPM
FAN5             | 45h | ok  | 29.5 | 11200 RPM
FAN6             | 46h | ok  | 29.6 | 12100 RPM
FAN7             | 47h | ok  | 29.7 | 11100 RPM
FAN8             | 48h | ok  | 29.8 | 12100 RPM
FAN9             | 49h | ok  | 29.9 | 8600 RPM
FAN10            | 4Ah | ok  | 29.10 | 8800 RPM

[root@spinach:~]#
```
