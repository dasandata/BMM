#PBS -N test-hybrid-multi-2x4d2
#PBS -l walltime=00:10:00
#PBS -l select=20:mpiprocs=40 
#PBS -j oe
#PBS -m bae
#PBS -S /bin/bash

module purge
module  load ohpc  

#set -x

export OMP_NUM_THREADS=6

echo '-----------------------------------'
NP=`wc -l $PBS_NODEFILE | awk '{print $1}'`
echo 'num_proc='$NP
echo '-----------------------------------'
cat $PBS_NODEFILE
echo '-----------------------------------'

cd $PBS_O_WORKDIR
pwd

# Compile in $PBS_O_WORKDIR, printed above.
mpicc -O2 -fopenmp hello-hybrid.c -o hello-hybrid

mpirun  -np $NP -hostfile $PBS_NODEFILE    ./hello-hybrid

qstat $PBS_JOBID -ans

