#read the data
pwr<-read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")
#subset as per dates
dts<- c("1/2/2007", "2/2/2007")
pwr<-pwr[pwr$Date %in% dts ,]
#converting Global_active_power
pwr$Global_active_power<-as.numeric(pwr$Global_active_power)
pwr$Sub_metering_1<-as.numeric(pwr$Sub_metering_1)
pwr$Sub_metering_2<-as.numeric(pwr$Sub_metering_2)
pwr$Sub_metering_3<-as.numeric(pwr$Sub_metering_3)
#obtaining time
datetime <- strptime(paste(pwr$Date, pwr$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#save in png
png("plot3.png", width=480, height=480)
#line plot
plot(datetime, pwr$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")
lines(datetime, pwr$Sub_metering_2, type="l", col="red")
lines(datetime, pwr$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()