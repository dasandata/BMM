#!/bin/bash

#SBATCH -J  omp                       # Job name
#SBATCH -o  out.omp.%j   # Name of stdout output file (%j expands to %jobId)
#SBATCH -p  normal                        # queue or partiton name
#SBATCH -t  01:30:00                      # Max Run time (hh:mm:ss) - 1.5 hours
#SBATCH -N 1                              # Use one node
#SBATCH -n 8                              # Run a single task

# SLURM_CPUS_PER_TASK is set to the value of -c, but only if -c is explicitly set
if [ -n "$SLURM_CPUS_PER_TASK" ]; then
  omp_threads=$SLURM_CPUS_PER_TASK
else
  omp_threads=1
fi
export OMP_NUM_THREADS=$omp_threads

echo "working directory = "$SLURM_SUBMIT_DIR

srun a.out
