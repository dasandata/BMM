#!/bin/bash
#PBS -N test-gpu
#PBS -l walltime=00:10:00
#PBS -l select=1:ncpus=2:ngpus=4 
#PBS -l place=scatter 
#PBS -q gpu
#PBS -j oe 
#PBS -S /bin/bash

###   ohpc  module  gnu5  cuda/9.0 ###  
module  purge
module  load  ohpc  python/3.6.4 


#set -x

cd $PBS_O_WORKDIR


CUDA_VISIBLE_DEVICES=0,1,2,3  python3  /home/data1/sample-data/TensorFlow-Examples/examples/6_MultiGPU/multigpu_cnn.py


qstat $PBS_JOBID -rn

