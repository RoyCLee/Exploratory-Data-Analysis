##  plot4.R

##  Roy Lee
##  08-MAR-2015
##  Exploratory Data Anaysis
##  Course Project 1

hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', as.is = TRUE, na.strings = '?')
DateTime <- as.POSIXct(strptime(paste(hpc[, "Date"], hpc[, "Time"]), "%d/%m/%Y%H:%M:%S"))
hpc2 <- cbind(hpc, DateTime)
hpc3 <- hpc2[hpc2$DateTime >= "2007-02-01" & hpc2$DateTime < "2007-02-03", ]

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))

with (hpc3, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))

with (hpc3, plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))

with (hpc3, plot(DateTime, Sub_metering_1, type = "l", col = "black", ylab = "Energy Sub Meeting", xlab = ""))
with (hpc3, lines(DateTime, Sub_metering_2, col = "red"))
with (hpc3, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with (hpc3, plot(DateTime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))

dev.off()

##  end
