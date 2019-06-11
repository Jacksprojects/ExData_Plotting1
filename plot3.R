library(dplyr)
library(plyr)
library(lubridate)

#Download the folder containing the data set:
  if(!file.exists("./cleaningDataWeek4")){dir.create("./cleaningDataWeek4")}
  if(!file.exists("./cleaningDataWeek4/energydata.zip")){
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url, destfile = "./cleaningDataWeek4/energydata.zip")
    unzip(zipfile = "./cleaningDataWeek4/energydata.zip", exdir = "./cleaningDataWeek4")
}

# Read in the data set
  energyData <- data.table :: fread(input = "~/cleaningDataWeek4/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings = '?')
  energyData[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
  energyData2 <- energyData[(dateTime >= "2007-02-01") & (dateTime <= "2007-02-03")]

# Plotting Third Plot
  png("plot3.png", width=480, height=480)
  plot(energyData2$dateTime, energyData2$Sub_metering_1, type = 'l', col = "black")
  lines(energyData2$dateTime, energyData2$Sub_metering_2, col = 'red')
  lines(energyData2$dateTime, energyData2$Sub_metering_3, col = 'blue')
  legend("topright",
        col = c("black", "red", "blue"),
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty = c(1,1), lwd = c(1,1))
  dev.off()