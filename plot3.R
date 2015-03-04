# Read data from text file
plotData <- read.table("./data/household_power_consumption.txt", header=T, na.string="?", sep=";")

# Optional Check record count nrow(plotData) > 2075259

#Subset the imported data to extract only 2007-02-01 and 2007-02-02
plot3 <- plotData[( plotData$Date=="1/2/2007" | plotData$Date=="2/2/2007"),]

# Convert Date & Time variables to Date/Time classes and Join Data & Time variables
plot3$DateTime <- strptime(paste0(plot3$Date, plot3$Time), format="%d/%m/%Y %H:%M:%S")


# Set the required pixesl and save graph to a file
dev.copy(png, file="plot3.png", width=480, height=480)

# Plot the plot3 graph
plot(plot3$DateTime, plot3$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")

# Add all sub_meter2 & 3 to above graph
lines(plot3$DateTime, plot3$Sub_metering_2, col="red")
lines(plot3$DateTime, plot3$Sub_metering_3, col="blue")

# Add legend to the graph
legend("topright", col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)


# Turn off PNG device
dev.off()

# A "plot3.png" is saved on your working directory