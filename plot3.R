## Loading the complete data from the dataset
datacomplete <- read.table("household_power_consumption.txt", 
                           header = TRUE, 
                           sep=";", na.strings="?", 
                           stringsAsFactors=F, comment.char="", quote='\"')
datacomplete$Date <- as.Date(datacomplete$Date, format="%d/%m/%Y")

##Subsetting the data to pick only the data between '01/02/2007' to '02/02/2017'
datasub <- subset(datacomplete, 
                  subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Clearing the complete dataset to free the memory
rm(datacomplete)

##Converting Dates
datetime <- paste(as.Date(datasub$Date), datasub$Time)
datasub$DateTime <- as.POSIXct(datetime)

##Plotting plot3

with(datasub, plot(datasub$Sub_metering_1~DateTime, type="l",  
                   ylab = "Enrgy sub metering", xlab=""))
points(datasub$Sub_metering_2~datasub$DateTime, type="l", col="red")
points(datasub$Sub_metering_3~datasub$DateTime, type="l", col="blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2, cex=0.6,y.intersp = 0.6,
       col = c("black", "red", "blue"))

## Copy the plot to png device to save it as png file.
dev.copy(png, file="plot3.png", height=480, width=480)
## Closing the png device
dev.off()