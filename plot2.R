###Plot 2###
# code for creating plot2.png #
library(tidyverse)
library(lubridate)

url   <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
path  <- "data/household_power_consumption.zip"
unzip <- "data/household_power_consumption.txt"

# read Electric power consumption data into R #
hpc <- read.delim("~/Desktop/ExData_Plotting1/household_power_consumption.txt", sep=";")

# convert date #
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

# subset for days of interest (2007-02-01) - (2007-02-02) #
hpc1b <- subset(hpc,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

# convert date & time into datetime #
hpc2b <- mutate(hpc1b, datetime = ymd_hms(paste(Date, Time)))

          
# create plot of global active power (kw) #
plot2 <- plot(Global_active_power~datetime, hpc2b,
                         type="l",
                         ylab="Global Active Power (kilowatts)",
                         xlab="",
                    bg="white" 
                         )

# write PNG file of plot 2, 480 X 480 pixels #
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()



