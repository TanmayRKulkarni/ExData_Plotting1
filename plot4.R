data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data_sub <- subset(data, Date == as.Date("2007-02-01") |
                     Date == as.Date("2007-02-02"))

data_sub$Datetime <- strptime(paste(data_sub$Date, data_sub$Time),
                              format = "%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(data_sub$Datetime,
     data_sub$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# 🔹 Plot 2
plot(data_sub$Datetime,
     data_sub$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# 🔹 Plot 3
plot(data_sub$Datetime,
     data_sub$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(data_sub$Datetime, data_sub$Sub_metering_2, col = "red")
lines(data_sub$Datetime, data_sub$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")

plot(data_sub$Datetime,
     data_sub$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()