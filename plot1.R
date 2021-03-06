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
png(filename="plot1.png", width=480, height=480, units="px") #comment out to write graph to screen

with(graphData, hist(Global_active_power, col="red", bg="white", main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)"))

dev.off()  #comment out to write graph to screen