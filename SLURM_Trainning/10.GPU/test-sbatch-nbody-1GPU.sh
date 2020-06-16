#!/bin/sh

#SBATCH -J  1GPU-tf                       # Job name
#SBATCH -o  out.test-tensorflow-1GPU.%j   # Name of stdout output file (%j expands to %jobId)
#SBATCH -p  normal                           # queue or partiton name
#SBATCH -t  01:30:00                      # Max Run time (hh:mm:ss) - 1.5 hours
#SBATCH -N 1
#SBATCH -n 4
##SBATCH --gres=gpu:1                      # Num Devices  X GPUs on each node you ask for

module  purge
module  load  ohpc  cuda/10.0

echo  $SLURM_SUBMIT_HOST
echo  $SLURM_JOB_NODELIST
echo  $SLURM_SUBMIT_DIR

echo  ### START ###


### cuda  test  ###

/opt/ohpc/pub/examples/NVIDIA_CUDA-10.0_Samples/bin/x86_64/linux/release/nbody  -benchmark  -numdevices=1  -numbodies=1024000

date  ; echo  ##### END #####

