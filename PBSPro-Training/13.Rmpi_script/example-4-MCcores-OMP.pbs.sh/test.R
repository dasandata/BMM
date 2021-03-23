
library(datasets)
library(Rmpi)
require(doMC)
registerDoMC(cores = getOption("ms.cores",2L))
data(iris)
summary(iris)
