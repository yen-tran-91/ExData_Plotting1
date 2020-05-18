library(lubridate)
## Read data 
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
data$Date <- strptime(as.character(data$Date), "%d/%m/%Y") # set time structure
data_sub <- subset(data, Date %in% c("2007-02-02", "2007-02-01"))

## plot 1 - histogram of Global_active_power
# open png format
png(filename = "Plot1.png", width =480, height = 480)
# plot data
hist(as.numeric(as.character(data_sub$Global_active_power)), col = "red", ylim = c(0,1200), xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
# close png
dev.off()