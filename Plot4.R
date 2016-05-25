## Load and process data

setwd("C:/Users/I67105/Documents/coursera/HWASSignment/course4/hw")
library(dplyr)
library(lubridate)
library(ggplot2)

rawdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

selectdata <- filter(rawdata, Date == "1/2/2007" | Date == "2/2/2007")

data <- mutate(selectdata, datetime = dmy_hms(paste(Date,Time, sep = " ")))
data <- mutate(data, Global_active_power = as.numeric(Global_active_power),
               Global_reactive_power = as.numeric(Global_reactive_power),
               Voltage = as.numeric(Voltage),
               Global_intensity = as.numeric(Global_intensity),
               Sub_metering_1 = as.numeric(Sub_metering_1),
               Sub_metering_2 = as.numeric(Sub_metering_2),
               Sub_metering_3 = as.numeric(Sub_metering_3)
               )





## Plot 4
par(mfrow=c(2,2))
plot(data$datetime, data$Global_active_power,type="l",xlab="", ylab="Gobal Active Power")

plot(data$datetime, data$Voltage,type="l", xlab="datetime",ylab="Voltage")

plot(data$datetime, data$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_2,col="red")
lines(data$datetime, data$Sub_metering_3,col="blue")
legend('topright', names(data)[c(7,8,9)] , 
       lty=1, col=c('black', 'red', 'blue'), bty='n', cex=.75)

plot(data$datetime, data$Global_reactive_power,type="l",xlab="datetime", ylab="Gobal Active Power")
dev.print(png, file="plot4.png", width=480,height=480)
dev.off()