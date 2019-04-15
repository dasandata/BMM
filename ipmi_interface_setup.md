# IPMI setup to [ Dell | SuperMicro | Intel ] Server.
dasandata 2019-04.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## 목적.
다양한 제조사의 하드웨어가 섞여 있는 환경에서 특정 제조사의 관리 명령 (예: Dell - Racadm) 이 아닌 여러 서버 제조사가 표준으로 지원하는 ipmi (Intelligent Platform Management Interface) 를 통해 서버들의 상태를 원격지에서 모니터링 하고 제어 하기 위해 ipmi interface 의 ip 와 사용자를 설정 하는 내용을 담고 있습니다.

이 문서 작성에 사용된 장비는 [ Dell | SuperMicro | Intel ] 세가지 제조사 제품이며, 운영체제는 CentOS 7 입니다.

## 순서.

1. [장비 모델 및 ipmi 지원여부 확인.][1]
2. [ipmi 설치.][2]
3. [ipmi 네트워크 및 관리자 계정설정.][3]
  - [3.1 Dell 13G 서버 ipmi 설정.][3-1]
  - [3.2 Dell 14G 서버 ipmi 설정.][3-2]
  - [3.3 SuperMicro 서버 ipmi 설정.][3-3]
  - [3.4 Intel 서버 ipmi 설정.][3-4]
4. [Intel 서버 ipmi 설정.][4]

[1]:https://github.com/dasandata/BMM/blob/master/ipmi_interface_setup.md#1-%EC%9E%A5%EB%B9%84-%EB%AA%A8%EB%8D%B8-%EB%B0%8F-ipmi-%EC%A7%80%EC%9B%90%EC%97%AC%EB%B6%80-%ED%99%95%EC%9D%B8
[2]:https://github.com/dasandata/BMM/blob/master/ipmi_interface_setup.md#2-ipmitool-%EC%84%A4%EC%B9%98
[3]:https://github.com/dasandata/BMM/blob/master/ipmi_interface_setup.md#3-ipmi-%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC-%EB%B0%8F-%EA%B4%80%EB%A6%AC%EC%9E%90-%EA%B3%84%EC%A0%95%EC%84%A4%EC%A0%95
[3-1]:https://github.com/dasandata/BMM/blob/master/ipmi_interface_setup.md#31-dell-13g-%EC%84%9C%EB%B2%84-ipmi-%EC%84%A4%EC%A0%95
[3-2]:https://github.com/dasandata/BMM/blob/master/ipmi_interface_setup.md#32-dell-14g-%EC%84%9C%EB%B2%84-ipmi-%EC%84%A4%EC%A0%95
[3-3]:https://github.com/dasandata/BMM/blob/master/ipmi_interface_setup.md#33-supermicro-%EC%84%9C%EB%B2%84-ipmi-%EC%84%A4%EC%A0%95
[3-4]:https://github.com/dasandata/BMM/blob/master/ipmi_interface_setup.md#34-intel-%EC%84%9C%EB%B2%84-ipmi-%EC%84%A4%EC%A0%95
[4]:https://github.com/dasandata/BMM/blob/master/ipmi_interface_setup.md#4-%EC%9B%90%EA%B2%A9-%EC%A0%9C%EC%96%B4-%ED%85%8C%EC%8A%A4%ED%8A%B8
[Title]:https://github.com/dasandata/BMM/blob/master/ipmi_interface_setup.md#ipmi-setup-to--dell--supermicro--intel--server

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## [1. 장비 모델 및 ipmi 지원여부 확인.][Title]

```bash
# 모델 확인.
dmidecode --type system | grep "Product Name:"
```
##### 출력 예>
> Product Name: PowerEdge R730  
> Product Name: Super Server  
> Product Name: SYS-4048B-TRFT  
> Product Name: S2600CWR  

```bash
# ipmi 지원여부 확인.
dmidecode  | grep  -A10  IPMI
```
##### 출력 예>
```
IPMI Device Information  
        Interface Type: KCS (Keyboard Control Style)  
        Specification Version: 2.0  
        I2C Slave Address: 0x10  
        NV Storage Device: Not Present  
        Base Address: 0x0000000000000CA2 (I/O)  
        Register Spacing: Successive Byte Boundaries  

Handle 0x0023, DMI type 16, 23 bytes  
Physical Memory Array  
        Location: System Board Or Motherboard  
```

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## [2. ipmitool 설치.][Title]

```bash
yum install ipmitool
```

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## [3. ipmi 네트워크 및 관리자 계정설정.][Title]

Dell, SuperMicro, Intel 등 제조사 별로 입력해야 하는 명령이 조금씩 차이가 있어, 각 제조사 별로 구분하여 작성 하였습니다.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

### [3.1 Dell 13G 서버 ipmi 설정.][Title]

#### 3.1.1 Dell 13G ipmi interface의 mode dedicated 확인.
```bash
ipmitool delloem lan get
```
> dedicated

**# dedicated 가 아닐때 dedicated 로 변경하는 경우 .**

```bash
ipmitool delloem lan set dedicated
```

#### 3.1.2 Dell 13G ipmi 네트워크 설정상태 확인.
```bash
ipmitool lan print
```
##### 출력 예>
```
[root@dell_13G:~]# ipmitool lan print  
Set in Progress         : Set Complete  
Auth Type Support       : NONE MD2 MD5 PASSWORD  
Auth Type Enable        : Callback : MD2 MD5 PASSWORD  
                        : User     : MD2 MD5 PASSWORD  
                        : Operator : MD2 MD5 PASSWORD  
                        : Admin    : MD2 MD5 PASSWORD  
                        : OEM      : MD2 MD5 PASSWORD  

IP Address Source       : DHCP Address  
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
                        :     X=Cipher Suite Unused  
                        :     c=CALLBACK  
                        :     u=USER  
                        :     o=OPERATOR  
                        :     a=ADMIN  
                        :     O=OEM  

Bad Password Threshold  : Not Available  
```

#### 3.1.3 Dell 13G ipmi 네트워크 ip 설정.

```bash
ipmitool lan set  ipsrc    static
ipmitool lan set  ipaddr   192.168.0.xxx
ipmitool lan set  netmask  255.255.255.0
ipmitool lan set  defgw ipaddr  192.168.0.1
ipmitool lan set  access   on
```

#### 3.1.4 Dell 13G ipmi 관리자 계정 설정.

```bash
ipmitool user set name 2 ADMIN
ipmitool user set password 2  PassWord
ipmitool user list 1
```
##### 출력 예>
```
[root@dell_13G:~]#  
[root@dell_13G:~]# ipmitool user set name 2 ADMIN  
[root@dell_13G:~]# ipmitool user set password 2  PassWord  
Set User Password command successful (user 2)  
[root@dell_13G:~]#  
[root@dell_13G:~]# ipmitool user list 2  
ID  Name	     Callin  Link Auth	IPMI Msg   Channel Priv Limit  
1                    true    false      false      NO ACCESS  
2   ADMIN            true    true       true       ADMINISTRATOR  
3                    true    false      false      NO ACCESS  
4                    true    false      false      NO ACCESS  
5                    true    false      false      NO ACCESS  
6                    true    false      false      NO ACCESS  
7                    true    false      false      NO ACCESS  
8                    true    false      false      NO ACCESS  
9                    true    false      false      NO ACCESS  
10                   true    false      false      NO ACCESS  
11                   true    false      false      NO ACCESS  
12                   true    false      false      NO ACCESS  
13                   true    false      false      NO ACCESS  
14                   true    false      false      NO ACCESS  
15                   true    false      false      NO ACCESS  
16                   true    false      false      NO ACCESS  
[root@dell_13G:~]#  
[root@dell_13G:~]#  
```
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

### [3.2 Dell 14G 서버 ipmi 설정.][Title]

#### 3.2.1 Dell 14G ipmi interface의 mode dedicated 확인.
```bash
ipmitool delloem lan get
```
> dedicated  

**# Dell 14G 는 dedicated 가 아닌 경우 변경하는 ipmi 명령 없음.**

#### 3.2.2 Dell 14G ipmi 네트워크 설정상태 확인.
```bash
ipmitool lan print
```
##### 출력 예>
```
[root@dell_14G:~]# ipmitool lan print  
Set in Progress         : Set Complete  
Auth Type Support       : NONE MD2 MD5 PASSWORD  
Auth Type Enable        : Callback : MD2 MD5 PASSWORD  
                        : User     : MD2 MD5 PASSWORD  
                        : Operator : MD2 MD5 PASSWORD  
                        : Admin    : MD2 MD5 PASSWORD  
                        : OEM      : MD2 MD5 PASSWORD  

IP Address Source       : DHCP Address  
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
                        :     X=Cipher Suite Unused  
                        :     c=CALLBACK  
                        :     u=USER  
                        :     o=OPERATOR  
                        :     a=ADMIN  
                        :     O=OEM  

Bad Password Threshold  : Not Available  
```

#### 3.2.3 Dell 14G ipmi 네트워크 ip 설정.

```bash
ipmitool lan set  1  ipsrc    static
ipmitool lan set  1  ipaddr   192.168.0.xxx
ipmitool lan set  1  netmask  255.255.255.0
ipmitool lan set  1  defgw ipaddr  192.168.0.1
ipmitool lan set  1  access   on
```

#### 3.2.4 Dell 14G ipmi 관리자 계정 설정.

```bash
ipmitool user set name 2 ADMIN
ipmitool user set password 2  PassWord
ipmitool user list 1
```
##### 출력 예>
```
[root@dell_14G:~]#  
[root@dell_14G:~]# ipmitool user set name 2 ADMIN  
[root@dell_14G:~]# ipmitool user set password 2  PassWord  
Set User Password command successful (user 2)  
[root@dell_14G:~]#  
[root@dell_14G:~]# ipmitool user list 2  
ID  Name	     Callin  Link Auth	IPMI Msg   Channel Priv Limit  
1                    true    false      false      NO ACCESS  
2   ADMIN            true    true       true       ADMINISTRATOR  
3                    true    false      false      NO ACCESS  
4                    true    false      false      NO ACCESS  
5                    true    false      false      NO ACCESS  
6                    true    false      false      NO ACCESS  
7                    true    false      false      NO ACCESS  
8                    true    false      false      NO ACCESS  
9                    true    false      false      NO ACCESS  
10                   true    false      false      NO ACCESS  
11                   true    false      false      NO ACCESS  
12                   true    false      false      NO ACCESS  
13                   true    false      false      NO ACCESS  
14                   true    false      false      NO ACCESS  
15                   true    false      false      NO ACCESS  
16                   true    false      false      NO ACCESS  
[root@dell_14G:~]#  
[root@dell_14G:~]#  
```

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

### [3.3 SuperMicro 서버 ipmi 설정.][Title]

#### 3.3.1 SuperMicro ipmi interface의 mode dedicated 확인.

```bash
# 현재 모드 확인.
ipmitool raw 0x30 0x70 0x0c 0
```

표) 출력 결과별 상태

|출력된 값|현재 모드|
| - | - |
|00 | Dedicated|
|01 | Shared|
|02 | Failover |

##### 출력 예>
```
[root@SuperMicro ~]# ipmitool raw 0x30 0x70 0x0c 0
 02    
[root@SuperMicro ~]#  
```

#### 3.3.1 SuperMicro ipmi interface 를 dedicated mode 로 변경.

| Mode | 명령어 |
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

```
[root@SuperMicro ~]# ipmitool raw 0x30 0x70 0x0c 1 0  
[root@SuperMicro ~]# ipmitool raw 0x30 0x70 0x0c 0  
 00  
[root@SuperMicro ~]#  
```


#### 3.3.2 SuperMicro ipmi 네트워크 설정상태 확인.
```bash
ipmitool lan print
```
##### 출력 예>
```
[root@SuperMicro:~]# ipmitool lan print  
Set in Progress         : Set Complete  
Auth Type Support       : NONE MD2 MD5 PASSWORD  
Auth Type Enable        : Callback : MD2 MD5 PASSWORD  
                        : User     : MD2 MD5 PASSWORD  
                        : Operator : MD2 MD5 PASSWORD  
                        : Admin    : MD2 MD5 PASSWORD  
                        : OEM      : MD2 MD5 PASSWORD  

IP Address Source       : DHCP Address  
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
                        :     X=Cipher Suite Unused  
                        :     c=CALLBACK  
                        :     u=USER  
                        :     o=OPERATOR  
                        :     a=ADMIN  
                        :     O=OEM  

Bad Password Threshold  : Not Available  
```

#### 3.3.3 SuperMicro ipmi 네트워크 ip 설정.

```bash
ipmitool lan set  1  ipsrc    static
ipmitool lan set  1  ipaddr   192.168.0.xxx
ipmitool lan set  1  netmask  255.255.255.0
ipmitool lan set  1  defgw ipaddr  192.168.0.1
ipmitool lan set  1  access   on
```

#### 3.3.4 SuperMicro ipmi 관리자 계정 설정.

```bash
ipmitool user set name 2 ADMIN
ipmitool user set password 2  PassWord
ipmitool user list
```
##### 출력 예>
```
[root@SuperMicro:~]#  
[root@SuperMicro:~]# ipmitool user set name 2 ADMIN  
[root@SuperMicro:~]# ipmitool user set password 2  PassWord  
Set User Password command successful (user 2)  
[root@SuperMicro:~]#  
[root@SuperMicro:~]# ipmitool user list 2  
ID  Name	     Callin  Link Auth	IPMI Msg   Channel Priv Limit  
1                    true    false      false      NO ACCESS  
2   ADMIN            true    true       true       ADMINISTRATOR  
3                    true    false      false      NO ACCESS  
4                    true    false      false      NO ACCESS  
5                    true    false      false      NO ACCESS  
6                    true    false      false      NO ACCESS  
7                    true    false      false      NO ACCESS  
8                    true    false      false      NO ACCESS  
9                    true    false      false      NO ACCESS  
10                   true    false      false      NO ACCESS  
11                   true    false      false      NO ACCESS  
12                   true    false      false      NO ACCESS  
13                   true    false      false      NO ACCESS  
14                   true    false      false      NO ACCESS  
15                   true    false      false      NO ACCESS  
16                   true    false      false      NO ACCESS  
[root@SuperMicro:~]#  
[root@SuperMicro:~]#  
```

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

### [3.4 Intel 서버 ipmi 설정.][Title]

#### 3.4.1 Intel ipmi interface의 mode dedicated 확인.

```bash
# 현재 모드 확인.
ipmitool delloem lan get
```
##### 출력 예>
```
[root@Intel:~]# ipmitool delloem lan get  
shared with failover lom2  
[root@Intel:~]#  
```

**# Intel 은 dedicated 가 아닌 경우 변경하는 ipmi 명령 없음.**

#### 3.4.2 Intel ipmi 네트워크 설정상태 확인.

**# Intel 의 ipmi dedicated Port 의 Channel 이 3번으로 고정되어 있어, 반드시 지정해 주어야 함.**
```bash
ipmitool lan print 3
```
##### 출력 예>
```
[root@Intel:~]# ipmitool lan 3 print  
Set in Progress         : Set Complete  
Auth Type Support       : NONE MD2 MD5 PASSWORD  
Auth Type Enable        : Callback : MD2 MD5 PASSWORD  
                        : User     : MD2 MD5 PASSWORD  
                        : Operator : MD2 MD5 PASSWORD  
                        : Admin    : MD2 MD5 PASSWORD  
                        : OEM      : MD2 MD5 PASSWORD  

IP Address Source       : DHCP Address  
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
                        :     X=Cipher Suite Unused  
                        :     c=CALLBACK  
                        :     u=USER  
                        :     o=OPERATOR  
                        :     a=ADMIN  
                        :     O=OEM  

Bad Password Threshold  : Not Available  
```

#### 3.4.3 Intel ipmi 네트워크 ip 설정.

```bash
ipmitool lan set  3  ipsrc    static
ipmitool lan set  3  ipaddr   192.168.0.xxx
ipmitool lan set  3  netmask  255.255.255.0
ipmitool lan set  3  defgw ipaddr  192.168.0.1
ipmitool lan set  3  access   on
```

#### 3.4.4 Intel ipmi 관리자 계정 설정.

**# Intel 은 2번 사용자의 이름을 변경할 수 없어, 사용자 3번을 활성화 하고 이름을 변경 합니다.**

```bash
ipmitool user enable 3
ipmitool user set name 3 ADMIN
ipmitool user set password 3  PassWord
ipmitool user list 1
```
##### 출력 예>
```
[root@Intel:~]#  
[root@Intel:~]# ipmitool user enable 3  
[root@Intel:~]# ipmitool user set name 3 ADMIN  
[root@Intel:~]# ipmitool user set password 3  PassWord  
Set User Password command successful (user 3)  
[root@SuperMicro:~]#  
[root@SuperMicro:~]# ipmitool user list 1  
ID  Name	     Callin  Link Auth	IPMI Msg   Channel Priv Limit  
1                    false   false      true       ADMINISTRATOR  
2   root             false   true       true       ADMINISTRATOR  
3   ADMIN            false   false      true       ADMINISTRATOR  
4   test2            false   false      true       ADMINISTRATOR  
5   test3            false   false      true       ADMINISTRATOR  
6                    true    false      false      NO ACCESS  
7                    true    false      false      NO ACCESS  
8                    true    false      false      NO ACCESS  
9                    true    false      false      NO ACCESS  
10                   true    false      false      NO ACCESS  
11                   true    false      false      NO ACCESS  
12                   true    false      false      NO ACCESS  
13                   true    false      false      NO ACCESS  
14                   true    false      false      NO ACCESS  
15                   true    false      false      NO ACCESS  
[root@Intel:~]#  
[root@Intel:~]#  
```

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## [4. 원격 제어 테스트.][Title]

```bash
ipmitool -I lanplus -H  <IPMI_IP>  -U ADMIN -P  PassWord  power status
```

**# 클러스터 환경 등, 여러대의 시스템 확인.**
(사전에 /etc/hosts 에 ipmi ip 입력)

```bash
for I in $(seq 0 10) ; do echo node${I} `date "+%Y-%m-%d %H:%M:%S"`
ipmitool -I lanplus -H node${I}.ipmi -U ADMIN -P PassWord  power status
echo ; done
```

##### 출력 예>
```
node0 2019-04-15 10:26:03
Chassis Power is on

node1 2019-04-15 10:26:03
Chassis Power is on

node2 2019-04-15 10:26:04
Chassis Power is on

node3 2019-04-15 10:26:04
Chassis Power is on

node4 2019-04-15 10:26:04
Chassis Power is on

node5 2019-04-15 10:26:04
Chassis Power is on

node6 2019-04-15 10:26:05
Chassis Power is on

node7 2019-04-15 10:26:05
Chassis Power is on

node8 2019-04-15 10:26:05
Chassis Power is on

node9 2019-04-15 10:26:05
Chassis Power is on

node10 2019-04-15 10:26:05
Chassis Power is on
```

## [end.][Title]
