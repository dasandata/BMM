#!/bin/bash

#SBATCH -J  array                       # Job name
#SBATCH -o  out.array.%j   # Name of stdout output file (%j expands to %jobId)
#SBATCH -p  normal                        # queue or partiton name
#SBATCH -t  01:30:00                      # Max Run time (hh:mm:ss) - 1.5 hours
#SBATCH -N 1                              # Use one node
#SBATCH -n 1                              # Run a single task
#SBATCH --array=1-5                       # Array range

pwd; hostname; date


#Set the number of runs that each SLURM task should do
PER_TASK=1000

# Calculate the starting and ending values for this task based
# on the SLURM task and the number of runs per task.
START_NUM=$(( ($SLURM_ARRAY_TASK_ID - 1) * $PER_TASK + 1 ))
END_NUM=$(( $SLURM_ARRAY_TASK_ID * $PER_TASK ))

# Print the task and run range
echo This is task $SLURM_ARRAY_TASK_ID, which will do runs $START_NUM to $END_NUM

# Run the loop of runs for this task.
for (( run=$START_NUM; run<=END_NUM; run++ )); do
  echo This is SLURM task $SLURM_ARRAY_TASK_ID, run number $run
  #Do your stuff here
done


date
