#!/bin/bash
#PBS -N test-Simple-MPI-Job
#PBS -j oe
#PBS  -l select=20:ncpus=2:mpiprocs=2

module	purge
module  load ohpc

#set -x
cd $PBS_O_WORKDIR

mpicc -o mpi-hello mpi-hello.c

mpirun   ./mpi-hello


qstat $PBS_JOBID -ans


rm -f  mpi-hello 

