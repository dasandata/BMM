#!/bin/sh

#SBATCH -J  6GPU-tf                       # Job name
#SBATCH -o  out.test-tensorflow-6GPU.%j   # Name of stdout output file (%j expands to %jobId)
#SBATCH -p  normal                           # queue or partiton name
#SBATCH -t  01:30:00                      # Max Run time (hh:mm:ss) - 1.5 hours
#SBATCH -N  1                             # Total number of nodes requested
#SBATCH -n  6
#SBATCH --gres=gpu:6                      # Num Devices

module  purge
module  load   cuda/10.0

echo  $SLURM_SUBMIT_HOST
echo  $SLURM_JOB_NODELIST
echo  $SLURM_SUBMIT_DIR

echo  ### START ###

/home/sonic/.conda/envs/Ten-GPU-2.0-py3.6/bin/python /home/sonic/TensorFlow-2.x-Tutorials/08-ResNet/main.py

# End of File.

