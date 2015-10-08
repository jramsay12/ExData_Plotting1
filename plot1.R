# read in the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste0(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

# subset the required data
data_required <- rbind(subset(data, Date == as.Date('2007-02-01')),subset(data, Date == as.Date('2007-02-02')))

# plot as required and create the png file
hist(data_required$Global_active_power, col='red', main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()
