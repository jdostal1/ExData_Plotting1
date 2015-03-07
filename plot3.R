plot3 <- function(){
  ## Read in the data set
  ## Convert date column to dates using as.Date
  ## Add the dates to the time column using paste
  ## Convert the date, time groups to times using strptime
  ## Subset the data to dates 01/02/2007 or 02/02/2007
  ## Create a plot with the appropriate labels
  ## Plot sub metering readings vs. the time
  ## Add a legend
  ## Save the plot as a .png file of width 480, height 480 titled plot3.png
  
  
  fulldataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  fulldataset$Time <- paste(fulldataset$Date, fulldataset$Time, sep = " ")
  fulldataset$Date <- as.Date(fulldataset$Date,"%d/%m/%Y")
  fulldataset$Time <- strptime(fulldataset$Time,"%d/%m/%Y %H:%M:%S")
  dataset <- fulldataset[which(fulldataset$Date==as.Date("01/02/2007","%d/%m/%Y") | fulldataset$Date==as.Date("02/02/2007","%d/%m/%Y")),]
  plot(dataset$Time, dataset$Sub_metering_1, xlab = "", ylab = "Energy sub metering", cex.lab = .75, cex.axis =.75, type ="n")
  lines(dataset$Time, dataset$Sub_metering_1)
  lines(dataset$Time, dataset$Sub_metering_2, col = "red")
  lines(dataset$Time, dataset$Sub_metering_3, col = "purple")
  legend("topright", lty = 1, col = c("black", "red", "purple"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex = .7)
  dev.copy(png, width = 480, height = 480, file = "plot3.png")
  dev.off()
}