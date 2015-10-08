# read in the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste0(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

# subset the required data
data_required <- rbind(subset(data, Date == as.Date('2007-02-01')),subset(data, Date == as.Date('2007-02-02')))

# plot as required and create the png file
par(mfrow =c(2,2), mar = c(2,4,2,2))
plot(data_required$Time, data_required$Global_active_power, 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
plot(data_required$Time, data_required$Voltage, 'l', xlab = 'datetime', ylab = 'Voltage')
plot(data_required$Time, data_required$Sub_metering_1, 'l', xlab = '', ylab = 'Energy Sub Metering')
lines(data_required$Time, data_required$Sub_metering_2, col = 'red')
lines(data_required$Time, data_required$Sub_metering_3, col = 'blue')
legend('topright',
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'),
       lty = 1, cex = 0.5)
plot(data_required$Time, data_required$Global_reactive_power, 'l', xlab = 'datetime', ylab = 'Global_reactive_power')
dev.copy(png, file="plot4.png", width = 780, height = 485)
dev.off()

