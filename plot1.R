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

#Plotting First Histogram
  png("plot1.png", width=480, height=480)
  hist(energyData2$Global_active_power, 
       col = "red", 
       main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)")
  dev.off()