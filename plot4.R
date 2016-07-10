source("DownloadAndReadHouseholdPowerConsumptionData.R")

if(!exists("hpc")){
    hpc <- DownloadAndReadHouseholdPowerConsumptionData()
}

png(file="plot4.png",width=480,height=480)

par(mfcol = c(2,2))

# Upper Left Plot
with(hpc, plot(
    x = DateTime,
    y = Global_active_power, 
    type = "l",
    lwd = 1,
    xlab = "", 
    ylab = "Global Active Power"))

# Lower Left Plot
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
       col = c("black", "red", "blue"),
        bty = "n")

# Upper Right Plot
with(hpc, plot(
    x = DateTime,
    y = Voltage, 
    type = "l",
    lwd = 1,
    xlab = "datetime", 
    ylab = "Voltage"))

# Lower Right Plot
with(hpc, plot(
    x = DateTime,
    y = Global_reactive_power, 
    type = "l",
    lwd = 1,
    xlab = "datetime", 
    ylab = "Voltage"))

dev.off()
