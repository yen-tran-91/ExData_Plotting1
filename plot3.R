library(lubridate)
## Read data 
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
data$Date <- strptime(as.character(data$Date), "%d/%m/%Y") # set time structure
data_sub <- subset(data, Date %in% c("2007-02-02", "2007-02-01"))

## plot 3
png(filename = "Plot3.png", width =480, height = 480)

plot(as.numeric(as.character(data_sub$Sub_metering_1)), type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering")
# lines() and point() function will add value to current plot
lines(as.numeric(as.character(data_sub$Sub_metering_2)), col = "red")
lines(as.numeric(as.character(data_sub$Sub_metering_3)), col = "blue")
legend(1900,40,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1) # btn remove the border 
x <- seq(0,2880, by = 1440)
axis(side = 1, at= x, tick = TRUE, labels = FALSE)
text(x=x,par("usr")[3],labels =c("Thu", "Fri", "Sat"), srt = 0, pos = 1, xpd = TRUE)

dev.off()