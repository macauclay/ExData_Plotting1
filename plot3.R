##  Loading Data from 2/1/2007 to 2/2/2007
filePower <- "C:/Users/Johnny/Desktop/course/1-R Programming/R/data/household_power_consumption.txt"
data <- read.table(filePower, header = TRUE,sep=";", stringsAsFactors=FALSE, dec=".")
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##  Plot3

globalActivePower <- as.numeric(data1$Global_active_power)
DateTime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Sub_metering_1 <- as.numeric(data1$Sub_metering_1)
Sub_metering_2 <- as.numeric(data1$Sub_metering_2)
Sub_metering_3 <- as.numeric(data1$Sub_metering_3)

png(filename = "plot3.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
plot(DateTime, Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()

