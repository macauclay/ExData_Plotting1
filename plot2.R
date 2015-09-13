########################################################################

##  Loading Data from 2/1/2007 to 2/2/2007
filePower <- "C:/Users/Johnny/Desktop/course/1-R Programming/R/data/household_power_consumption.txt"
data <- read.table(filePower, header = TRUE,sep=";", stringsAsFactors=FALSE, dec=".")
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##  Plot2

globalActivePower <- as.numeric(data1$Global_active_power)
DateTime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png(filename = "plot2.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")
plot(DateTime, globalActivePower, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()


