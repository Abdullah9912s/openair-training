#!/usr/bin/R
library("openair")
setwd("E:/")
sat <- read.csv("data.txt",header=TRUE,sep=",")
png("googlemaps.png",width = 5*300, height = 4*300, res=150)
googleMapsPlot(sat,lat="lat",lon="lon",pollutant="MonthlyMean")
# googleMapsPlot(sat,lat="lat",lon="lon",pollutant="MonthlyMean",plot.transparent=0.7,zoom=4,size=c(450,450),main="SATEESH",par.settings=list(fontsize=list(text=18)),axes=FALSE,strip=FALSE)
dev.off()
quit()
