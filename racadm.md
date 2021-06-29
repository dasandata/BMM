[0]: https://github.com/dasandata/BMM/blob/master/racadm.md#dell-racadm-remote-access-controller-admin

[1]: https://github.com/dasandata/BMM/blob/master/racadm.md#-1-%EC%B4%88%EA%B8%B0-%EA%B5%AC%EC%84%B1
[1.1]: https://github.com/dasandata/BMM/blob/master/racadm.md#-11-interface-%EC%84%A4%EC%A0%95
[1.2]: https://github.com/dasandata/BMM/blob/master/racadm.md#-12-ip-%EC%84%A4%EC%A0%95
[1.3]: https://github.com/dasandata/BMM/blob/master/racadm.md#-13-%ED%8C%A8%EC%8A%A4%EC%9B%8C%EB%93%9C-%EB%B3%80%EA%B2%BD
[1.4]: https://github.com/dasandata/BMM/blob/master/racadm.md#-14-timezone-%EB%B3%80%EA%B2%BD

[2]: https://github.com/dasandata/BMM/blob/master/racadm.md#-2-%EC%A0%9C%EC%96%B4-%EB%B0%8F-bios-%EC%84%A4%EC%A0%95
[2.1]: https://github.com/dasandata/BMM/blob/master/racadm.md#-21-power-control
[2.2]: https://github.com/dasandata/BMM/blob/master/racadm.md#-22-hyper-threading
[2.3]: https://github.com/dasandata/BMM/blob/master/racadm.md#-23-3rdpartycard-pcieslotlfm
[2.4]: https://github.com/dasandata/BMM/blob/master/racadm.md#-24-hw-inventory

[3]: https://github.com/dasandata/BMM/blob/master/racadm.md#3-%EA%B8%B0%ED%83%80
[3.1]: https://github.com/dasandata/BMM/blob/master/racadm.md#-31-tsr-log-supportassist-%EC%88%98%EC%A7%91
[3.2]: https://github.com/dasandata/BMM/blob/master/racadm.md#-32-openhpc-node-%EC%97%90%EC%84%9C-racadm-%EB%AA%85%EB%A0%B9-%EC%82%AC%EC%9A%A9
[3.3]: https://github.com/dasandata/BMM/blob/master/racadm.md#-33-%EB%B0%98%EB%B3%B5%EB%AC%B8for-%EC%98%88%EC%A0%9C
[3.4]: https://github.com/dasandata/BMM/blob/master/racadm.md#-34-racadm-docker

# Dell RACADM (Remote Access Controller Admin)

## [목차]  
[1. 초기구성][1]  
[1.1 Interface 설정][1.1]  
[1.2 IP 설정][1.2]  
[1.3 패스워드 변경][1.3]  
[1.4 timezone 변경][1.4]  

[2. 제어 및 BIOS 설정][2]  
[2.1 Power Control][2.1]  
[2.2 Hyper Threading][2.2]  
[2.3 3rdPartyCard PCIESlotLFM][2.3]  
[2.4 H/W Inventory][2.4]  

[3. 기타][3]  
[3.1 TSR Log (supportassist) 수집][3.1]  
[3.2 OpenHPC node 에서 racadm 명령 사용][3.2]  
[3.3 반복문(for) 예제][3.3]  
[3.4 Racadm Docker][3.4]  


## ## [1. 초기 구성][0]
### ### [1.1 Interface 설정][0]
```bash
[root@dasandata:~]# racadm get idrac.nic.Selection
[Key=idrac.Embedded.1#NIC.1]
Selection=Dedicated

[root@dasandata:~]#
[root@dasandata:~]# racadm help idrac.nic.Selection
Selection                 -- Specifies the current mode of operation for the iDRAC network interface controller
Usage                     -- 1-Dedicated; 2-LOM1; 3-LOM2; 4-LOM3; 5-LOM4; 6-LOM5; 7-LOM6; Default - 1
Required License          -- RACADM
Dependency                -- None

[root@dasandata:~]#
[root@dasandata:~]# racadm set idrac.nic.Selection 3
[Key=idrac.Embedded.1#NIC.1]
Object value modified successfully

[root@dasandata:~]#
[root@dasandata:~]# racadm get idrac.nic.Selection
[Key=idrac.Embedded.1#NIC.1]
Selection=LOM2
```

#### #### [idrac6 (racadm6) Nic Selection][0]
```bash
[root@dasandata:~]#
[root@dasandata:~]# racadm getconfig -g cfgLAnNetworking -o cfgNicSelection
0
[root@dasandata:~]#
[root@dasandata:~]# racadm config    -g cfgLAnNetworking -o cfgNicSelection 1
Object value modified successfully
[root@dasandata:~]#
[root@dasandata:~]# racadm getniccfg | grep "NIC Selection"
NIC Selection   = Shared with failover (LOM2)
[root@dasandata:~]#
[root@dasandata:~]# racadm config -g cfgLAnNetworking -o cfgNicSelection 0
Object value modified successfully
[root@dasandata:~]#
[root@dasandata:~]# racadm getniccfg | grep "NIC Selection"
NIC Selection   = Shared
[root@dasandata:~]#
```

### ### [1.2 IP 설정][0]
```bash
racadm getniccfg

racadm help setniccfg

racadm setniccfg  -s 192.168.0.200  255.255.255.0  192.168.0.1
```

### ### [1.3 패스워드 변경][0]
```bash
racadm get idrac.users.2
racadm get idrac.users.2 | grep UserName

racadm set idrac.users.2.password  PASSWORD
```

### ### [1.4 timezone 변경][0]
```bash
racadm get iDRAC.Time.Timezone

racadm set iDRAC.Time.Timezone Asia/Seoul

racadm get iDRAC.Time.Timezone
```


## ## [2. 제어 및 BIOS 설정][0]
### ### [2.1 Power Control][0]
```bash
racadm help serveraction

racadm --nocertwarn -r  192.168.0.xxx  -u root -p PASSWORD    racadm serveraction powerstatus

racadm --nocertwarn -r  192.168.0.xxx  -u root -p PASSWORD    racadm serveraction powerup
```

### ### [2.2 Hyper Threading][0]
```bash
racadm --nocertwarn -r  192.168.0.xxx  -u root -p PASSWORD   help  BIOS.ProcSettings.ControlledTurbo

> ControlledTurbo           -- Enable or disable CPU Controlled Turbo mode.    
> Usage                     -- Enabled - Enabled;Disabled - Disabled;ControlledTurboLimitMinus1 - Controlled Turbo Limit Minus 1 Bin;ControlledTurboLimitMinus2 - Controlled Turbo > Limit Minus 2 Bins;ControlledTurboLimitMinus3 - Controlled Turbo Limit Minus 3 Bins;
> Required License          -- RACADM
> Dependency                -- NA

racadm --nocertwarn -r  192.168.0.xxx  -u root -p PASSWORD   set BIOS.ProcSettings.ControlledTurbo  Disabled
racadm --nocertwarn -r  192.168.0.xxx  -u root -p PASSWORD   get BIOS.ProcSettings.ControlledTurbo

> [Key=BIOS.Setup.1-1#ProcSettings]                                            
> ControlledTurbo=Disabled (Pending Value=Enabled)

racadm --nocertwarn -r  192.168.0.xxx  -u root -p PASSWORD   jobqueue create BIOS.Setup.1-1

> RAC1024: Successfully scheduled a job.                                       
> Verify the job status using "racadm jobqueue view -i JID_xxxxx" command.
> Commit JID = JID_xxxxxx

racadm --nocertwarn -r  192.168.0.xxx  -u root -p PASSWORD   jobqueue view

> ParseComplete                                                                
>
> -------------------------JOB QUEUE------------------------
> [Job ID=JID_xxxxxx]
> Job Name=Configure: BIOS.Setup.1-1
> Status=Scheduled
> Start Time=[Now]
> Expiration Time=[Not Applicable]
> Message=[JCP001: Task successfully scheduled.]
> Percent Complete=[0]
> ----------------------------------------------------------

racadm --nocertwarn -r  192.168.0.xxx  -u root -p PASSWORD   serveraction powercycle

```

### ### [2.3 3rdPartyCard PCIESlotLFM][0]
#### #### Dell T640 Fan Speed Low
```bash
racadm get system.PCIeSlotLFM.1.lfmmode

racadm set system.PCIeSlotLFM.1.lfmmode 2  # custom
racadm set system.PCIeSlotLFM.3.lfmmode 2  # custom
racadm set system.PCIeSlotLFM.6.lfmmode 2  # custom
racadm set system.PCIeSlotLFM.8.lfmmode 2  # custom

racadm set system.ThermalSettings.FanSpeedOffset 255 # off

racadm get system.PCIeSlotLFM.1.lfmmode
```
#### #### Dell T640 Fan Speed High
```bash
racadm get system.PCIeSlotLFM.1.lfmmode

racadm set system.PCIeSlotLFM.1.lfmmode 0  # auto
racadm set system.PCIeSlotLFM.3.lfmmode 0  # auto
racadm set system.PCIeSlotLFM.6.lfmmode 0  # auto
racadm set system.PCIeSlotLFM.8.lfmmode 0  # auto

racadm set system.ThermalSettings.FanSpeedOffset 3  # max

racadm get system.PCIeSlotLFM.1.lfmmode
```

### ### [2.4 H/W Inventory][0]
```bash
racadm --nocertwarn hwinventory | grep -i Description

racadm --nocertwarn hwinventory | grep -i "nvidia\|geforce\|tesla\|gpu\|video\|graphics"
```

## [3. 기타][0]
### ### [3.1 TSR Log (supportassist) 수집][0]

```bash
racadm supportassist accepteula

racadm supportassist collect -t sysinfo,ttylog  -f <REPORT_LOCATION>

# -t           —Specifies the types of logs to be included in the export data.
## -sysinfo    —System information
## -osAppAll   —OS and Application data
## -ttylog     —Storage log information
## -Debug      —iDRAC debug logs

racadm   jobqueue view
```

### ### [3.2 OpenHPC node 에서 racadm 명령 사용][0]
```bash
echo "/opt/dell  10.1.1.0/24(ro,no_subtree_check)  >> /etc/exports"
exportfs -a

mkdir ${CHROOT}/opt/dell
wwvnfs --chroot  ${CHROOT}

pdsh -w node[01-04]   mkdir /opt/dell
pdsh -w node[01-04]   mount -t nfs   master:/opt/dell  /opt/dell

ssh node01   '/opt/dell/srvadmin/sbin/racadm  getsysinfo'
```

### ### [3.3 반복문(for) 예제][0]
```bash
for NUM in 01 02 03 04
  do echo "NODE $NUM"
  racadm --nocertwarn -r node$NUM.idrac -u root -p PASSWORD   getsysinfo
done
```

### ### [3.4 Racadm Docker][0]
```bash
docker  search   racadm

docker  run  -it  justinclayton/racadm  -r 10.1.1.100  -u root  -p  PASSWORD  getsysinfo
docker  run  -it  justinclayton/racadm  -r 10.1.1.100  -u root  -p  PASSWORD  help  serveraction
docker  run  -it  justinclayton/racadm  -r 10.1.1.100  -u root  -p  PASSWORD  serveraction powerstatus
```

## [끝][0]
