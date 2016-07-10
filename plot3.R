source("DownloadAndReadHouseholdPowerConsumptionData.R")

if(!exists("hpc")){
    hpc <- DownloadAndReadHouseholdPowerConsumptionData()
}

png(file="plot3.png",width=480,height=480, bg ="transparent")

with(hpc, plot(
    x = c(DateTime, DateTime, DateTime),
    y = c(Sub_metering_1, Sub_metering_2, Sub_metering_3),
    type = "n",
    xlab = "", 
    ylab = "Energy sub metering"))

with(hpc,
     lines(DateTime,
           Sub_metering_1,
           col = "black",
           lwd = 1
     ))

with(hpc,
     lines(DateTime,
           Sub_metering_2,
           col = "red",
           lwd = 1
     ))

with(hpc,
     lines(DateTime,
           Sub_metering_3,
           col = "blue",
           lwd = 1
     ))

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = c(1,1,1),
       col = c("black", "red", "blue"))

dev.off()
