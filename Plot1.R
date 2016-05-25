## Load and process data

setwd("C:/Users/I67105/Documents/coursera/HWASSignment/course4/hw")
library(dplyr)
library(lubridate)
library(ggplot2)
library(date)
rawdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
#rawdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c(rep('factor',2),rep('character',7)))
selectdata <- filter(rawdata, Date == "1/2/2007" | Date == "2/2/2007")
str(rawdata)
data <- mutate(selectdata, datetime = dmy_hms(paste(Date,Time, sep = " ")))
data <- mutate(data, Global_active_power = as.numeric(Global_active_power),
               Global_reactive_power = as.numeric(Global_reactive_power),
               Voltage = as.numeric(Voltage),
               Global_intensity = as.numeric(Global_intensity),
               Sub_metering_1 = as.numeric(Sub_metering_1),
               Sub_metering_2 = as.numeric(Sub_metering_2),
               Sub_metering_3 = as.numeric(Sub_metering_3)
               )

data$day1<-format(data$datetime,"%a")
str(data)
## Plot 1
#
p1 <- hist(data$Global_active_power,col="red",breaks=12)
dev.print(png, file="plot1.png", width=480,height=480) 
dev.off()

