#!/bin/bash -l
#### job name & output files
#PBS -N R_Test

#### select resources
#PBS -l nodes=1:ppn=1
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


#### run compute
R --vanilla --quiet < PlotCos.r
