#-----------------------------------------------------------------#
# Exploratory Data Analysis   Assignmant 1
#  
#  Data : Household power consumption
#
#  Target -> make some plots
#
#-----------------------------------------------------------------#
install.packages("jpeg")
library(jpeg)
install.packages("readr")
library(readr)
install.packages("dplyr")
library(dplyr)

HPCdata<-read_delim("household_power_consumption.txt", col_names=TRUE, delim=";", col_types="ccddddddd")
HPCplot<-filter(HPCdata, (Date=="1/2/2007" | Date=="2/2/2007"))%>%as.data.frame
x<-subset(HPCplot, select=Date:Global_active_power)
png("plot1.png", width=480, height=480, units="px", bg="white")
hist(x[,3], breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency" )
dev.off()

#-----------------------------------------------------------------------------------------------------#