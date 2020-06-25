## electric power consumption zip file (20 MB)
fileURLZip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURLZip, destfile= "temp.zip", method = "curl")
unzip("temp.zip")
## household_power_consumption.txt 133 MB it is a fixed 
## DT <- fread("household_power_consumption.txt", header=TRUE)
household <- read.table(file="household_power_consumption.txt",header=T,sep=";", na.strings = "?")
smallDF <- subset(household, Date=="1/2/2007"| Date =="2/2/2007") ## 2880 obs
## plot 2
smallDF$Date<- format(as.Date(smallDF$Date, format="%d/%m/%Y"),"%Y/%m/%d") #character output, format needed?
smallDF$Time <- format(strptime(smallDF$Time, format="%H:%M:%S"),"%H:%M:%S") #character output
smallDF$datetime <- paste(smallDF$Date, smallDF$Time) #concatenate characters
smallDF$datetime <- as.POSIXct(smallDF$datetime) # can handle character in format ymd hms
png(filename = "plot2.png", width =480, height =480 )
par(mfrow = c(1,1))
with(smallDF, plot(datetime, Global_active_power, type= "l", xlab= "", ylab = "Global Active Power (kilowatts)"))
dev.off()