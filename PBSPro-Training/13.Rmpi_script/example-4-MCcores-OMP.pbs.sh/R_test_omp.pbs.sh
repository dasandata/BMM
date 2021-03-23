###  PBS preamble

#PBS -N R_test
#PBS -M kds621122@gmail.com
#PBS -m abe

#PBS -l select=1:ncpus=16:mem=1gb 
#PBS -j oe
#PBS -V

#PBS -q workq 

####  End PBS preamble

module  purge  
module  load   ohpc   


#  Put your job commands after this line

#  List nodes and processors used
if [ -e "${PBS_NODEFILE}" ] ; then
   uniq -c $PBS_NODEFILE
fi

#  Change to the work directory
if [ -d "$PBS_O_WORKDIR" ] ; then
    cd "$PBS_O_WORKDIR"
fi


export MC_CORES=16
export OMP_NUM_THREADS=1 


#아래의  방법을 택일할 수  있습니다.    
#R CMD BATCH --no-restore --no-save test.R test.out
#R CMD BATCH --slave   test.R test.out
R --file=$PWD/test.R 

## for add   PBS_JOBID      

#R CMD BATCH --no-restore --no-save test.R test_$PBS_JOBID.out

qstat -an 




