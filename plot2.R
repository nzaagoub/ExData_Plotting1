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

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12)
plot(dat$time, dat$Global_active_power, 
     type = "n",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
lines(dat$time, dat$Global_active_power)
dev.off()

