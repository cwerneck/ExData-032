#-----------------------------------------------------------------#
# Exploratory Data Analysis   Assignmant 1
#  
#  Data : Household power consumption
#
#  Target -> make some plots
#
#-----------------------------------------------------------------#
library(jpeg)
library(readr)
library(dplyr)


HPCdata<-read_delim("household_power_consumption.txt", col_names=TRUE, delim=";", col_types="ccddddddd")
HPCplot<-filter(HPCdata, (Date=="1/2/2007" | Date=="2/2/2007"))%>%as.data.frame
x<-subset(HPCplot, select=Date:Global_active_power)
dt<-paste(x[,1], x[,2], " EST")
z<-as.POSIXlt(dt, format="%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480, units="px", bg="white")
plot (z, x[,3], type="l", main="Temporal Global Active Power (kW) during 2 days ", xlab=" ", ylab="Global Active Power (kilowatts)")

dev.off()

