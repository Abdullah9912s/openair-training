#!/usr/bin/R
library("openair")
setwd("E:/")
sat <- read.csv("",header=TRUE,sep=",")
png("googlemaps.png",width = 5*300, height = 4*300, res=150)
openairmaps::polarMap(sat1,x="ws", pollutant = "ADA_13...13_CO.ppm")
dev.off()
quit()
