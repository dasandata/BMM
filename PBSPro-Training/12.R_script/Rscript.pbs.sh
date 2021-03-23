#!/bin/bash 
#PBS -N test-R-sqrt 
#PBS -l walltime=00:10:00
#PBS -j oe

module purge
module load gnu7 R

#set -x 
cd $PBS_O_WORKDIR

#Rscript sqrt.R 
R --file=$PWD/sqrt.R
