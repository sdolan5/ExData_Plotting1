##Reads data in
data <- "C:/Users/Sean/Desktop/Coursera/power/household_power_consumption.txt"
power<- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subsets data to just the two days desired
powerDates <- power[power$Date %in% c("1/2/2007","2/2/2007"),]

##Sets values for Global Active Power
globalActivePower <- as.numeric(powerDates$Global_active_power)

##Creates histogram of Global Active Power by Frequency
hist(globalActivePower, col = "red", xlab= "Global Active Power(kilowatts)", 
     main = "Global Active Power", xlim=c(0, 6), breaks = 12, ylim = c(0, 1200))

##Copies from screen device to a PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()