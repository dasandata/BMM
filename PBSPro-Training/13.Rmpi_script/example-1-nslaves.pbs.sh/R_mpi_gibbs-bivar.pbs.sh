
#!/bin/bash -l

#### job name & output files
#PBS -N Rmpi_Test

#
#### select resources
#PBS -l select=2:ncpus=4:mpiprocs=4:mem=1G
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
# Launch MPI-based executable
echo starting

echo '---------------------------------------------'
num_proc=`wc -l $PBS_NODEFILE | awk '{print $1}'`
echo 'num_proc='$num_proc
echo '---------------------------------------------'
cat $PBS_NODEFILE
echo '---------------------------------------------'

RCMD=/opt/ohpc/pub/libs/gnu7/R/3.5.0/bin/R

##Display messages  ,  resolve error 
#mpirun -hosts $PBS_NODEFILE -np $num_proc  $RCMD --vanilla --quiet CMD BATCH  gibbs-bivar-task-par.R  gibbs-bivar-task-par.$PBS_JOBID.out


## You can select the next job .  
## qsub  OK  Job  

#mpirun  -np $num_proc $RCMD --vanilla --quiet CMD BATCH  gibbs-bivar-task-par.R  gibbs-bivar-task-par.$PBS_JOBID.out 
#mpirun  $RCMD  --vanilla --quiet CMD BATCH  gibbs-bivar-task-par.R gibbs-bivar-task-par.$PBS_JOBID.out 

#### qsub OK Job , run same compute with limited output from R
#mpirun  $RCMD --vanilla --quiet < gibbs-bivar-task-par.R    ##  Fail   $PBS_JOBID=220  
#mpirun  -np $num_proc $RCMD --vanilla --quiet < gibbs-bivar-task-par.R     ## Fail $PBS_JOBID=221    
mpirun -np 1 $RCMD --vanilla --quiet < gibbs-bivar-task-par.R 


