##  Loading Data from 2/1/2007 to 2/2/2007
filePower <- "C:/Users/Johnny/Desktop/course/1-R Programming/R/data/household_power_consumption.txt"
data <- read.table(filePower, header = TRUE,sep=";", stringsAsFactors=FALSE, dec=".")
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##  Plot4

#str(subSetData)

DateTime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data1$Global_active_power)
globalReactivePower <- as.numeric(data1$Global_reactive_power)
voltage <- as.numeric(data1$Voltage)
Sub_metering_1  <- as.numeric(data1$Sub_metering_1)
Sub_metering_2 <- as.numeric(data1$Sub_metering_2)
Sub_metering_3  <- as.numeric(data1$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(DateTime, globalActivePower, 
     type="l", xlab="", ylab="Global Active Power")

plot(DateTime, voltage, type="l", 
     xlab="DateTime", ylab="Voltage")

plot(DateTime, Sub_metering_1, type="l", 
     xlab="", ylab="Energy Submetering")

lines(DateTime, Sub_metering_2, 
      type="l", 
      col="red")

lines(DateTime, 
      Sub_metering_3, 
      type="l", 
      col="blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, 
       col=c("black", "red", "blue"), 
       bty="o")

plot(DateTime, globalReactivePower, type="l", 
     xlab="DateTime", ylab="Global_reactive_power")

dev.off()

