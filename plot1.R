## electric power consumption zip file (20 MB)
fileURLZip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURLZip, destfile= "temp.zip", method = "curl")
unzip("temp.zip")
## household_power_consumption.txt 133 MB it is a fixed 
## DT <- fread("household_power_consumption.txt", header=TRUE)
household <- read.table(file="household_power_consumption.txt",header=T,sep=";", na.strings = "?")
smallDF <- subset(household, Date=="1/2/2007"| Date =="2/2/2007") ## 2880 obs

##plot 1 PNG 480 by 480 pixels
png(filename = "plot1.png", width =480, height =480 )
par(mfrow = c(1,1))
hist(smallDF$Global_active_power, col ="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()