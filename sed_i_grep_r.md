
```bash
grep "nvidia-367" -r /usr/local/cuda-8.0/samples/ -l
sed -i "s/nvidia-367/nvidia-390/g"    `grep "nvidia-367" -r /usr/local/cuda-8.0/samples/ -l`

```
