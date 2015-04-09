# Load data
source('loader.R')
data <- loadData()

# Set png device
png(filename='plot1.png')

# plot
hist(data$Global_active_power, main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', col='red')

# Turn off device
dev.off()