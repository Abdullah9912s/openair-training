#!/usr/bin/R
library("openair")
sat <- read.csv("NDL2017-AEraw.dat",header=TRUE,sep=" ")
sat$date <- with(sat, as.POSIXct(paste(date, Time), format="%Y/%m/%d %H:%M:%S"))
# sat$date <- as.POSIXct(strptime(sat$date, format="%Y-%m-%d %H:%M:%S",tz="Etc/GMT+6"))
# sat <- subset(sat,Status != 1 & Status != 2 & Status != 3 & Status != 1024 & Status != 2048 & Status != 3072 & Status != 4096 & Status != 6144 & Status != 384 & bc6 < 170000 & bb >= 0 & bb <100 & bc1 >0 & bc2>0 & bc3 >0 & bc4>0 & bc5 >0 & bc6 >0 & bc7 >0 ,select=c("date","Status","bc1","bc2","bc3","bc4","bc5","bc6","bc7","bb","K1","K2","K3","K4","K5","K6","K7"))
NDLae$stn <- "NDL"
save(NDLae,file="NDL2017AEhourStn.Rdata")
write.csv(NDLae,file="NDL2017AEhour.csv",row.names=FALSE)
NDLAEDayMean <- timeAverage(NDLae,avg.time="day")
save(NDLAEDayMean,file="NDL2017AEDayMean.Rdata")
write.csv(NDLAEDayMean,file="NDL2017AEDayMean.csv",row.names=FALSE)
quit()
