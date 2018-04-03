
```bash

ifconfig -a | grep "inet " | grep "Bcast:" | awk '{print $2}' | awk -F: '{print $2}'

ip addr | grep "inet " | grep brd | awk '{print $2}' | awk -F/ '{print $1}'

```
