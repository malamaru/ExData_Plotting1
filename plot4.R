# Read data from text file
plotData <- read.table("./data/household_power_consumption.txt", header=T, na.string="?", sep=";")

# Optional Check record count nrow(plotData) > 2075259

#Subset the imported data to extract only 2007-02-01 and 2007-02-02
plot4 <- plotData[( plotData$Date=="1/2/2007" | plotData$Date=="2/2/2007"),]

# Convert Date & Time variables to Date/Time classes and Join Data & Time variables
plot4$DateTime <- strptime(paste0(plot4$Date, plot4$Time), format="%d/%m/%Y %H:%M:%S")



# Set graph layout
par(mfrow=c(2, 2))


# Plot the plot4 graph
# a. Plot graphs for Global_active_power and Voltage
plot(plot4$DateTime, plot4$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(plot4$DateTime, plot4$Voltage, type="l", xlab="datetime", ylab="Voltage")

#b. plot a graph for sub_metering_1 reading
plot(plot4$DateTime, plot4$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

#b(1). plot graph for rest of sub metering reading 2 & 3 by adding lines
lines(plot4$DateTime, plot4$Sub_metering_2, col="red")
lines(plot4$DateTime, plot4$Sub_metering_3, col="blue")

#b(2). Add legend for only sub_metering graph
legend("topright", bty="n", lty=1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#d. finally plot graph for Global_reactive_Power
plot(plot4$DateTime, plot4$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_Power")

# Set the required pixesl and save graph to a file
dev.copy(png, file="plot4.png", width=480, height=480)

# Turn off PNG device
dev.off()

# File "plot4.png" is saved on your working directory