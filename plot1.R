setwd("~/GitHub/ExData_Plotting1")

dat <- read.table("household_power_consumption.txt", 
                   sep=';',
                   na.strings = "?",
                   colClasses=c("character", "character", rep("numeric",7)),
                   skip = 66637, 
                   nrow = 2880,
           col.names = colnames(read.table("household_power_consumption.txt", sep=';', nrow = 1,
                                           header = TRUE)))

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12)
hist(dat$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylim = c(0, 1200))
dev.off()
