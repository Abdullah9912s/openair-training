#!/usr/bin/R
library("openair")
library("plyr")
sat <- read.csv("2016.csv",header=TRUE,sep=",")
sat$date <- as.POSIXct(strptime(sat$date, format="%d-%m-%Y %H:%M"),tz="GMT")
#######################################
backup <- sat
winter <- selectByDate(sat,start="01/01/2016",end="31/12/2016",month=c("dec","jan","feb"))
winter$sea <- as.character("winter")
premon <- selectByDate(sat,start="01/01/2016",end="31/12/2016",month=c("mar","apr","may","jun"))
premon$sea <- as.character("premon")
monsoon <- selectByDate(sat,start="01/01/2016",end="31/12/2016",month=c("jul","aug","sep"))
monsoon$sea <- as.character("monsoon")
postmon <- selectByDate(sat,start="01/01/2016",end="31/12/2016",month=c("oct","nov"))
postmon$sea <- as.character("postmon")
#######################################
sat <- rbind.fill(winter,premon,monsoon,postmon)
################

smonth <- cutData(sat,type="month")
smonth <- do.call(data.frame,aggregate(. ~ month,smonth,function(x)c(mean=mean(x),sd=sd(x))))
write.csv(smonth,file="12Ndl2016Monthmeansd.csv")
################
smonth <- cutData(sat,type="sea")
smonth <- do.call(data.frame,aggregate(. ~ sea,smonth,function(x)c(mean=mean(x),sd=sd(x))))
write.csv(smonth,file="12Ndl2016Seasonmeansd.csv")
quit()
