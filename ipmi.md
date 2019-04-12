# IPMI setup to [ Dell | SuperMicro | Intel ] Server.
dasandata 2019-04.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## 목적.
다양한 제조사의 하드웨어가 섞여 있는 환경에서 특정 제조사의 관리 명령 (예를 들어 Dell Racadm 같은) 이 아닌 여러 서버 제조사가 표준으로 지원하는 ipmi (Intelligent Platform Management Interface) 를 통해 서버들의 상태를 원격지에서 모니터링 하고 제어 하기 위해 ipmi interface 의 ip 와 사용자를 설정 하는 내용을 담고 있습니다.

이 문서 작성에 사용된 장비는 [ Dell | SuperMicro | Intel ] 세가지 제조사 제품이며, 운영체제는 CentOS 7 입니다.

## 순서.

1. 하드웨어가 ipmi를 지원하는지 확인.
2. ipmi 설치.
3. 기본 (공통) 명령어.
  3.1 모델 확인
  3.2 ipmi interface의 mode 확인 및 변경.
  3.3 네트워크 설정상태 확인 (lan print).
  3.4 네트워크 설정.
  3.5 사용자 설정.


- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## 1. 하드웨어가 ipmi를 지원하는지 확인.
```bash 
dmidecode  | grep  -A10  IPMI
```
### 출력 예>
> IPMI Device Information
>> Interface Type: KCS (Keyboard Control Style)
        Specification Version: 2.0
        I2C Slave Address: 0x10
        NV Storage Device: Not Present
        Base Address: 0x0000000000000CA2 (I/O)
        Register Spacing: Successive Byte Boundaries

> Handle 0x0023, DMI type 16, 23 bytes
> Physical Memory Array
>> Location: System Board Or Motherboard

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## 2. ipmi 설치.

### # CentOS7.x
```bash
yum install ipmitool
```

### # Ubuntu16,18
```bash
apt-get install ipmitool
```

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## 3. 기본 (공통) 명령어.

### 3.1 클러스터 환경 등, 장비가 여러대일 경우 모델 파악. 
```bash
pdsh  -w compute-0-[0-24]  dmidecode -T system | grep "Product Name:"  | sort -V
```
> compute-0-0: 	Product Name: PowerEdge R730
compute-0-1: 	Product Name: PowerEdge R730
compute-0-2: 	Product Name: PowerEdge R730
compute-0-3: 	Product Name: PowerEdge R730
compute-0-4: 	Product Name: PowerEdge R730
compute-0-5: 	Product Name: Super Server
compute-0-6: 	Product Name: Super Server
compute-0-7: 	Product Name: Super Server
compute-0-8: 	Product Name: S2600CWR
compute-0-9: 	Product Name: S2600CWR
compute-0-10: 	Product Name: S2600CWR
compute-0-11: 	Product Name: S2600CWR
compute-0-12: 	Product Name: Precision Tower 7910
compute-0-13: 	Product Name: PowerEdge R930
compute-0-14: 	Product Name: SYS-4048B-TRFT
compute-0-15: 	Product Name: PowerEdge R730
compute-0-16: 	Product Name: X10DRC
compute-0-17: 	Product Name: PowerEdge R930
compute-0-18: 	Product Name: PowerEdge R940
compute-0-19: 	Product Name: S2600CWR
compute-0-20: 	Product Name: PowerEdge R930
compute-0-21: 	Product Name: PowerEdge R940
compute-0-22: 	Product Name: PowerEdge R740
compute-0-23: 	Product Name: PowerEdge R740
compute-0-24: 	Product Name: PowerEdge R940

### 3.2 ipmi interface의 mode 확인 및 변경.

ipmi interface ip 설정을 위한 `ipmitool lan print` 또는 `ipmitool lan set `명령 실행시 **`ipmitool lan print 1`** 처럼 숫자를 넣지 않으면 기본 1번 채널로 선택 되는데, 제조사 와 ipmi interface 의 mode (Dedicated, Shared, Failover) 에 따라 지정해야 하는 값을 달리해야 한다.

Intel 의 경우, 명령어를 통해 mode 가 변경되지 않으며, Dedicated 포트에 케이블을 연결한 경우 채널 3번을 지정해야 한다. (채널1 과 채널2는 각각 LOM1 과 LOM2)

#### 3.2.1 현재 모드 확인.

##### > Dell 14G
```bash
ipmitool delloem lan get active
```
> dedicated

##### > Dell 13G, Intel
```bash
ipmitool delloem lan get
```
> dedicated 

or
> shared with failover lom2

##### > SuperMicro
```bash
ipmitool raw 0x30 0x70 0x0c 0
```
표) 출력 결과별 상태 

|출력된 값|현재 모드|
| - | - |
|00 | Dedicated|
|01 | Shared|
|02 | Failover |

#### 3.2.2 모드 변경.

##### > Dell 14G, 13G
```bash
ipmitool delloem lan set dedicated
```

##### > SuperMicro
| 설정값 | 명령어 |
| --- | --- |
|Dedicated | ipmitool raw 0x30 0x70 0x0c 1 0 |
|Shared | ipmitool raw 0x30 0x70 0x0c 1 1 |
|Failover | ipmitool raw 0x30 0x70 0x0c 1 2 |

```bash
ipmitool raw 0x30 0x70 0x0c 0     # mode check
ipmitool raw 0x30 0x70 0x0c 1 0   # change mode to Dedicated
ipmitool raw 0x30 0x70 0x0c 0     # mode recheck
```
##### 출력 예>

>[root@superserver ~]# ipmitool raw 0x30 0x70 0x0c 0
 02
[root@superserver ~]#
[root@superserver ~]#
[root@superserver ~]# ipmitool raw 0x30 0x70 0x0c 1 0
>
[root@superserver ~]# ipmitool raw 0x30 0x70 0x0c 0
 00
[root@superserver ~]#

##### > Intel
`ipmitool delloem lan set dedicated` **명령은 동작하지 않음.**
**다른 명령을 찾을 수 없었음, BIOS 에서 설정 필요.**


- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


### 3.3 네트워크 설정상태 확인 (lan print)
```bash
ipmitool lan print
# 또는
ipmitool lan print [1-3]
```

### 출력 예1>
> [root@dasandata:~]# ipmitool lan print 1
Set in Progress         : Set Complete
Auth Type Support       : NONE MD2 MD5 PASSWORD
Auth Type Enable        : Callback : MD2 MD5 PASSWORD
>>  : User     : MD2 MD5 PASSWORD
                        : Operator : MD2 MD5 PASSWORD
                        : Admin    : MD2 MD5 PASSWORD
                        : OEM      : MD2 MD5 PASSWORD

> IP Address Source       : DHCP Address
IP Address              : 0.0.0.0
Subnet Mask             : 0.0.0.0
MAC Address             : 0c:c4:7a:8b:f3:3d
SNMP Community String   : public
IP Header               : TTL=0x00 Flags=0x00 Precedence=0x00 TOS=0x00
BMC ARP Control         : ARP Responses Enabled, Gratuitous ARP Disabled
Default Gateway IP      : 0.0.0.0
Default Gateway MAC     : 00:00:00:00:00:00
Backup Gateway IP       : 0.0.0.0
Backup Gateway MAC      : 00:00:00:00:00:00
802.1q VLAN ID          : Disabled
802.1q VLAN Priority    : 0
RMCP+ Cipher Suites     : 1,2,3,6,7,8,11,12
Cipher Suite Priv Max   : XaaaXXaaaXXaaXX
>> :     X=Cipher Suite Unused
                        :     c=CALLBACK
                        :     u=USER
                        :     o=OPERATOR
                        :     a=ADMIN
                        :     O=OEM

> Bad Password Threshold  : Not Available

>[root@dasandata:~]# 
[root@dasandata:~]# ipmitool lan print 2
Invalid channel: 2
[root@dasandata:~]# 
[root@dasandata:~]# ipmitool lan print 3
Invalid channel: 3
[root@dasandata:~]# 


- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

<작성중...>


- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
## end.