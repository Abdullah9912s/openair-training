library("openair")
setwd("E:/MUSIC/saudiEnvirozone/data")

sat1 <- read.csv("King fahd_Traffic station.csv", header=TRUE, sep=",")
sat2 <- read.csv("Al Hair_Back Ground station.csv", header=TRUE, sep=",")
sat3 <- read.csv("Al Amal_urban station.csv", header=TRUE, sep=",")

sat1$date <- as.POSIXct(strptime(sat1$Dates, format="%d/%m/%Y %H:%M", tz="Etc/GMT+3"))
sat2$date <- as.POSIXct(strptime(sat2$Dates, format="%d/%m/%Y %H:%M", tz="Etc/GMT+3"))
sat3$date <- as.POSIXct(strptime(sat3$Dates, format="%d/%m/%Y %H:%M", tz="Etc/GMT+3"))

subsetsat1 <- subset(sat1, select=c("date","ADA_13...13_NO2.ppb"))
subsetsat2 <- subset(sat2, select=c("date","ADA_03...03_NO2.ppb"))
subsetsat3 <- subset(sat3, select=c("date","ADA_08...08_NO2.ppb"))

subsetsat1$stn <-  "King Fahd"
subsetsat2$stn <-  "Al Hair"
subsetsat3$stn <-  "Al Amal"

names(subsetsat1) <- c("date","NO2","stn")
names(subsetsat2) <- c("date","NO2","stn")
names(subsetsat3) <- c("date","NO2","stn")

final <- rbind(subsetsat1, subsetsat2, subsetsat3)

trendLevel(final, x="month", y="stn")
