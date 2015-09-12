#-----------------------------------------------------------------#
# Exploratory Data Analysis   Assignmant 1
#  
#  Data : Household power consumption
#
#  Target -> make some plots  
#
#  plot3
#
#-----------------------------------------------------------------#
library(jpeg)
library(readr)
library(dplyr)


HPCdata<-read_delim("household_power_consumption.txt", col_names=TRUE, delim=";", col_types="ccddddddd")
HPCplot<-filter(HPCdata, (Date=="1/2/2007" | Date=="2/2/2007"))%>%as.data.frame
##### ---x<-subset(HPCplot, select=Date:Global_active_power)
dt<-paste(HPCplot[,1], HPCplot[,2], " EST")
z<-as.POSIXlt(dt, format="%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480, units="px", bg="white")

with(HPCplot, plot (z, HPCplot[,7], type="l", col="black", xlab=" ", ylab="Energy sub metering"))
with(HPCplot, points (z, HPCplot[,8], type="l", col="red"))
with(HPCplot, points (z, HPCplot[,9], type="l", col="blue"))
legend("topright", lwd=2, pch=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
