# Load the R MPI package if it is not already loaded.

if (!is.loaded("mpi_initialize")) {
    library("Rmpi")
}

# Spawn N-1 workers
#mpi.spawn.Rslaves(nslaves=mpi.universe.size()-1)

# 4 slaves will start based on "nprocs" option to qsub command

mpi.spawn.Rslaves(nslaves=8)


# The command we want to run on all the nodes/processors we have
mpi.remote.exec(paste("I am ", mpi.comm.rank(), " of ",
                       mpi.comm.size(), " on ",
                       Sys.info()
                       [c("nodename")]
                     )
               )

# Stop the worker processes
mpi.close.Rslaves()

# Close down the MPI processes and quit R
mpi.quit()
