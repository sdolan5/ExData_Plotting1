## Reads data in
data <- "C:/Users/Sean/Desktop/Coursera/power/household_power_consumption.txt"
power<- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subsets data to just the two days desired
powerFeb <- power[power$Date %in% c("1/2/2007","2/2/2007"),]

##Sets values for Global Active Power
globalActivePower <- as.numeric(powerFeb$Global_active_power)

##Converts date and time to usable format and then pastes them together
dateTime <- strptime(paste(powerFeb$Date, powerFeb$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Creates plot of Global Active Power by Day of Week
plot(dateTime, globalActivePower, type = "l", xlab = " ", ylab = "Global Active Power(kilowatts)")

##Copies from screen device to a PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()