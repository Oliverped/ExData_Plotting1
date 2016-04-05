#path <- getwd()
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
data7 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(data7$Date, data7$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Global_active_power <- as.numeric(data7$Global_active_power)
Global_reactive_power <- as.numeric(data7$Global_reactive_power)
Voltage <- as.numeric(data7$Voltage)
Sub_metering_1 <- as.numeric(data7$Sub_metering_1)
Sub_metering_2 <- as.numeric(data7$Sub_metering_2)
Sub_metering_3 <- as.numeric(data7$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()