## Christian Peikert

outcome <- read.table("household_power_consumption.txt", colClasses= "character", sep = ";", header = TRUE )
nrow(outcome)
head(outcome[,"Date"], n=15)

outcome_filter <- (as.character(outcome[,"Date"]) == as.character("1/2/2007")) | (outcome[,"Date"] == as.character("2/2/2007"))
outcome_tide <- outcome[outcome_filter,]
nrow(outcome_tide)



png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
xlim = c(0,2880) # 24h * 60min
plot(outcome_tide[,"Global_active_power"], type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n", xlim=xlim)
axis(1, at=c(0,1440,2880) ,labels=c("Thu","Fri","Sat") , col.axis="black", las=0)

plot(outcome_tide$Voltage,type="l",col="black", ylab="Voltage", xlab="datetime", xaxt="n", xlim=xlim)
axis(1, at=c(0,1440,2880) ,labels=c("Thu","Fri","Sat") , col.axis="black", las=0)

plot(outcome_tide$Sub_metering_1,type="l",col="black", ylab="Energy sub metering", xlab="", xaxt="n", xlim=xlim)
points(outcome_tide$Sub_metering_2,type="l",col="red")
points(outcome_tide$Sub_metering_3,type="l",col="blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c('black', 'red', 'blue'),bty='n')
axis(1, at=c(0,1440,2880) ,labels=c("Thu","Fri","Sat") , col.axis="black", las=0)

plot(outcome_tide$Global_reactive_power,type="l",col="black", ylab="Global_reactive_power", xlab="datetime", xaxt="n", xlim=xlim)
axis(1, at=c(0,1440,2880) ,labels=c("Thu","Fri","Sat") , col.axis="black", las=0)
dev.off()