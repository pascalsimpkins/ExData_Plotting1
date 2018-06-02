## This is Pascal Simpkins' Submission for the John Hopkins Exploratory Data Analysis Course Project Week 1

### REQUIREMENTS ###
## 1. Date in format dd/mm/yyy
## 2. Time: time in format hh:mm:ss
## 3. Global_active_power: household global minute-averaged active power (in kilowatt)
## 4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
## 5. Voltage: minute-averaged voltage (in volt)
## 6. Global_intensity: household global minute-averaged current intensity (in ampere)
## 7. Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
## 8. Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
## 9. Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

if(!file.exists("exdata-data-household_power_consumption.zip")) {
      temp <- tempfile()
      download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
      file <- unzip(temp)
      unlink(temp)
}
power <- read.table(file, header=T, sep=";")

## 1. Date in format dd/mm/yyy
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

## 2. Time: time in format hh:mm:ss
time

# Sets the dataframe
df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]

## 3. Global_active_power: household global minute-averaged active power (in kilowatt)
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

## 4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))

## 5. Voltage: minute-averaged voltage (in volt)
df$Voltage <- as.numeric(as.character(df$Voltage))

## 6. Global_intensity: household global minute-averaged current intensity (in ampere)
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

## 7. Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))

## 8. Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))

## 9. Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

### PLOT 1 ###
plot1 <- function() {
      hist(df$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
      dev.copy(png, file="plot1.png", width=480, height=480)
      dev.off()
      cat("Plot1.png has been saved in", getwd())
}
plot1()
# Plot saved in ".../Johns Hopkins Files/Exploratory Data Analysis/Week 1 Assignment"
