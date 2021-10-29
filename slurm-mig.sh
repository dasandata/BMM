
## 만들 수 있는 Instances 목록  / List Gpu Instance Profile
nvidia-smi mig -lgip

## mig_off_gres.conf
Nodename=node[01-05]  Name=gpu  Type=A100  File=/dev/nvidia0

## mig_on_gres.conf
# GPU 0 MIG 0
Nodename=node[01-05]    Name=gpu Type=1g.5gb File=/dev/nvidia-caps/nvidia-cap66

# GPU 0 MIG 1
Nodename=node[01-05]    Name=gpu Type=1g.5gb File=/dev/nvidia-caps/nvidia-cap75

# GPU 0 MIG 2
Nodename=node[01-05]    Name=gpu Type=1g.5gb File=/dev/nvidia-caps/nvidia-cap84

# GPU 0 MIG 3
Nodename=node[02,05]    Name=gpu Type=1g.5gb File=/dev/nvidia-caps/nvidia-cap93
Nodename=node[01,03,04] Name=gpu Type=1g.5gb File=/dev/nvidia-caps/nvidia-cap102

# GPU 0 MIG 4
Nodename=node[01,03,04] Name=gpu Type=1g.5gb File=/dev/nvidia-caps/nvidia-cap111
Nodename=node[02,05]    Name=gpu Type=1g.5gb File=/dev/nvidia-caps/nvidia-cap102

# GPU 0 MIG 5
Nodename=node[01,03,04] Name=gpu Type=1g.5gb File=/dev/nvidia-caps/nvidia-cap120
Nodename=node[02,05]    Name=gpu Type=1g.5gb File=/dev/nvidia-caps/nvidia-cap111

# GPU 0 MIG 6
Nodename=node[01,03,04] Name=gpu Type=1g.5gb File=/dev/nvidia-caps/nvidia-cap129
Nodename=node[02,05]    Name=gpu Type=1g.5gb File=/dev/nvidia-caps/nvidia-cap120


## mig on / slide 7 x 1g.5gb
pdsh -w node[01-05]  nvidia-smi -mig 1   # Enabled mig node
pdsh -w node[01-05]  nvidia-smi mig -cgi 19,19,19,19,19,19,19 -C  # Create 7 x 1g.5gb

pdsh -w node[01-05]  nvidia-smi -L

/usr/bin/cp  /etc/slurm/mig_on_gres.conf   /etc/slurm/gres.conf
sed -i 's/Gres=gpu:A100:1/Gres=gpu:1g.5gb:7/'  /etc/slurm/slurm.conf

wwsh file resync
pdsh -w node[01-05]  'rm -rf /tmp/.wwgetfile*  &&  /warewulf/bin/wwgetfiles'
systemctl restart slurmctld.service ; pdsh -w node[01-05] systemctl restart slurmd
scontrol update state=resume nodename=node[01-05]

## mig off
pdsh -w node[01-05]  nvidia-smi mig -dci
pdsh -w node[01-05]  nvidia-smi mig -dgi
pdsh -w node[01-05]  nvidia-smi -mig 0

pdsh -w node[01-05]   nvidia-smi -L

/usr/bin/cp   /etc/slurm/mig_off_gres.conf   /etc/slurm/gres.conf
sed -i 's/Gres=gpu:1g.5gb:7/Gres=gpu:A100:1/'  /etc/slurm/slurm.conf

wwsh file resync
pdsh -w node[01-05]  'rm -rf /tmp/.wwgetfile*  &&  /warewulf/bin/wwgetfiles'
systemctl restart slurmctld.service ; pdsh -w node[01-05] systemctl restart slurmd
scontrol update state=resume nodename=node[01-05]


## python example
srun  --gres=gpu:1 --pty /bin/bash
ml load cuda/11.0
conda activate py38-tf2.4
python dcgan-py38-tf2.4-cuda11.0.py  # A100
python neural_network_raw.py         # mig
