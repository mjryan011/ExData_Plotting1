hpcData <- "household_power_consumption.txt"
hpc <- read.table(hpcData, header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")

hpc_sub <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
hpc_sub$Date <- as.Date(hpc_sub$Date,"%d/%m/%Y")
hpc_sub <- cbind(hpc_sub, "Date_Time" = as.POSIXct(paste(hpc_sub$Date,hpc_sub$Time)))

png("plot3.png",width = 480, height = 480)

with(hpc_sub,plot(Sub_metering_1 ~ Date_Time,type = "l",xlab = "",ylab = "Energy Sub Metering"))
lines(hpc_sub$Sub_metering_2 ~ hpc_sub$Date_Time, col = "red")
lines(hpc_sub$Sub_metering_3 ~ hpc_sub$Date_Time, col = "blue")
legend("topright", lty = 1, lwd = 3, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()
