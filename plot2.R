# Read the data
housedata <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
housedata$Date <- as.Date(housedata$Date, format = "%d/%m/%Y")

# Convert Dates
datetime <- paste(as.Date(housedata$Date), housedata$Time)
housedata$Datetime <- as.POSIXct(datetime)

# Open Device
png(filename='plot2.png',width=480,height=480,units='px')

# Contruct Plot
plot(housedata$Global_active_power ~ housedata$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Close Device
x<-dev.off()