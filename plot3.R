##Reads data in
data <- "C:/Users/Sean/Desktop/Coursera/power/household_power_consumption.txt"
power<- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subsets data to just the two days desired
powerFeb <- power[power$Date %in% c("1/2/2007","2/2/2007"),]

##Values for energy sub metering
sm1 <- powerFeb$Sub_metering_1
sm2 <- powerFeb$Sub_metering_2
sm3 <- powerFeb$Sub_metering_3

##Converts date and time to usable format and then pastes them together
dateTime <- strptime(paste(powerFeb$Date, powerFeb$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Plots Energy Sub Metering by Day of Week
plot(dateTime, sm1, type = "l", xlab = " ", ylab = "Energy Sub Metering")
lines(dateTime, sm2, type = "l", col = "red", xlab = " ", ylab = "Energy Sub Metering")
lines(dateTime, sm3, type = "l", col = "blue", xlab = " ", ylab = "Energy Sub Metering")
##Adds legend to upper right hand corner of plot
legend("topright", lwd = c(1,1,1), lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Copies from screen device to a PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
