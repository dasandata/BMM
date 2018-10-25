# racadm


## Default
```bash
racadm -r 192.168.0.142 -u root -p calvin    getsysinfo
racadm -r 192.168.0.142 -u root -p calvin    getniccfg
```

## Fan Speed, Power Usage
```bash
racadm -r 192.168.0.142 -u root -p calvin    getsensorinfo | grep -i fan
racadm    getsensorinfo | grep "PS\|Fan\|System Board Pwr"

ipmitool -H 192.168.0.142 -U root -L USER -I open  sdr type Fan
ipmitool sdr type "Current"
```

## Power Configration
```bash
racadm -r node1.idrac -u root -p calvin    getsensorinfo | grep "PS"  # PS1 과 PS2 의 Current 값 비교.

   PS1 Status                      Present                  AC             
   PS2 Status                      Present                  AC             
   System Board PS1 PG             Ok          Good                NA          NA          
   System Board PS2 PG             Ok          Good                NA          NA          
   PS1 Voltage 1                   Ok          234.00V             NA          NA          
   PS2 Voltage 2                   Ok          204.00V             NA          NA          
   [Key = iDRAC.Embedded.1#PS1Current1]
   PS1 Current 1                 Ok      0.6Amps  NA   NA       0Amps [N]      0Amps [N]
   [Key = iDRAC.Embedded.1#PS2Current2]
   PS2 Current 2                 Ok      0.2Amps  NA   NA       0Amps [N]      0Amps [N]
   System Board PS Redundancy      Full Redundant           PSU   


racadm -r node1.idrac -u root -p calvin   get System.ServerPwr

   #ActivePolicyName=                                                           
   #ActivePowerCapVal=32767
   #PowerCapMaxThres=1596
   #PowerCapMinThres=800
   PowerCapSetting=Disabled
   PowerCapValue=382
   PSPFCEnabled=Disabled
   PSRapidOn=Enabled
   PSRedPolicy=1
   RapidOnPrimaryPSU=PSU1


racadm -r node1.idrac -u root -p calvin   get System.ServerPwr.PSRapidOn

racadm -r node1.idrac -u root -p calvin   set System.ServerPwr.PSRapidOn Disabled
sleep 120 # sensor 값이 반영 되는데 약 2분 정도 필요함.

racadm -r node1.idrac -u root -p calvin    getsensorinfo | grep "PS"


   System.ServerPwr.PSRedPolicy
   PSRedPolicy               -- Specify the Power Supply redundancy policy      
   Usage                     -- 0- Not Redundant; 1- A/B Grid Redundant
   Required License          -- Power Monitoring


   System.ServerPwr.PSRapidOn
   PSRapidOn                 -- Enable the Power Supply Rapid On
   Usage                     -- 0- Disabled; 1- Enabled
   Required License          -- Power Monitoring

```

## 3rdPartyCard PCIESlotLFM
```bash
# racadm -r 192.168.0.142 -u root -p calvin  get system.PCIESlotLFM.1

   [Key=system.Embedded.1#PCIeSlotLFM.1]                                        
   #3rdPartyCard=No
   #CardType=Video
   CustomLFM=0
   LFMMode=Automatic
   #MaxLFM=630
   #SlotState=Defined
   #TargetLFM=Airflow Controlled


racadm -r 192.168.0.142 -u root -p calvin  set system.PCIESlotLFM.1.LFMMode 2
```

## Power Control
```bash
racadm -r 192.168.0.142 -u root -p calvin  help serveraction

   graceshutdown   : perform a graceful shutdown of server
   powerdown       : power server off
   powerup         : power server on
   powercycle      : perform server power cycle
   hardreset       : force hard server power reset
   powerstatus     : display current power status of server
   nmi             : Genarate Non-Masking Interrupt to halt system operation


racadm -r 192.168.0.142 -u root -p calvin  serveraction powerstatus
```
