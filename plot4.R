hpcData <- "household_power_consumption.txt"
hpc <- read.table(hpcData, header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")

hpc_sub <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
hpc_sub$Date <- as.Date(hpc_sub$Date,"%d/%m/%Y")
hpc_sub <- cbind(hpc_sub, "Date_Time" = as.POSIXct(paste(hpc_sub$Date,hpc_sub$Time)))

png("plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))

plot(hpc_sub$Global_active_power ~ hpc_sub$Date_Time, type = "l")
plot(hpc_sub$Voltage ~ hpc_sub$Date_Time, type = "l")

with(hpc_sub,plot(hpc_sub$Sub_metering_1 ~ hpc_sub$Date_Time,type = "l"))
lines(hpc_sub$Sub_metering_2 ~ hpc_sub$Date_Time, col = "red")
lines(hpc_sub$Sub_metering_3 ~ hpc_sub$Date_Time, col = "blue")

plot(hpc_sub$Global_reactive_power ~ hpc_sub$Date_Time,type = "l")


dev.off()
