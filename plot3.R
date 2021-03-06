setwd("~/GitHub/ExData_Plotting1")

dat <- read.table("household_power_consumption.txt", 
                   sep=';',
                   na.strings = "?",
                   colClasses=c("character", "character", rep("numeric",7)),
                   skip = 66637, 
                   nrow = 2880,
           col.names = colnames(read.table("household_power_consumption.txt", sep=';', nrow = 1,
                                           header = TRUE)))

dat$dt <- paste(dat$Date, dat$Time, sep = ", ")
dat$time <- strptime(dat$dt, format="%d/%m/%Y, %H:%M:%S")

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12)
plot(dat$time, dat$Sub_metering_1,
     type = "n",
     ylab = "Energy sub metering",
     xlab = "")
lines(dat$time, dat$Sub_metering_1)
lines(dat$time, dat$Sub_metering_2, col = "red")
lines(dat$time, dat$Sub_metering_3, col = "blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),
       lwd = c(1.5, 1.5 ,1.5),
       col = c("black", "red", "blue"))
dev.off()

