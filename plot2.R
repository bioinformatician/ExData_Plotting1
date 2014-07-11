## Christian Peikert

outcome <- read.table("household_power_consumption.txt", colClasses= "character", sep = ";", header = TRUE )
nrow(outcome)
head(outcome[,"Date"], n=15)

outcome_filter <- (as.character(outcome[,"Date"]) == as.character("1/2/2007")) | (outcome[,"Date"] == as.character("2/2/2007"))
outcome_tide <- outcome[outcome_filter,]
nrow(outcome_tide)
xlim = c(0,2880) # 24h * 60min

png(filename = "plot2.png",width = 480, height = 480)
plot(outcome_tide[,"Global_active_power"], type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n", xlim=xlim)
axis(1, at=c(0,1440,2880) ,labels=c("Thu","Fri","Sat") , col.axis="black", las=0)
dev.off()