####################################
## prepareData.R
## author: "Ludi Akue (Lietwin)"
## date: "July 7, 2015"
####################################

library(lubridate)

## Init process
message("clean environment")
rm(list = ls())
setwd(getwd())

prepare_data <- function(link){
        download.file(link, "temp.zip", method  = "curl")
        dldate <- date()
        print(paste("Data set is downloaded on:", dldate))
        writeLines(dldate, "downloadedat.txt")
        df <- read.csv(unz(description="temp.zip", filename = "household_power_consumption.txt"), sep = ";", na.strings = "?")
        print("===> Data set is sucessfully loaded with :")
        print(paste("===> Number of observations:", nrow(df)))
        print(paste("===> Number of variables:", ncol(df)))
        file.remove("temp.zip")
        ## formatting the date
        df$Date <- dmy(df$Date)
        ## formating the time
        df$Time <- hms(df$Time)
  
        ## Subsetting to get the data we really needed
        
        ## subsetting range (2007-02-01 - 2007-02-02)
        realdf <- subset(df, Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"))
        
        ## engineer a new feature for date time. Will be used for plotting
        realdf$datetime<- ymd_hms(paste(realdf$Date, realdf$Time))
        return(realdf)
        
}

realdf <- prepare_data("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")


