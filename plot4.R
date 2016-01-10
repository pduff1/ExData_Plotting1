## plot4.R
## Exploritary Data Analysis Assignment 1 - Plot4
##
## generates plot 4 for the assignmnent 1 criteria using
## the R base plotting system
##
## Plot 4 - includes 4 Line plots arranged in a 2x2 grid
## Containg the following plots
##   1. Plot 2 output (identical to plot2.R output)
##      Line plot of Global Active Power vs Time
##   2. Plot 3 output (identical to plot3.R output)
##      Line plot of Energy Sub Metering vs Time for 
##      3 sub metering categories (3 seperate lines)
##   3. Line plot of Voltage vs Time
##   4. Line plot of Global_reactive_power vs Time
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
## Output - The script creates a png file plot "plot4.png" 
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

## Create a vector of numeric Global active power values
global_active_power <- as.numeric(a1data2$Global_active_power)

## Create a vector of numeric Global reactive power values
global_reactive_power <- as.numeric(a1data2$Global_reactive_power)

## Create a vector of numeric Voltage values
voltage <- as.numeric(a1data2$Voltage)

## Set graphics device to ouput to a png file ("plot4.png")
png(file="plot4.png", width= 480, height=480)

#set frame for 4 plots using mfcol
par(mfcol = c(2,2))

#set margin sizes
par(mar = c(4,4,2,2))

## Plot 1 of 4
plot(a1datetime,                                    # datetime data values
           global_active_power,                     # Global_active_power values
           type="l",                                # set graph type to line
           xlab="",                                 # remove label on x-axis
           ylab="Global Active Power (kilowatts)")  # set y axis label

## Plot 2 of 4
plot(a1datetime,                                    #date time values
           as.numeric(a1data2$Sub_metering_1),      #numeric Sub_metering_1 values
           type="l",                                #set graph type as line 
           xlab="",                                 #set x axis label
           ylab="Energy sub metering")              #set y axis label

## Add Sub_metering_2 line to the plot using lines()
lines(a1datetime,                                   #date time values
           as.numeric(a1data2$Sub_metering_2),      #numeric Sub_metering_2 data 
           col="red")                               #set line colour to red

## Add Sub_metering_3 line to the plot using lines()
lines(a1datetime,                                   #date time values
           as.numeric(a1data2$Sub_metering_3),      #numeric Sub_metering_3 data
           col="blue")                              #set line colour to blue

## Add legend to the top right hand side of the plot
legend("topright",                                                           #set position for legend 
           lty=1,                                                            #set legend symbol as a solid line
           col=c("black", "red", "blue"),                                    #set colours for legend sybmols and text
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) # set legend label text

## Plot 3 of 4
plot(a1datetime,                                    #date time values
          voltage,                                  #Voltage values
          type="l",                                 #set graph type to line
          xlab="datetime",                          #set x axis label
          ylab="Voltage")                           #set y axis label

## Plot 4 of 4
plot(a1datetime,                                    #date time values
          global_reactive_power,                    #Global_reactive_power values
          type="l",                                 # set graph type to line
          xlab="datetime",                          # set x axis label
          ylab="Global_reactive_power")             # set y axis label

## Close graphics device
dev.off()

