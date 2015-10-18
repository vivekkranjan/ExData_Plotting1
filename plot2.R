filePath <- "./household_power_consumption.txt"

data <- read.table(filePath, header = T, sep = ";", stringsAsFactors = F, dec = ".")

filtData <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

datetime <- strptime(paste(filtData$Date, filtData$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(filtData$Global_active_power)

png("plot2.png", width = 480, height = 480)

plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()