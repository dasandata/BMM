#  ipmitool user list 확인
```
[root@coma:~]# ipmitool user list 1
ID  Name             Callin  Link Auth  IPMI Msg   Channel Priv Limit
1                    true    false      false      Unknown (0x00)
2   ADMIN            false   false      true       ADMINISTRATOR
3   root             false   true       true       ADMINISTRATOR
4                    true    false      false      Unknown (0x00)
5                    true    false      false      Unknown (0x00)
6                    true    false      false      Unknown (0x00)
7                    true    false      false      Unknown (0x00)
8                    true    false      false      Unknown (0x00)
9                    true    false      false      Unknown (0x00)
10                   true    false      false      Unknown (0x00)
```

#  ipmitool user add ( ex 4번 ) 생성 후 확인
```
[root@coma:~]# ipmitool user  set  name  4  dasan
[root@coma:~]#
[root@coma:~]# ipmitool user  list 1
ID  Name             Callin  Link Auth  IPMI Msg   Channel Priv Limit
1                    true    false      false      Unknown (0x00)
2   ADMIN            false   false      true       ADMINISTRATOR
3   root             false   true       true       ADMINISTRATOR
4   dasan            true    false      false      ADMINISTRATOR
5                    true    false      false      Unknown (0x00)
6                    true    false      false      Unknown (0x00)
7                    true    false      false      Unknown (0x00)
8                    true    false      false      Unknown (0x00)
9                    true    false      false      Unknown (0x00)
10                   true    false      false      Unknown (0x00)
```

#  ipmitool 에 생성한 4번 계정 (dasan) 패스워드 설정
```
ipmitool user  set  password  4  <PASSWORD>
Set User Password command successful (user 4)
```

#  ipmitool 4 번 계정 (dasan) 활성화
```
[root@coma:~]# ipmitool user  enable 4
```

#  ipmitool 커맨드 를 dasan 계정 테스트 power 상태 확인
```
[root@coma:~]# ipmitool  -I  lanplus   -H coma.ipmi  -U dasan  -P  <PASSWORD>  power  status
Chassis Power is on
[root@coma:~]#
```

#  bmc-config 살펴보기
```
[root@coma:~]# bmc-config  --checkout --section=user4
Section User4
        ## Give Username
        Username                                      dasan
        ## Give password or blank to clear. MAX 16 chars (20 chars if IPMI 2.0 supported).
        ## Password
        ## Possible values: Yes/No or blank to not set
        Enable_User                                   Yes
        ## Possible values: Yes/No
        Lan_Enable_IPMI_Msgs                          No
        ## Possible values: Yes/No
        Lan_Enable_Link_Auth                          No
        ## Possible values: Yes/No
        Lan_Enable_Restricted_to_Callback             No
        ## Possible values: Callback/User/Operator/Administrator/OEM_Proprietary/No_Access
        Lan_Privilege_Limit
        ## Possible values: 0-17, 0 is unlimited; May be reset to 0 if not specified
        ## Lan_Session_Limit
        ## Possible values: Yes/No
        SOL_Payload_Access                            Yes
EndSection
```

#  bmc Port 설정 및 로그인 유저 지정
```
[root@coma:~]# ipmitool channel setaccess 1 4  link=on  callin=off ipmi=on
Set User Access (channel 1 id 4) successful.

[root@coma:~]# bmc-config  --checkout --section=user4
Section User4
        ## Give Username
        Username                                      dasan
        ## Give password or blank to clear. MAX 16 chars (20 chars if IPMI 2.0 supported).
        ## Password
        ## Possible values: Yes/No or blank to not set
        Enable_User                                   Yes
        ## Possible values: Yes/No
        Lan_Enable_IPMI_Msgs                          Yes
        ## Possible values: Yes/No
        Lan_Enable_Link_Auth                          Yes
        ## Possible values: Yes/No
        Lan_Enable_Restricted_to_Callback             Yes
        ## Possible values: Callback/User/Operator/Administrator/OEM_Proprietary/No_Access
        Lan_Privilege_Limit                           Administrator
        ## Possible values: 0-17, 0 is unlimited; May be reset to 0 if not specified
        ## Lan_Session_Limit
        ## Possible values: Yes/No
        SOL_Payload_Access                            Yes
EndSection
[root@coma:~]#
```
