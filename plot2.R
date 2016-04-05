#path <- getwd()
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
data7 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(data7$Date, data7$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Global_active_power <- as.numeric(data7$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()