hpcData <- "household_power_consumption.txt"
hpc <- read.table(hpcData, header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")

hpc_sub <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
hpc_sub$Date <- as.Date(hpc_sub$Date,"%d/%m/%Y")
hpc_sub <- cbind(hpc_sub, "Date_Time" = as.POSIXct(paste(hpc_sub$Date,hpc_sub$Time)))

png("plot2.png",width = 480, height = 480)

plot(hpc_sub$Global_active_power ~ hpc_sub$Date_Time, type = "l",xlab = "",ylab = "Global Active power (kilowatts)")

dev.off()
