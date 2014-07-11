## Christian Peikert

outcome <- read.table("household_power_consumption.txt", colClasses= "character", sep = ";", header = TRUE )
nrow(outcome)
head(outcome[,"Date"], n=15)

outcome_filter <- (as.character(outcome[,"Date"]) == as.character("1/2/2007")) | (outcome[,"Date"] == as.character("2/2/2007"))
outcome_tide <- outcome[outcome_filter,]
##remove(outcome)
nrow(outcome_tide)
#head(outcome_tide , n=15)
outcome_tide[, "Global_active_power"] <- as.numeric(outcome_tide[,"Global_active_power"])
options(scipen=999)
png(filename = "plot1.png",width = 480, height = 480)
hist ( outcome_tide[,"Global_active_power"] , main = "Global Active Power", ylab="Frequency",
       xlab="Global Active Power (kilowatts)" ,col="red" )
dev.off()