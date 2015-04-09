datafile <- "data.Rda"
rawFile <- "household_power_consumption.txt"
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# this function check for the data file, if is not present it download,
# clean the raw data and recreate the subset and cache the result in datafile 
loadData <- function(){
  if( !file.exists(datafile) ){
    require("lubridate")
    if( !file.exists(rawFile) ){
      download.file(url, method="curl", destfile='data.zip')
      unzip('data.zip')
    }
    rawData <- read.table(rawFile, header=TRUE, sep=';', na.strings='?',
               colClasses=c(rep('character', 2), rep('numeric', 7)))
    rawData$Date <- dmy(rawData$Date)
    rawData$Time <- hms(rawData$Time)
    
    # subset rawData
    from <- ymd('2007-02-01')
    to <- ymd('2007-02-02')
    rawData <- subset(rawData, year(Date) == 2007 & month(Date) == 2 &
                        (day(Date) == 1 | day(Date) == 2))
    
    # Just a date variable
    rawData$datetime <- rawData$Date + rawData$Time
    saveRDS(rawData,file=datafile)
    rawData
  } else {
    rawData <- readRDS(file = datafile)
  }
}

