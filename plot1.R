source("DownloadAndReadHouseholdPowerConsumptionData.R")

if(!exists("hpc")){
    hpc <- DownloadAndReadHouseholdPowerConsumptionData()
}

png(file="plot1.png",width=480,height=480, bg ="transparent")

with(hpc, hist(Global_active_power, 
               xlab = "Global Active Power (kilowatts)", 
               ylab = "Frequency", 
               col="red", 
               main = "Global Active Power"))

dev.off()