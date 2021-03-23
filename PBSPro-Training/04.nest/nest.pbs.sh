#!/bin/bash
#PBS -N test-nest
#PBS -l walltime=00:10:00
#PBS -j oe
#PBS -S /bin/bash
#PBS -m bae

module purge
module load ohpc

#set -x
cd $PBS_O_WORKDIR

gcc nest.c -lm 
./a.out 4590000    1210000   

rm -f ./a.out
