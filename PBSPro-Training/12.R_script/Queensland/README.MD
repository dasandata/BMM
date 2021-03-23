The source of this document is as follows.  
[University of Southern Queensland's HPC self-help and support][1]  

[1]:https://www.usq.edu.au/current-students/academic/higher-degree-by-research-students/conducting-research/eresearch/high-performance-computing/support  

PBS R (PDF 416KB)  
https://www.usq.edu.au/-/media/USQ/Current-students/Academic/Research/HPC/PBS-R2017.ashx?la=en

***

# basic R program on the HPC (only uses one cpu)
```bash
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
```


## Below is the R script used above. (PlotCos.r)
```R
#!/usr/bin/env Rscript
# PlotCos.r R program to plot cosine values
seq(-1000, 1000, by=.1) -> x
plot (x, cos(x), type="l")
```

***

# Parallel R program on the HPC.
```bash
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
```


## Below is the R script used above. (gibbs-bivar-task-par.r)
```R
# gibbs-bivar-task-par.r Simple 10-fold cross-validation
mpi.master <- function(y, rho, Niter) {

   # Load the R MPI package if it is not already loaded.
   if (!is.loaded("mpi_initialize")) {
     library("Rmpi")
   }


 # 4 slaves will start based on "nprocs" option to qsub command
 mpi.spawn.Rslaves()

 mpi.bcast.Robj2slave(mpi.slave)

 mpi.bcast.Robj2slave(y)
 mpi.bcast.Robj2slave(rho)
 mpi.bcast.Robj2slave(Niter)

 theta.startmat <- matrix(c(5,5, -5,5, 5,-5, -5,-5),4,2,byrow=T)
 mpi.bcast.Robj2slave(theta.startmat)

 mpi.remote.exec(mpi.slave())
}


mpi.slave <- function() {

 # Each slave gets its own copy of ind and chain based on mpi process rank
 ind <- mpi.comm.rank()

 thetamat <- matrix(0, Niter,2)
 thetamat[1,] <- theta.startmat[ind,]

 for(i in 2: Niter){
    thetamat[i, 2] <- rnorm(1, y[2] + rho *(thetamat[i-1, 1] - y[1]),
sqrt(1 - rho^2))
    thetamat[i, 1] <- rnorm(1, y[1] + rho *(thetamat[i, 2] - y[2]), sqrt(1
- rho^2))
 }

 write.table(thetamat, file=paste("output.",ind, sep=""),
            quote=F, sep="\t", row.names=F, col.names=F)
}

y <- c(0,0)
rho <- 0.8
Niter <- 1000000

start <- Sys.time()
mpi.master(y, rho, Niter)
Sys.time() - start

# Tell all slaves to close down, and exit the program
mpi.close.Rslaves(dellog=FALSE)
mpi.quit()
```

***

# References:
1. [Acadia University][2]
2. [R Project][3]
3. [R User Group - Brisbane][4]

[2]:http://math.acadiau.ca/ACMMaC/Rmpi/
[3]:http://www.r-project.org/
[4]:http://www.meetup.com/Group-for-R-Users-in-Brisbane-GRUB
