```bash
dmidecode --type system | grep 'Product Name:' | cut -d ' ' -f 4  

GPUTYPE=$(nvidia-smi -L | head -1 | awk '{print $3 $4}')

```
