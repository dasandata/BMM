# racadm

```bash
racadm -r 192.168.0.142 -u root -p calvin  getsysinfo

racadm -r 192.168.0.142 -u root -p calvin  getsensorinfo | grep -i fan

ipmitool -H 192.168.0.142 -U root -L USER -I open   sdr type Fan

```


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
```

```bash
racadm -r 192.168.0.142 -u root -p calvin  set system.PCIESlotLFM.1.LFMMode 2
```


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
