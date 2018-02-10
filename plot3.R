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
datem <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## creates our numerical object 
gap <- as.numeric(SubSetData$Global_active_power)
sm1 <- as.numeric(SubSetData$Sub_metering_1)
sm2 <- as.numeric(SubSetData$Sub_metering_2)
sm3 <- as.numeric(SubSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(date, sm1, type="l", ylab="Energy Sub metering", xlab="")
lines(date, sm2, type="l", col="red")
lines(date, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()