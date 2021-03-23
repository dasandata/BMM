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
