# idrac6 (racadm6) Nic Selection

```bash

[root@data:~]#
[root@data:~]# racadm config -g cfgLAnNetworking -o cfgNicSelection 1
Object value modified successfully
[root@data:~]#
[root@data:~]# racadm getniccfg

IPv4 settings:
NIC Enabled     = 1
IPv4 Enabled    = 1
DHCP Enabled    = 0
IP Address      = 192.168.0.3
Subnet Mask     = 255.255.255.0
Gateway         = 192.168.0.1

IPv6 settings:
IPv6 Enabled    = 0
DHCP6 Enabled   = 1
IP Address 1    = ::
Gateway         = ::
Link Local Address = ::
IP Address 2    = ::
IP Address 3    = ::
IP Address 4    = ::
IP Address 5    = ::
IP Address 6    = ::
IP Address 7    = ::
IP Address 8    = ::
IP Address 9    = ::
IP Address 10   = ::
IP Address 11   = ::
IP Address 12   = ::
IP Address 13   = ::
IP Address 14   = ::
IP Address 15   = ::

LOM Status:
NIC Selection   = Shared with failover (LOM2)
Link Detected   = No
Speed           = Unknown
Duplex Mode     = Unknown
Active LOM in Shared Mode = None
[root@data:~]#
[root@data:~]# racadm config -g cfgLAnNetworking -o cfgNicSelection 0
Object value modified successfully
[root@data:~]#
[root@data:~]#
[root@data:~]# racadm getniccfg

IPv4 settings:
NIC Enabled     = 1
IPv4 Enabled    = 1
DHCP Enabled    = 0
IP Address      = 192.168.0.3
Subnet Mask     = 255.255.255.0
Gateway         = 192.168.0.1

IPv6 settings:
IPv6 Enabled    = 0
DHCP6 Enabled   = 1
IP Address 1    = ::
Gateway         = ::
Link Local Address = ::
IP Address 2    = ::
IP Address 3    = ::
IP Address 4    = ::
IP Address 5    = ::
IP Address 6    = ::
IP Address 7    = ::
IP Address 8    = ::
IP Address 9    = ::
IP Address 10   = ::
IP Address 11   = ::
IP Address 12   = ::
IP Address 13   = ::
IP Address 14   = ::
IP Address 15   = ::

LOM Status:
NIC Selection   = Shared
Link Detected   = No
Speed           = Unknown
Duplex Mode     = Unknown
Active LOM in Shared Mode = None
[root@data:~]#
[root@data:~]#

```
