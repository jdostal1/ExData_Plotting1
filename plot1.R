plot1 <- function(){
  ## Read in the data set
  ## Convert date column to dates using as.Date
  ## Subset the data to dates 01/02/2007 or 02/02/2007
  ## Chart the data in a histogram with red bins and appropriate labels
  ## Save the plot as a .png file of width 480, height 480 titled plot1.png
  
  fulldataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  fulldataset$Date <- as.Date(fulldataset$Date,"%d/%m/%Y")
  dataset <- fulldataset[which(fulldataset$Date==as.Date("01/02/2007","%d/%m/%Y") | fulldataset$Date==as.Date("02/02/2007","%d/%m/%Y")),]
  hist(dataset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", cex.lab = .75, cex.axis =.75)
  dev.copy(png, width = 480, height = 480, file = "plot1.png")
  dev.off()
}