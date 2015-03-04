# Read data from text file
plotData <- read.table("./data/household_power_consumption.txt", header=T, na.string="?", sep=";")

# Optional Check record count nrow(plotData) > 2075259

#Subset the imported data to extract only 2007-02-01 and 2007-02-02
plot2 <- plotData[( plotData$Date=="1/2/2007" | plotData$Date=="2/2/2007"),]

# Convert Date & Time variables to Date/Time classes and Join Data & Time variables
plot2$DateTime <- strptime(paste0(plot2$Date, plot2$Time), format="%d/%m/%Y %H:%M:%S")


# Plot the plot2 graph
plot(plot2$DateTime, plot2$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")


# Set the required pixesl and save graph to a file
dev.copy(png, file="plot2.png", width=480, height=480)

# Turn off PNG device
dev.off()

# File "plot2.png" is saved on your working directory