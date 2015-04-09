# Load data
source('loader.R')
data <- loadData()

# Set png device
png(filename='plot3.png')

# plot
plot(data$datetime, data$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')
lines(data$datetime, data$Sub_metering_2, col='red')
lines(data$datetime, data$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid')

# Turn off device
dev.off()