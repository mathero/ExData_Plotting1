#Read in data
data <- read.csv('household_power_consumption.txt', stringsAsFactors = FALSE, sep=";", strip.white = TRUE)

#Create timestamp used for graphing
data$Datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#Convert to numeric values
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

#Take sample of data for specific date range
graphData <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

#Output and draw graph
png(filename="Rplot4.png", width=480, height=480, units="px")#comment out to write graph to screen

#Set grid
par(mfrow=c(2,2))

#Plot 1
plot(graphData$Datetime, graphData$Global_active_power, type = "n", ylab="Global Active Power", xlab="")
lines(graphData$Datetime, graphData$Global_active_power)

#Plot 2
plot(graphData$Datetime, graphData$Voltage, type = "n", ylab="Voltage", xlab="datetime")
lines(graphData$Datetime, graphData$Voltage)

#Plot 3
plot(graphData$Datetime, graphData$Sub_metering_1, type = "n", ylab="Energy sub metering", xlab="")
lines(graphData$Datetime, graphData$Sub_metering_1, col="black")
lines(graphData$Datetime, graphData$Sub_metering_2, col="red")
lines(graphData$Datetime, graphData$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black","red","blue"), bty="n")

#Plot 4
plot(graphData$Datetime, graphData$Global_reactive_power, type = "n", ylab="Global_reactive_power", xlab="datetime")
lines(graphData$Datetime, graphData$Global_reactive_power)

dev.off() #comment out to write graph to screen