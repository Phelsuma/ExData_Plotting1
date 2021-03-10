###Plot 4###
# code for creating plot4.png #
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
hpc1d <- subset(hpc,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

# convert date & time into datetime #
hpc2d <- mutate(hpc1d, datetime = ymd_hms(paste(Date, Time)))


## prep for plot 4 ##
# subset plot 6 datetime~grp#
hpc3d <- hpc2d %>% select(Global_reactive_power, datetime)
#subset plot 5 datetime~voltage#
hpc4d <- hpc2d %>% select(Voltage, datetime)
# subset plot 3 sub_metering #
hpc3c <- hpc2d %>% select(Sub_metering_1, Sub_metering_2, Sub_metering_3, datetime)


# plot plot2, plot3, plot5, plot6 into single frame #
par(mfcol = c(2,2))

# create plot2 of global active power (kw) #
plot2 <- plot(Global_active_power~datetime, hpc2d,
              type="l",
              ylab="Global Active Power (kilowatts)",
              xlab=""
)   

# make plot 3 of sub metering #
plot3 <- plot(Sub_metering_1~datetime, hpc3c, ylab = "Energy sub metering", type = "l", xlab = '')
lines(Sub_metering_2~datetime, hpc3c, type = "l", col = "red")
lines(Sub_metering_3~datetime, hpc3c, type = "l", col = "blue")
legend("topright", inset = 0.1, bg="transparent", cex = 0.9, bty = "n", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), )

# make "plot6" datetime~grp & "plot 5" datetime~voltage #

plot5 <- plot(hpc4d$datetime, hpc4d$Voltage,
              type = "l", xlab = "datetime", ylab = "Voltage")

plot6 <- plot(hpc3d$datetime, hpc3d$Global_reactive_power, 
              type = "l", xlab = "datetime", ylab = "Global reactive power")

# write PNG file of plot 4, 480 X 480 pixels #
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()



