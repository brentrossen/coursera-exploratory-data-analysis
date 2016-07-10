source("DownloadAndReadHouseholdPowerConsumptionData.R")

if(!exists("hpc")){
    hpc <- DownloadAndReadHouseholdPowerConsumptionData()
}

png(file="plot2.png",width=480,height=480)

with(hpc, plot(
    x = DateTime,
    y = Global_active_power, 
    type = "l",
    lwd = 1,
    xlab = "", 
    ylab = "Global Active Power (kilowatts)"))

dev.off()