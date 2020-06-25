## electric power consumption zip file (20 MB)
fileURLZip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURLZip, destfile= "temp.zip", method = "curl")
unzip("temp.zip")
## household_power_consumption.txt 133 MB it is a fixed 
## DT <- fread("household_power_consumption.txt", header=TRUE)
household <- read.table(file="household_power_consumption.txt",header=T,sep=";", na.strings = "?")
smallDF <- subset(household, Date=="1/2/2007"| Date =="2/2/2007") ## 2880 obs
## plot 3
smallDF$Date<- format(as.Date(smallDF$Date, format="%d/%m/%Y"),"%Y/%m/%d") #character output, format needed?
smallDF$Time <- format(strptime(smallDF$Time, format="%H:%M:%S"),"%H:%M:%S") #character output
smallDF$datetime <- paste(smallDF$Date, smallDF$Time) #concatenate characters
smallDF$datetime <- as.POSIXct(smallDF$datetime) # can handle character in format ymd hms
png(filename = "plot3.png", width =480, height =480 )
par(mfrow = c(1,1))
with (smallDF, { 
  plot (datetime , Sub_metering_1, type= "l", xlab= "", ylab = "Energy sub metering",
        ylim = c(0,max(Sub_metering_1,Sub_metering_2,Sub_metering_3)))
  lines(datetime, Sub_metering_2, type = "l", col = "red")
  lines(datetime, Sub_metering_3, type = "l", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty=1, lwd=2.5, col=c("black", "red", "blue"))
})
dev.off()