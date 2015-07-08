####################################
## plot2.R
## author: "Ludi Akue (Lietwin)"
## date: "July 7, 2015"
####################################

source("prepareData.R")

## Build and show the plot
with(realdf, plot(datetime, Global_active_power, type ="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

## export Plot 2 in png
dev.copy(device = png, filename = "plot2.png", width = 480, height = 480)
dev.off()