## plot2.R
## Exploritary Data Analysis Assignment 1 - Plot2
##
## generates plot 2 for the assignmnent 1 criteria using
## the R base plotting system
## Plot 2 - Line plot of Global Active Power vs Time
## 
## See readme file for assignment description and
## data description of variables for the Electric
## Power Consumption data being used (taken from
## the UCI web site).
##
## Input - The script expects the input file:
## "household_power_consumption.txt" to be in
## the R working directory.
##
## Output - The script creates a png file plot "plot2.png" 
## in the R working directory
##################################################

## read source data into a data frame
# seperate file on the ";" character
# read values as strings rather than factors to make subsequent 
# processing steps easier.
# set missing value character to "?"
# set header=TRUE to pick up first data row as headings
a1data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";",
 stringsAsFactors=FALSE, na.strings="?")

## Reduce data set to the required dates only (2007-02-01 and 2007-02-02)
#  as specified in the assignment description
a1data2 <- a1data[a1data$Date == "1/2/2007" | a1data$Date == "2/2/2007",]

## Create a vector of numeric Global active power values
global_active_power <- as.numeric(a1data2$Global_active_power)

## Create a vector of datatime data based on the Date and Time columns
## in a1data2 using as.Date() and strptime()
a1datetime <- strptime(paste(a1data2$Date, a1data2$Time), "%d/%m/%Y %H:%M:%S")

## Set graphics device to ouput to a png file ("plot2.png")
png(file="plot2.png", width= 480, height=480)

## Create Plot using plot()
           plot(a1datetime,                         #datetime data values
           global_active_power,                     # Global_active_power values
           type="l",                                # set graph type to line
           xlab="",                                 # remove label on x-axis
           ylab="Global Active Power (kilowatts)")  # set y axis label

## Close graphics device
dev.off()
