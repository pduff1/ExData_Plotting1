## plot3.R
## Exploritary Data Analysis Assignment 1 - Plot3
##
## generates plot 3 for the assignmnent 1 criteria using
## the R base plotting system
## Plot 3 - Line plot of Energy Sub Metering vs Time
## for the following 3 sub metering categories:
##   1. kitchen
##   2. laundary room
##   3. electric water heater and air conditioner
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
## Output - The script creates a png file plot "plot3.png" 
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

## Create a vector of datatime data based on the Date and Time columns
## in a1data2 using as.Date() and strptime()
a1datetime <- strptime(paste(a1data2$Date, a1data2$Time), "%d/%m/%Y %H:%M:%S")

## Set graphics device to ouput to a png file ("plot3.png")
png(file="plot3.png", width= 480, height=480)

plot(a1datetime,                           #date time values
     as.numeric(a1data2$Sub_metering_1),   #numeric Sub_metering_1 values
     type="l",                             #set graph type as line 
     xlab="",                              #set x axis label
     ylab="Energy sub metering")           #set y axis label

## Add Sub_metering_2 line to the plot using lines()
lines(a1datetime,                          #date time values
       as.numeric(a1data2$Sub_metering_2), #numeric Sub_metering_2 data 
       col="red")                          #set line colour to red

## Add Sub_metering_3 line to the plot using lines()
lines(a1datetime,                          #date time values
       as.numeric(a1data2$Sub_metering_3), #numeric Sub_metering_3 data
       col="blue")                         #set line colour to blue

## Add legend to the top right hand side of the plot
legend("topright",                                                            #set position for legend 
            lty=1,                                                            #set legend symbol as a solid line
            col=c("black", "red", "blue"),                                    #set colours for legend sybmols and text
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) # set legend label text

## Close graphics device
dev.off()