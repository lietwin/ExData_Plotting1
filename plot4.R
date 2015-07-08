####################################
## plot4.R
## author: "Ludi Akue (Lietwin)"
## date: "July 7, 2015"
####################################

source("prepareData.R")

## Plot 4
op <- par(mfrow = c(2, 2))
## plot at row (1, 1)
with(realdf, plot(datetime, Global_active_power, type ="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
## plot at row (1, 2)
with(realdf, plot(datetime, Voltage, xlab="datetime", ylab = "Voltage", type = "l"))

## plot at row (2, 1)
with(realdf, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(realdf, lines(datetime, Sub_metering_2, col ="red"))
with(realdf, lines(datetime, Sub_metering_3, col ="blue", xlab="", ylab=""))
legend("topright", pch = "___", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##plot at row (2, 2)
with(realdf, plot(datetime, Global_reactive_power, type = "l"))

par(op) # reset graphical parameters
# export plot 4 in png
dev.copy(device = png, filename = "plot4.png", width = 480, height = 480)
dev.off()
