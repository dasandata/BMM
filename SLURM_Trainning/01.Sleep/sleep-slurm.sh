#!/bin/bash

#SBATCH -J  sleep                       # Job name
#SBATCH -o  out.sleep.%j   # Name of stdout output file (%j expands to %jobId)
#SBATCH -p  normal                           # queue or partiton name
#SBATCH -t  01:30:00                      # Max Run time (hh:mm:ss) - 1.5 hours
#SBATCH -N 1                              # Use one node
#SBATCH -n 1                              # Run a single task

module purge
module ohpc

date
sleep 30
date


