#read the data
pwr<-read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")
#subset as per dates
dts<- c("1/2/2007", "2/2/2007")
pwr<-pwr[pwr$Date %in% dts ,]
#converting Global_active_power
pwr$Global_active_power<-as.numeric(pwr$Global_active_power)
#obtaining time
datetime <- strptime(paste(pwr$Date, pwr$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#save in png
png("plot2.png", width=480, height=480)
#line plot
plot(datetime, pwr$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()