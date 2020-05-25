#  Dell T640 Fan Speed Down
```
[root@polaris:~]#
[root@polaris:~]# racadm set system.PCIeSlotLFM.1.lfmmode 2  # custom
[root@polaris:~]# racadm set system.PCIeSlotLFM.3.lfmmode 2  # custom
[root@polaris:~]# racadm set system.PCIeSlotLFM.6.lfmmode 2  # custom
[root@polaris:~]# racadm set system.PCIeSlotLFM.8.lfmmode 2  # custom
[root@polaris:~]#
[root@polaris:~]# racadm set system.ThermalSettings.FanSpeedOffset 255 # off
[root@polaris:~]#
[root@polaris:~]# ipmitool sdr type fan
Fan1             | 38h | ok  |  7.1 | 960 RPM
Fan2             | 39h | ok  |  7.1 | 840 RPM
Fan3             | 3Ah | ok  |  7.1 | 1320 RPM
Fan4             | 3Bh | ok  |  7.1 | 1320 RPM
Fan5             | 3Ch | ok  |  7.1 | 1320 RPM
Fan6             | 3Dh | ok  |  7.1 | 1200 RPM
Fan Redundancy   | 78h | ok  |  7.1 | Fully Redundant
Fan Ext R        | 3Eh | ok  |  7.1 | 1680 RPM
Fan Ext L        | 3Fh | ok  |  7.1 | 1680 RPM
[root@polaris:~]#
```

# Dell T640 Fan Speed Max
```
[root@polaris:~]#
[root@polaris:~]# racadm set system.PCIeSlotLFM.1.lfmmode 0  # auto
[root@polaris:~]# racadm set system.PCIeSlotLFM.3.lfmmode 0  # auto
[root@polaris:~]# racadm set system.PCIeSlotLFM.6.lfmmode 0  # auto
[root@polaris:~]# racadm set system.PCIeSlotLFM.8.lfmmode 0  # auto
[root@polaris:~]#
[root@polaris:~]# racadm set system.ThermalSettings.FanSpeedOffset 3  # max
[root@polaris:~]#
[root@polaris:~]# ipmitool sdr type fan
Fan1             | 38h | ok  |  7.1 | 4800 RPM
Fan2             | 39h | ok  |  7.1 | 4320 RPM
Fan3             | 3Ah | ok  |  7.1 | 11160 RPM
Fan4             | 3Bh | ok  |  7.1 | 11160 RPM
Fan5             | 3Ch | ok  |  7.1 | 11160 RPM
Fan6             | 3Dh | ok  |  7.1 | 11040 RPM
Fan Redundancy   | 78h | ok  |  7.1 | Fully Redundant
Fan Ext R        | 3Eh | ok  |  7.1 | 16920 RPM
Fan Ext L        | 3Fh | ok  |  7.1 | 16800 RPM
[root@polaris:~]#
```
