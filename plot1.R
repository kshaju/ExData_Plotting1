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

## Plotting plot1
hist(datasub$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     main = "Global Active Power", 
     col = "red")

## Copy the plot to png device to save it as png file.
dev.copy(png, file="plot1.png", height=480, width=480)
## Closing the png device
dev.off()