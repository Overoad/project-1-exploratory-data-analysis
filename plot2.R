## like plot 1 we subset and create gap using asnumeric, but this time instead of histogram we plot graph with gap as y variable and time as x

setwd("C:/Users/Etienne/Downloads/projets/john opkins datascience/data exploratory")
if(!file.exists("./data")){dir.create("./data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile = "./data/Data.zip")
unzip(zipfile = "./data/Data.zip",exdir="./data")

##converting txt to table
datarep <- "C:/Users/Etienne/Downloads/projets/john opkins datascience/data exploratory/data/household_power_consumption.txt"
data <- read.table(datarep, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## creating subset 
SubSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## converting Date to better format
date <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## creates our numerical object 
gap <- as.numeric(SubSetData$Global_active_power)

png("plot2.png", width=480, height=480)
plot(date, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()