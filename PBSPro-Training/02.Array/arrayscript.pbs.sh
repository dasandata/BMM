#!/bin/bash
#PBS -N ArrayExample
#PBS -l walltime=00:10:00
#PBS -j oe
#PBS -S /bin/bash
#PBS -J 1-4

module purge
module load ohpc

#set -x 
cd $PBS_O_WORKDIR

date
sleep 20
date

