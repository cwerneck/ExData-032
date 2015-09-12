#-----------------------------------------------------------------#
# Exploratory Data Analysis   Assignmant 1
#  
#  Data : Household power consumption
#
#  Target -> make some plots  
#
#  plot4
#
#-----------------------------------------------------------------#
library(jpeg)
library(readr)
library(dplyr)


HPCdata<-read_delim("household_power_consumption.txt", col_names=TRUE, delim=";", col_types="ccddddddd")
HPCplot<-filter(HPCdata, (Date=="1/2/2007" | Date=="2/2/2007"))%>%as.data.frame

dt<-paste(HPCplot[,1], HPCplot[,2], " EST")
z<-as.POSIXlt(dt, format="%d/%m/%Y %H:%M:%S")

#-- first graph ----

png("plot4.png", width=480, height=480, units="px", bg="white")

par(mfrow=c(2,2))
par(cex = .58) # change font size

with(HPCplot, plot (z, HPCplot[,3], type="l", col="black", xlab=" ", ylab="Global Active Power"))

#-- second graph ----

with(HPCplot, plot (z, HPCplot[,5], type="l", col="black", xlab="datetime ", ylab="Voltage"))

#-- third graph ----

with(HPCplot, plot (z, HPCplot[,7], type="l", col="black", xlab=" ", ylab="Energy sub metering"))
with(HPCplot, points (z, HPCplot[,8], type="l", col="red"))
with(HPCplot, points (z, HPCplot[,9], type="l", col="blue"))
legend("topright", lwd=2, pch=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#-- fourth graph ----

with(HPCplot, plot (z, HPCplot[,4], type="l", col="black", xlab=" ", ylab="Global_reactive_power"))

dev.off()
