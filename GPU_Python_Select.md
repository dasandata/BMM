# 0. Python 파일  GPU 선언하기

0-1. GPU 번호로 선언 \n
0-2. GPU / UUID 선언


## 1. 테스트 파일

```
[root@Dell-DSS8440-GPU-Test:~]# pwd

/root

[root@Dell-DSS8440-GPU-Test:~]#

[root@Dell-DSS8440-GPU-Test:~]# cd TensorFlow-Examples/examples/3_NeuralNetworks/

[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]#

[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]# pwd

/root/TensorFlow-Examples/examples/3_NeuralNetworks

[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]#

[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]# ls

gan.py

[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]#

[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]# head -n 27 gan.py | tail

Author: Aymeric Damien

Project: https://github.com/aymericdamien/TensorFlow-Examples/

"""


from __future__ import division, print_function, absolute_import


import matplotlib.pyplot as plt

import numpy as np

import tensorflow as tf


[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]#
```

## 2. GPU 번호로 선언 (.py)

```
[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]#

[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]# vi gan.py

[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]#

[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]# head -n 32 gan.py | tail


import matplotlib.pyplot as plt

import numpy as np

import tensorflow as tf

import os


SelectGPU = "0,7"


os.environ["CUDA_VISIBLE_DEVICES"]= str(SelectGPU)


[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]#

[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]# python gan.py

[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]#


Every 1.0s: nvidia-smi                                                                                                  Dell-DSS8440-GPU-Test: Thu Mar 26 17:17:21 2020


Thu Mar 26 17:17:21 2020

+-----------------------------------------------------------------------------+

| NVIDIA-SMI 440.64.00    Driver Version: 440.64.00    CUDA Version: 10.2     |

|-------------------------------+----------------------+----------------------+

| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |

| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |

|===============================+======================+======================|

|   0  GeForce RTX 208...  On   | 00000000:11:00.0 Off |                  N/A |

| 31%   33C    P2    59W / 250W |  10663MiB / 11019MiB |     13%      Default |

+-------------------------------+----------------------+----------------------+

|   1  GeForce RTX 208...  On   | 00000000:12:00.0 Off |                  N/A |

| 31%   30C    P8     1W / 250W |      0MiB / 11019MiB |      0%      Default |

+-------------------------------+----------------------+----------------------+

|   2  GeForce RTX 208...  On   | 00000000:47:00.0 Off |                  N/A |

| 31%   31C    P8    15W / 250W |      0MiB / 11019MiB |      0%      Default |

+-------------------------------+----------------------+----------------------+

|   3  GeForce RTX 208...  On   | 00000000:48:00.0 Off |                  N/A |

| 31%   30C    P8    18W / 250W |      0MiB / 11019MiB |      0%      Default |

+-------------------------------+----------------------+----------------------+

|   4  GeForce RTX 208...  On   | 00000000:89:00.0 Off |                  N/A |

| 31%   31C    P8     7W / 250W |      0MiB / 11019MiB |      0%      Default |

+-------------------------------+----------------------+----------------------+

|   5  GeForce RTX 208...  On   | 00000000:8A:00.0 Off |                  N/A |

| 31%   30C    P8    17W / 250W |      0MiB / 11019MiB |      0%      Default |

+-------------------------------+----------------------+----------------------+

|   6  GeForce RTX 208...  On   | 00000000:C0:00.0 Off |                  N/A |

| 31%   29C    P8    13W / 250W |      0MiB / 11019MiB |      0%      Default |

+-------------------------------+----------------------+----------------------+

|   7  GeForce RTX 208...  On   | 00000000:C1:00.0 Off |                  N/A |

| 31%   33C    P2    54W / 250W |    167MiB / 11019MiB |      0%      Default |

+-------------------------------+----------------------+----------------------+


+-----------------------------------------------------------------------------+

| Processes:                                                       GPU Memory |

|  GPU       PID   Type   Process name                             Usage      |

|=============================================================================|

|    0     29033      C   python                                     10651MiB |

|    7     29033      C   python                                       155MiB |

+-----------------------------------------------------------------------------+
```

## 3. GPU / UUID 선언 (.py)

```
[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]# nvidia-smi -L

GPU 0: GeForce RTX 2080 Ti (UUID: GPU-eb10d153-4284-ecae-8c5f-866cd44e87a6)

GPU 1: GeForce RTX 2080 Ti (UUID: GPU-f75bd114-ac8c-b82f-b957-898ef1b9c342)

GPU 2: GeForce RTX 2080 Ti (UUID: GPU-6dd4707a-202f-2bc9-14b6-e4a42aaa466a)

GPU 3: GeForce RTX 2080 Ti (UUID: GPU-ae8fa34d-3879-0193-92ec-eaa74f108a9e)

GPU 4: GeForce RTX 2080 Ti (UUID: GPU-8f11d502-8e14-1309-ca78-58ed823122cd)

GPU 5: GeForce RTX 2080 Ti (UUID: GPU-ea76af07-ec2a-8e92-65fc-7048a435071d)

GPU 6: GeForce RTX 2080 Ti (UUID: GPU-9ec91272-6878-b906-8a92-361435756c1a)

GPU 7: GeForce RTX 2080 Ti (UUID: GPU-03770589-cb92-8fcd-2259-5445608e63af)

[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]#

[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]# vi gan.py

[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]#

[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]# head -n 32 gan.py | tail


import matplotlib.pyplot as plt

import numpy as np

import tensorflow as tf

import os


SelectGPU = "GPU-f75bd114,GPU-9ec91272"


os.environ["CUDA_VISIBLE_DEVICES"]= str(SelectGPU)


[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]#

[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]# python gan.py

[root@Dell-DSS8440-GPU-Test:3_NeuralNetworks]#


Dell-DSS8440-GPU-Test: Thu Mar 26 17:25:35 2020


Thu Mar 26 17:25:35 2020

+-----------------------------------------------------------------------------+

| NVIDIA-SMI 440.64.00    Driver Version: 440.64.00    CUDA Version: 10.2     |

|-------------------------------+----------------------+----------------------+

| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |

| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |

|===============================+======================+======================|

|   0  GeForce RTX 208...  On   | 00000000:11:00.0 Off |                  N/A |

| 31%   31C    P8    12W / 250W |      0MiB / 11019MiB |      0%      Default |

+-------------------------------+----------------------+----------------------+

|   1  GeForce RTX 208...  On   | 00000000:12:00.0 Off |                  N/A |

| 31%   32C    P2    50W / 250W |  10663MiB / 11019MiB |     14%      Default |

+-------------------------------+----------------------+----------------------+

|   2  GeForce RTX 208...  On   | 00000000:47:00.0 Off |                  N/A |

| 31%   31C    P8    15W / 250W |      0MiB / 11019MiB |      0%      Default |

+-------------------------------+----------------------+----------------------+

|   3  GeForce RTX 208...  On   | 00000000:48:00.0 Off |                  N/A |

| 31%   30C    P8    17W / 250W |      0MiB / 11019MiB |      0%      Default |

+-------------------------------+----------------------+----------------------+

|   4  GeForce RTX 208...  On   | 00000000:89:00.0 Off |                  N/A |

| 31%   31C    P8     7W / 250W |      0MiB / 11019MiB |      0%      Default |

+-------------------------------+----------------------+----------------------+

|   5  GeForce RTX 208...  On   | 00000000:8A:00.0 Off |                  N/A |

| 31%   30C    P8    18W / 250W |      0MiB / 11019MiB |      0%      Default |

+-------------------------------+----------------------+----------------------+

|   6  GeForce RTX 208...  On   | 00000000:C0:00.0 Off |                  N/A |

| 31%   31C    P2    58W / 250W |    167MiB / 11019MiB |      0%      Default |

+-------------------------------+----------------------+----------------------+

|   7  GeForce RTX 208...  On   | 00000000:C1:00.0 Off |                  N/A |

| 31%   30C    P8     6W / 250W |      0MiB / 11019MiB |      0%      Default |

+-------------------------------+----------------------+----------------------+


+-----------------------------------------------------------------------------+

| Processes:                                                       GPU Memory |

|  GPU       PID   Type   Process name                             Usage      |

|=============================================================================|

|    1     30629      C   python                                     10651MiB |

|    6     30629      C   python                                       155MiB |

+-----------------------------------------------------------------------------+

```

## 4. (.py) 옵션 내용

```
import os

SelectGPU = "0,7"

os.environ["CUDA_VISIBLE_DEVICES"]= str(SelectGPU)
```

```
import os

SelectGPU = "GPU-f75bd114,GPU-9ec91272"

os.environ["CUDA_VISIBLE_DEVICES"]= str(SelectGPU)
```
