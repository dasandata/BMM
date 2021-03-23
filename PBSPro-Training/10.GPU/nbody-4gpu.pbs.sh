#!/bin/bash -l
#PBS -N test-nbody-gpu
#PBS -l walltime=01:00:00
#PBS -l select=1:ncpus=4:ngpus=4
#PBS -q gpuq

###   ohpc  module  gnu5  cuda/9.0 ###  
module purge
module  load  ohpc  

#set -x

cd $PBS_O_WORKDIR


/home/data1/sample-data/nbody/nbody-cuda9 -benchmark -numbodies=1024000 -numdevices=4
