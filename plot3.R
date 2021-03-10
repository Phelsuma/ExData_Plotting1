###Plot 3###
# code for creating plot3.png #
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
hpc1c <- subset(hpc,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

# convert date & time into datetime #
hpc2c <- mutate(hpc1c, datetime = ymd_hms(paste(Date, Time)))

# subset plot 3 sub_metering #
hpc3c <- hpc2c %>% select(Sub_metering_1, Sub_metering_2, Sub_metering_3, datetime)

# make plot 3 #
plot3 <- plot(Sub_metering_1~datetime, hpc3c, ylab = "Energy sub metering", type = "l", xlab = '')
          lines(Sub_metering_2~datetime, hpc3c, type = "l", col = "red")
          lines(Sub_metering_3~datetime, hpc3c, type = "l", col = "blue")
          legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
          
# write PNG file of plot 3, 480 X 480 pixels #
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()



