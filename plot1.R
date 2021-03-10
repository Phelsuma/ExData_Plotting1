###Plot 1###
# code for creating plot1.png #
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
hpc1a <- subset(hpc,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

# create hist of global active power (kw) #
plot1 <- hist(as.numeric(hpc1a$Global_active_power), 
              main = "Global Active Power", # main title #
              xlab = "Global Active Power (kilowatts)", # label x axis #
              col = "red", # color = red #
              breaks = 11 # adjust bars #
              )

# write PNG file of plot 1, 480 X 480 pixels #
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()



