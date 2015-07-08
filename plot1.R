####################################
## plot1.R
## author: "Ludi Akue (Lietwin)"
## date: "July 7, 2015"
####################################

source("prepareData.R")

## Build and show the plot
with(realdf, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))

## Export Plot 1 in .png
dev.copy(device = png, filename = "plot1.png", width = 480, height = 480)
dev.off()