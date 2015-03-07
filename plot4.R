plot4 <- function(){
  ## Read in the data set
  ## Convert date column to dates using as.Date
  ## Add the dates to the time column using paste
  ## Convert the date, time groups to times using strptime
  ## Subset the data to dates 01/02/2007 or 02/02/2007
  ## Create a 2x2 set of plots and populate them
  ## For each plot:
  ##  Create a plot with the appropriate labels
  ##  Plot the appropriate data
  ##  Add a legend
  ## Save the plots as a .png file of width 480, height 480 titled plot3.png
  
  
  fulldataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  fulldataset$Time <- paste(fulldataset$Date, fulldataset$Time, sep = " ")
  fulldataset$Date <- as.Date(fulldataset$Date,"%d/%m/%Y")
  fulldataset$Time <- strptime(fulldataset$Time,"%d/%m/%Y %H:%M:%S")
  dataset <- fulldataset[which(fulldataset$Date==as.Date("01/02/2007","%d/%m/%Y") | fulldataset$Date==as.Date("02/02/2007","%d/%m/%Y")),]
  par(mfrow = c(2,2))
  
  ## Upper Right
  plot(dataset$Time, dataset$Global_active_power, xlab = "", ylab = "Global Active Power", cex.lab = .75, cex.axis =.75, type ="n")
  lines(dataset$Time, dataset$Global_active_power)
  
  ## Upper Left
  plot(dataset$Time, dataset$Voltage, xlab = "datetime", ylab = "Voltage", cex.lab = .75, cex.axis =.75, type ="n")
  lines(dataset$Time, dataset$Voltage)
  
  ## Lower Right
  plot(dataset$Time, dataset$Sub_metering_1, xlab = "", ylab = "Energy sub metering", cex.lab = .75, cex.axis =.75, type ="n")
  lines(dataset$Time, dataset$Sub_metering_1)
  lines(dataset$Time, dataset$Sub_metering_2, col = "red")
  lines(dataset$Time, dataset$Sub_metering_3, col = "purple")
  legend("topright", lty = 1, col = c("black", "red", "purple"), bty = "n", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex = .7)
  
  ## Lower Left
  plot(dataset$Time, dataset$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", cex.lab = .75, cex.axis =.75, type ="n")
  lines(dataset$Time, dataset$Global_reactive_power)
  
  dev.copy(png, width = 480, height = 480, file = "plot4.png")
  dev.off()
}