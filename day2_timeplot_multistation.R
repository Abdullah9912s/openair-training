#!/usr/bin/R
library("openair")
sat <- read.csv("All2016AE-Network.csv",header=TRUE,sep=",")
#######################################
png("TimePlotDailyAvgBF.png",width = 8*300, height = 4*300, res=150)
timePlot(selectByDate(sat, year = 2016),pollutant="bb",statistics="mean",avg.time="day",group=TRUE,lwd=4,lty=1,main="Day averaged BBF 2016 (IMD)",par.settings=list(fontsize=list(text=18)),type="stn",layout=c(4,4))
dev.off()
