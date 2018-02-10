setwd("C:/Users/Etienne/Downloads/projets/john opkins datascience/data exploratory")
if(!file.exists("./data")){dir.create("./data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile = "./data/Data.zip")
unzip(zipfile = "./data/Data.zip",exdir="./data")

datarep <- "C:/Users/Etienne/Downloads/projets/john opkins datascience/data exploratory/data/household_power_consumption.txt"
data <- read.table(datarep, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

SubSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

gap <- as.numeric(SubSetData$Global_active_power)
garp <- as.numeric(SubSetData$Global_reactive_power)
voltage <- as.numeric(SubSetData$Voltage)
sm1 <- as.numeric(SubSetData$Sub_metering_1)
sm2 <- as.numeric(SubSetData$Sub_metering_2)
sm3 <- as.numeric(SubSetData$Sub_metering_3)


png("plot4.png", width=480, height=480)

## we display 4 graph in one creating a éxé grid of graphs
par(mfrow = c(2, 2)) 

plot(date, gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sm1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date, garp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
