## plot1.R
## Exploritary Data Analysis Assignment 1 - Plot1
##
## generates plot 1 for the assignmnent 1 criteria using
## the R base plotting system
## Plot 1 - Histogram of Global Active Power vs frequency
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
## Output - The script creates a png file plot "plot1.png" 
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

## Set graphics device to ouput to a png file ("plot1.png")
png(file="plot1.png", width= 480, height=480)

## Create histogram of Global_active_power values using hist()
hist(global_active_power,                      # Global_active_power values
       xlab="Global Active Power (kilowatts)", # set x axis label 
       col="red",                              # set colour to red
       main="Global Active Power")             # set graph title

## Close graphics device
dev.off()
