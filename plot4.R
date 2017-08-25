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

## Plotting plot4
par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))

with(datasub, plot(Global_active_power~DateTime, type="l",  
                   ylab = "Global Active Power", xlab=""))

with(datasub, plot(Voltage~DateTime, type="l",  
                   ylab = "Voltage", xlab="datetime"))
with(datasub, plot(datasub$Sub_metering_1~DateTime, type="l",  
                   ylab = "Enrgy sub metering", xlab=""))
lines(datasub$Sub_metering_2~datasub$DateTime, col="red")
lines(datasub$Sub_metering_3~datasub$DateTime, col="blue")
legend('topright', col=c("black", "red", "blue"), lty=1, lwd=2, cex = 0.5, y.intersp = 0.3,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n")
with(datasub, plot(Global_reactive_power~DateTime, type="l",  
                   ylab = "Global_reactive_power", xlab="datetime"))

## Copy the plot to png device to save it as png file.
dev.copy(png, file="plot4.png", height=480, width=480)
## Closing the png device
dev.off()