#!/bin/bash

#SBATCH -J  nest                       # Job name
#SBATCH -o  out.nest.%j   # Name of stdout output file (%j expands to %jobId)
#SBATCH -p  normal                           # queue or partiton name
#SBATCH -t  01:30:00                      # Max Run time (hh:mm:ss) - 1.5 hours
#SBATCH -N 1                              # Use one node
#SBATCH -n 1                              # Run a single task

module purge
module ohpc


echo "SLURM_SUBMIT_DIR=$SLURM_SUBMIT_DIR"

srun -l /bin/hostname
srun -l /bin/pwd
srun -l /bin/date


cd $SLURM_SUBMIT_DIR


gcc nest.c -lm

date

./a.out 45900 12100

date

rm -f a.out

squeue --job $SLURM_JOBID

