
#!/bin/bash -l

#### job name & output files
#PBS -N Rmpi_Test

#
#### select resources
#PBS -l select=4:ncpus=2:mpiprocs=2:mem=1G
#PBS -l walltime=0:10:00

#
#### redirect output
#PBS -j oe

#
#### mail options
#PBS -m ae
#PBS -M kds621122@gmail.com
#

#### queue name
#PBS -q workq  

#### change directory to working directory
cd $PBS_O_WORKDIR

#### load module
module purge 
module load ohpc 

#### run compute with no output from R
####  mpirun --help  | grep  hosts  

RCMD=/opt/ohpc/pub/libs/gnu7/R/3.5.0/bin/R

mpirun  -np 1  $RCMD  --vanilla --quiet CMD BATCH  testRmpi.R  TEST_$PBS_JOBID.out 
#mpirun  $RCMD  --vanilla --quiet CMD BATCH  testRmpi.R   TEST_$PBS_JOBID.out

