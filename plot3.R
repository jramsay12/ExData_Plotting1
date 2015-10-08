# read in the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste0(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

# subset the required data
data_required <- rbind(subset(data, Date == as.Date('2007-02-01')),subset(data, Date == as.Date('2007-02-02')))

# plot as required and create the png file
plot(data_required$Time, data_required$Sub_metering_1, 'l', xlab = '', ylab = 'Energy Sub Metering')
lines(data_required$Time, data_required$Sub_metering_2, col = 'red')
lines(data_required$Time, data_required$Sub_metering_3, col = 'blue')
legend('topright',
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'),
       lty = 1,
       cex = 0.5, y.intersp = 0.5)
dev.copy(png, file="plot3.png")
dev.off()
