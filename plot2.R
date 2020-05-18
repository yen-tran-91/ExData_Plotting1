library(lubridate)
## Read data 
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
data$Date <- strptime(as.character(data$Date), "%d/%m/%Y") # set time structure
data_sub <- subset(data, Date %in% c("2007-02-02", "2007-02-01"))

## plot 2
# convert date and time to date/time 
data_sub[["Datetime"]] <- paste(data_sub$Date, data_sub$Time)
data_sub$Datetime <- wday(data_sub$Datetime, label = TRUE)
#
png(filename = "Plot2.png", width =480, height = 480)

plot(as.numeric(as.character(data_sub$Global_active_power)), xaxt ="n", type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
x <- seq(0,2880, by = 1440)
axis(side = 1, at= x, tick = TRUE, labels = FALSE)
text(x=x,par("usr")[3],labels =c("Thu", "Fri", "Sat"), srt = 0, pos = 1, xpd = TRUE)

dev.off()