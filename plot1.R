#read the data
pwr<-read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")
#subset as per dates
dts<- c("1/2/2007", "2/2/2007")
pwr<-pwr[pwr$Date %in% dts ,]
#converting Global_active_power
pwr$Global_active_power<-as.numeric(pwr$Global_active_power)
#save in png
png("plot1.png", width=480, height=480)
#plotting the histogram
hist(pwr$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()