#!/usr/bin/R
sat <- read.csv('My_2016_2021_Raw.csv',header=TRUE,sep=',')
sat$date <- as.POSIXct(strptime(sat$Date, format="%d/%m/%Y %H:%M"),tz="GMT")
sat  <- subset(sat,select=c(date,O3))
#sat$stn <- "Manama"
save(sat,file="OzoneDataManama.Rdata")
#######################
load('5YManama2016to2021.RData')
load('OzoneDataManama.Rdata')
mas <- merge(sat,traj,  by = "date")

#########################
clust <- trajCluster(mas, method = "Euclid", n.cluster= 4, col = "increment")
png("5y4ClusterOzoneCWT.png",width = 8*300, height = 2*300, res=150)
trajLevel(subset(clust$data,lon > 0 & lon < 100 & lat > -20 & lat < 60), pollutant = NOx", type = "cluster",statistic="cwt",parameters=NULL,orientation=c(90,0,0),projection="mercator",cols = "increment",main="CWT_TRIV(AOD500)-2011_2015",map=TRUE,map.fill=FALSE,grid.col="gray",par.settings=list(fontsize=list(text=12)), layout = c(4, 1))
dev.off()
