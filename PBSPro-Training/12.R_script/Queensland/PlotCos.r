#!/usr/bin/env Rscript
# PlotCos.r R program to plot cosine values
seq(-1000, 1000, by=.1) -> x
plot (x, cos(x), type="l")
