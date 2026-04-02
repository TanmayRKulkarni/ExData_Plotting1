data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data_sub <- subset(data, Date == as.Date("2007-02-01") |
                     Date == as.Date("2007-02-02"))

data_sub$Datetime <- strptime(paste(data_sub$Date, data_sub$Time),
                              format = "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(data_sub$Datetime,
     data_sub$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()