#!/bin/bash

#SBATCH -J  mpi                       # Job name
#SBATCH -o  out.mpi.%j   # Name of stdout output file (%j expands to %jobId)
#SBATCH -p  normal                        # queue or partiton name
#SBATCH -t  01:30:00                      # Max Run time (hh:mm:ss) - 1.5 hours
#SBATCH -N 1                              # Use one node
##SBATCH --ntasks-per-node=8              # Number of tasks (MPI processes)
#SBATCH -n 8                              # Number of tasks (MPI processes)

echo "working directory = "$SLURM_SUBMIT_DIR


mpirun -np $SLURM_NTASKS  ./a.out
