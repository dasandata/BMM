# racadm

## 원격지 example

```bash
원격지 command line

racadm --nocertwarn -r 192.168.0.x -u root -p 123456qwer!

example !

racadm --nocertwarn -r 192.168.0.119 -u root -p 123456qwer! $COMMAND 

```


## HWinventory - C4130 GPU
```bash
racadm --nocertwarn hwinventory | grep -i Description | tail -49 | head -8 | sort -V
```
```bash
output example !

Description = GP100GL [Tesla P100 SXM2 16GB]
Description = GP100GL [Tesla P100 SXM2 16GB]
Description = GP100GL [Tesla P100 SXM2 16GB]
Description = GP100GL [Tesla P100 SXM2 16GB]
DeviceDescription = Video Controller in Slot 3
DeviceDescription = Video Controller in Slot 4
DeviceDescription = Video Controller in Slot 5
DeviceDescription = Video Controller in Slot 6

```



## HWinventory - T640 GPU
```bash
racadm hwinventory | grep -i Description | tail -10 | head -8 | sort -V
```
```bash
output example !

Description = GA102 [GeForce RTX 3090]
Description = GA102 [GeForce RTX 3090]
Description = GA102 [GeForce RTX 3090]
Description = GA102 [GeForce RTX 3090]
DeviceDescription = GPU Controller in Slot 1 of Instance 1
DeviceDescription = GPU Controller in Slot 3 of Instance 1
DeviceDescription = GPU Controller in Slot 6 of Instance 1
DeviceDescription = GPU Controller in Slot 8 of Instance 1
```



## HWinventory - DSS8440 GPU
```bash
racadm --nocertwarn -r  192.168.0.148   -u root -p 123456qwer!  hwinventory | grep -i Description | tail -44 | head -18 | sort -V
```
```bash
output example !

Description = Integrated Matrox G200eW3 Graphics Controller
Description = NVIDIA Corporation
Description = NVIDIA Corporation
Description = NVIDIA Corporation
Description = NVIDIA Corporation
Description = NVIDIA Corporation
Description = NVIDIA Corporation
Description = NVIDIA Corporation
Description = NVIDIA Corporation
DeviceDescription = Embedded Video Controller 1
DeviceDescription = Video Controller in Slot 5
DeviceDescription = Video Controller in Slot 6
DeviceDescription = Video Controller in Slot 7
DeviceDescription = Video Controller in Slot 8
DeviceDescription = Video Controller in Slot 11
DeviceDescription = Video Controller in Slot 12
DeviceDescription = Video Controller in Slot 13
DeviceDescription = Video Controller in Slot 15
```
