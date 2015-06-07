##Reads data in
data <- "C:/Users/Sean/Desktop/Coursera/power/household_power_consumption.txt"
power<- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subsets data to just the two days desired
powerFeb <- power[power$Date %in% c("1/2/2007","2/2/2007"),]

##Sets graphing device (screen) to display 4 graphs (2 rows, 2 columns)
par(mfrow=c(2,2))

##Values for energy sub metering
sm1 <- powerFeb$Sub_metering_1
sm2 <- powerFeb$Sub_metering_2
sm3 <- powerFeb$Sub_metering_3

##Other values
globalActivePower <- as.numeric(powerFeb$Global_active_power)
globalReactivePower <- as.numeric(powerFeb$Global_reactive_power)
voltage <- as.numeric (powerFeb$Voltage)

##Converts date and time to usable format and then pastes them together
dateTime <- strptime(paste(powerFeb$Date, powerFeb$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Plot 1- Global Active Power by Day of Week
plot(dateTime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

##Plot 2- Global Reactive Power by Day of Week
plot(dateTime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")


##Plot 3- Energy Sub Metering by Day of Week
plot(dateTime, sm1, type = "l", xlab = " ", ylab = "Energy Sub Metering")
lines(dateTime, sm2, type = "l", col = "red", xlab = " ", ylab = "Energy Sub Metering")
lines(dateTime, sm3, type = "l", col = "blue", xlab = " ", ylab = "Energy Sub Metering")
legend("topright", lwd = c(1,1,1), lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Plot 4- Global Reactive Power by Day of Week
plot(dateTime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_Reactive_Power")

##Copies from screen device to a PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off() 