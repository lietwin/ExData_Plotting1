####################################
## plot3.R
## author: "Ludi Akue (Lietwin)"
## date: "July 7, 2015"
####################################

source("prepareData.R")
## Build and show the plot
with(realdf, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(realdf, lines(datetime, Sub_metering_2, col ="red"))
with(realdf, lines(datetime, Sub_metering_3, col ="blue", xlab="", ylab=""))
legend("topright", pch = "___", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# export plot 3 in png
dev.copy(device = png, filename = "plot3.png", width = 480, height = 480)
dev.off()