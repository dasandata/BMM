#!/bin/bash -l
#### job name & output files
#PBS -N Rmpi_Test

#### select resources
#PBS -l nodes=2:ppn=2
#PBS -l walltime=0:10:00
#PBS -l mem=1g

#### redirect output
#PBS -j oe

#### mail options
#PBS -m ae
#PBS -M ruser@usq.edu.au

#### queue name
#PBS -q default


#### change directory to working directory
cd $PBS_O_WORKDIR


#### load module
module load r/3.1.2-gnu
module load openmpi/1.8.8-gnu


#### run compute with no output from R
mpirun --quiet -hostfile $PBS_NODEFILE -np 1 R --vanilla --quiet CMD BATCH
gibbs-bivar-task-par.r


#### run same compute with limited output from R
####mpirun --quiet -hostfile $PBS_NODEFILE -np 1 R --vanilla --quiet <
gibbs-bivar-task-par.r
