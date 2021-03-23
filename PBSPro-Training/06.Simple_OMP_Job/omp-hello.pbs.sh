#!/bin/bash
#PBS -N test-omp-hello 
#PBS -l walltime=0:10:00
#PBS -l select=1:ncpus=1 
#PBS -j oe
#PBS -m bae
#PBS -S /bin/bash


module purge
module load ohpc


#set -x

cd $PBS_O_WORKDIR

gcc -fopenmp omp-hello.c -o omp-hello

export OMP_NUM_THREADS=16

./omp-hello

qstat  -ans  

rm -f  omp-hello
