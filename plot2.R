# Load data
source('loader.R')
data <- loadData()

# Set png device
png(filename='plot2.png')

# plot
plot(data$datetime, data$Global_active_power,
     ylab='Global Active Power (kilowatts)', xlab='', type='l')

# Turn off device
dev.off()