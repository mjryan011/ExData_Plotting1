hpcData <- "household_power_consumption.txt"
hpc <- read.table(hpcData, header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")
head(hpc)
hpc_sub <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
head(hpc_sub)
class(hpc_sub$Global_active_power)
gap <- as.numeric(hpc_sub$Global_active_power)
png("plot1.png",width = 480, height = 480)
hist(gap, col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()
