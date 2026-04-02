data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data_sub <- subset(data, Date == as.Date("2007-02-01") |
                     Date == as.Date("2007-02-02"))

data_sub$Datetime <- strptime(paste(data_sub$Date, data_sub$Time),
                              format = "%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(data_sub$Datetime,
     data_sub$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")

lines(data_sub$Datetime, data_sub$Sub_metering_2, col = "red")
lines(data_sub$Datetime, data_sub$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()