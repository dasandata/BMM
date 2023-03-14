## Dell Perccli

### Install OLD
--------OLD--------
```bash
cd /root  
mkdir raid_manager  
cd raid_manager/  

wget https://downloads.dell.com/FOLDER04470715M/1/perccli_7.1-007.0127_linux.tar.gz
tar xvzf perccli_7.1-007.0127_linux.tar.gz

cd Linux/
yum -y install perccli-007.0127.0000.0000-1.noarch.rpm
```

```bash
rpm -ql perccli-007.0127.0000.0000-1
```

### Install NEW
--Type Debian--
```bash
   su -
   apt install -y wget alien
   cd /root
   wget https://dl.dell.com/FOLDER04470715M/1/perccli_7.1-007.0127_linux.tar.gz
   tar perccli*.tar.gz
   cd Linux
   alien -c *.rpm
   dpkg -i *.deb
   echo "PATH=$PATH:/opt/MegaRAID/perccli/" >> /etc/profile
   source /etc/profile
   ```

--Type Debian--
```bash
   su -
   yum install -y wget
   cd /root
   wget https://dl.dell.com/FOLDER04470715M/1/perccli_7.1-007.0127_linux.tar.gz
   tar perccli*.tar.gz
   cd Linux
   rpm -ivh *.rpm
   echo "PATH=$PATH:/opt/MegaRAID/perccli/" >> /etc/profile
   source /etc/profile
```
### Test
```bash
/opt/MegaRAID/perccli/perccli64
or
perccli64
```
***

*출력 예>*
```
[root@hostname:Linux]# /opt/MegaRAID/perccli/perccli64
     Storage Command Line Tool  Ver 007.0127.0000.0000 July 13, 2017

     (c)Copyright 2017, AVAGO Technologies, All Rights Reserved.


help - lists all the commands with their usage. E.g. perccli help
<command> help - gives details about a particular command. E.g. perccli add help

List of commands:

Commands   Description
-------------------------------------------------------------------
add        Adds/creates a new element to controller like VD,Spare..etc
delete     Deletes an element like VD,Spare
show       Displays information about an element
set        Set a particular value to a property
get        Get a particular value to a property
compare    Compares particular value to a property
start      Start background operation
stop       Stop background operation
pause      Pause background operation
resume     Resume background operation
download   Downloads file to given device
expand     expands size of given drive
insert     inserts new drive for missing
transform  downgrades the controller
/cx        Controller specific commands
/ex        Enclosure specific commands
/sx        Slot/PD specific commands
/vx        Virtual drive specific commands
/dx        Disk group specific commands
/fall      Foreign configuration specific commands
/px        Phy specific commands
/[bbu|cv]  Battery Backup Unit, Cachevault commands

Other aliases : cachecade, freespace, sysinfo

Use a combination of commands to filter the output of help further.
E.g. 'perccli cx show help' displays all the show operations on cx.
Use verbose for detailed description E.g. 'perccli add  verbose help'
Use 'page=[x]' as the last option in all the commands to set the page break.
X=lines per page. E.g. 'perccli help page=10'
Use J as the last option to print the command output in JSON format
Command options must be entered in the same order as displayed in the help of
the respective commands.

[root@hostname:Linux]#
```

***

```bash
/opt/MegaRAID/perccli/perccli64 /c0 show
```
*출력 예>*
```
[root@hostname:Linux]# /opt/MegaRAID/perccli/perccli64 /c0 show
Generating detailed summary of the adapter, it may take a while to complete.

Controller = 0
Status = Success
Description = None

Product Name = PERC H730 Mini
Serial Number = 82903U3
SAS Address =  5d09466049ac2900
PCI Address = 00:03:00:00
System Time = 05/03/2018 13:14:46
Mfg. Date = 02/19/18
Controller Time = 05/03/2018 13:14:46
FW Package Build = 25.5.4.0006
BIOS Version = 6.33.01.0_4.16.07.00_0x06120302
FW Version = 4.280.00-8186
Driver Name = megaraid_sas
Driver Version = 07.701.17.00-rh1
Current Personality = RAID-Mode
Vendor Id = 0x1000
Device Id = 0x5D
SubVendor Id = 0x1028
SubDevice Id = 0x1F49
Host Interface = PCI-E
Device Interface = SAS-12G
Bus Number = 3
Device Number = 0
Function Number = 0
Drive Groups = 2

TOPOLOGY :
========

-----------------------------------------------------------------------------
DG Arr Row EID:Slot DID Type  State BT       Size PDC  PI SED DS3  FSpace TR
-----------------------------------------------------------------------------
 0 -   -   -        -   RAID1 Optl  N  278.875 GB dflt N  N   dflt N      N  
 0 0   -   -        -   RAID1 Optl  N  278.875 GB dflt N  N   dflt N      N  
 0 0   0   32:12    12  DRIVE Onln  N  278.875 GB dflt N  N   dflt -      N  
 0 0   1   32:13    13  DRIVE Onln  N  278.875 GB dflt N  N   dflt -      N  
 1 -   -   -        -   RAID6 Optl  N   72.768 TB dflt N  N   dflt N      N  
 1 0   -   -        -   RAID6 Optl  N   72.768 TB dflt N  N   dflt N      N  
 1 0   0   32:0     0   DRIVE Onln  N    7.276 TB dflt N  N   dflt -      N  
 1 0   1   32:1     1   DRIVE Onln  N    7.276 TB dflt N  N   dflt -      N  
 1 0   2   32:2     2   DRIVE Onln  N    7.276 TB dflt N  N   dflt -      N  
 1 0   3   32:3     3   DRIVE Onln  N    7.276 TB dflt N  N   dflt -      N  
 1 0   4   32:4     4   DRIVE Onln  N    7.276 TB dflt N  N   dflt -      N  
 1 0   5   32:5     5   DRIVE Onln  N    7.276 TB dflt N  N   dflt -      N  
 1 0   6   32:6     6   DRIVE Onln  N    7.276 TB dflt N  N   dflt -      N  
 1 0   7   32:7     7   DRIVE Onln  N    7.276 TB dflt N  N   dflt -      N  
 1 0   8   32:8     8   DRIVE Onln  N    7.276 TB dflt N  N   dflt -      N  
 1 0   9   32:9     9   DRIVE Onln  N    7.276 TB dflt N  N   dflt -      N  
 1 0   10  32:10    10  DRIVE Onln  N    7.276 TB dflt N  N   dflt -      N  
 1 0   11  32:11    11  DRIVE Onln  N    7.276 TB dflt N  N   dflt -      N  
-----------------------------------------------------------------------------

DG=Disk Group Index|Arr=Array Index|Row=Row Index|EID=Enclosure Device ID
DID=Device ID|Type=Drive Type|Onln=Online|Rbld=Rebuild|Dgrd=Degraded
Pdgd=Partially degraded|Offln=Offline|BT=Background Task Active
PDC=PD Cache|PI=Protection Info|SED=Self Encrypting Drive|Frgn=Foreign
DS3=Dimmer Switch 3|dflt=Default|Msng=Missing|FSpace=Free Space Present
TR=Transport Ready

Virtual Drives = 2

VD LIST :
=======

------------------------------------------------------------------------
DG/VD TYPE  State Access Consist Cache Cac sCC       Size Name          
------------------------------------------------------------------------
0/0   RAID1 Optl  RW     Yes     RWBD  -   OFF 278.875 GB Virtual Disk0
1/1   RAID6 Optl  RW     Yes     RWBD  -   OFF  72.768 TB data          
------------------------------------------------------------------------

Cac=CacheCade|Rec=Recovery|OfLn=OffLine|Pdgd=Partially Degraded|Dgrd=Degraded
Optl=Optimal|RO=Read Only|RW=Read Write|HD=Hidden|TRANS=TransportReady|B=Blocked|
Consist=Consistent|R=Read Ahead Always|NR=No Read Ahead|WB=WriteBack|
FWB=Force WriteBack|WT=WriteThrough|C=Cached IO|D=Direct IO|sCC=Scheduled
Check Consistency

Physical Drives = 14

PD LIST :
=======

-------------------------------------------------------------------------
EID:Slt DID State DG       Size Intf Med SED PI SeSz Model            Sp
-------------------------------------------------------------------------
32:0      0 Onln   1   7.276 TB SAS  HDD N   N  512B HUH721008AL5200  U  
32:1      1 Onln   1   7.276 TB SAS  HDD N   N  512B HUH721008AL5200  U  
32:2      2 Onln   1   7.276 TB SAS  HDD N   N  512B HUH721008AL5200  U  
32:3      3 Onln   1   7.276 TB SAS  HDD N   N  512B HUH721008AL5200  U  
32:4      4 Onln   1   7.276 TB SAS  HDD N   N  512B HUH721008AL5200  U  
32:5      5 Onln   1   7.276 TB SAS  HDD N   N  512B HUH721008AL5200  U  
32:6      6 Onln   1   7.276 TB SAS  HDD N   N  512B HUH721008AL5200  U  
32:7      7 Onln   1   7.276 TB SAS  HDD N   N  512B HUH721008AL5200  U  
32:8      8 Onln   1   7.276 TB SAS  HDD N   N  512B HUH721008AL5200  U  
32:9      9 Onln   1   7.276 TB SAS  HDD N   N  512B HUH721008AL5200  U  
32:10    10 Onln   1   7.276 TB SAS  HDD N   N  512B HUH721008AL5200  U  
32:11    11 Onln   1   7.276 TB SAS  HDD N   N  512B HUH721008AL5200  U  
32:12    12 Onln   0 278.875 GB SAS  HDD N   N  512B AL14SEB030NY     U  
32:13    13 Onln   0 278.875 GB SAS  HDD N   N  512B AL14SEB030NY     U  
-------------------------------------------------------------------------

EID-Enclosure Device ID|Slt-Slot No.|DID-Device ID|DG-DriveGroup
DHS-Dedicated Hot Spare|UGood-Unconfigured Good|GHS-Global Hotspare
UBad-Unconfigured Bad|Onln-Online|Offln-Offline|Intf-Interface
Med-Media Type|SED-Self Encryptive Drive|PI-Protection Info
SeSz-Sector Size|Sp-Spun|U-Up|D-Down/PowerSave|T-Transition|F-Foreign
UGUnsp-Unsupported|UGShld-UnConfigured shielded|HSPShld-Hotspare shielded
CFShld-Configured shielded|Cpybck-CopyBack|CBShld-Copyback Shielded


BBU_Info :
========

----------------------------------------------
Model State   RetentionTime Temp Mode MfgDate
----------------------------------------------
BBU   Optimal 0 hour(s)     42C  -    0/00/00
----------------------------------------------

[root@hostname:Linux]#
```


## End.
