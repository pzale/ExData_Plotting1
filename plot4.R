# Read the data
housedata <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
housedata$Date <- as.Date(housedata$Date, format = "%d/%m/%Y")

# Convert Dates
datetime <- paste(as.Date(housedata$Date), housedata$Time)
housedata$Datetime <- as.POSIXct(datetime)

# Open Device
png(filename='plot4.png',width=480,height=480,units='px')

# Construct Plot
par(mfrow=c(2,2))

# Plot 1
plot(housedata$Datetime,housedata$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(housedata$Datetime,housedata$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(housedata$Datetime,housedata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(housedata$Datetime, housedata$Sub_metering_2, col = 'Red')
lines(housedata$Datetime, housedata$Sub_metering_3, col = 'Blue')
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), cex=.5)

# Plot 4
plot(housedata$Datetime,housedata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# Close Device
x<-dev.off()

