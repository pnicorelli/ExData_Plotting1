# Load data
source('loader.R')
data <- loadData()

# Set device
png(filename='plot4.png')

## plots
par(mfrow=c(2,2))

# First
plot(data$datetime, data$Global_active_power, ylab='Global Active Power', xlab='', type='l')

# Second
plot(data$datetime, data$Voltage, xlab='datetime', ylab='Voltage', type='l')

# Third
plot(data$datetime, data$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(data$datetime, data$Sub_metering_2, col='red')
lines(data$datetime, data$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid', bty='n')

# Fourth
plot(data$datetime, data$Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', type='l')

# Turn off device
dev.off()