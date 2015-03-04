# Read data from text file
plotData <- read.table("./data/household_power_consumption.txt", header=T, na.string="?", sep=";")

# Optional Check record count nrow(plotData) > 2075259

#Subset the imported data to extract only 2007-02-01 and 2007-02-02
plot1 <- plotData[( plotData$Date=="1/2/2007" | plotData$Date=="2/2/2007"),]

# Convert Date & Time variables to Date/Time classes and Join Data & Time variables
plot1$DateTime <- strptime(paste0(plot1$Date, plot1$Time), format="%d/%m/%Y %H:%M:%S")

# Plot the graph
hist(plot1$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

# Set the required pixesl and save graph to a file
dev.copy(png, file="plot1.png", width=480, height=480)

# Turn off PNG device
dev.off()

# A "plot1.png" is saved on your working directory