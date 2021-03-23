#!/bin/bash 
#PBS -N test-sleepy 
#PBS -l walltime=00:10:00
#PBS -j oe

module purge
module load ohpc

#set -x 
cd $PBS_O_WORKDIR

qstat -u $USER -rn 

date
pwd
hostname
sleep 20
date

