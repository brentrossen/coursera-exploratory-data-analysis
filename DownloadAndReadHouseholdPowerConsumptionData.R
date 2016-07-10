DownloadAndReadHouseholdPowerConsumptionData <- function(){
    # Download, Read, Clean, and Filter the data
    # Then return the resulting data frame
    library(dplyr)
    library(readr)
    library(lubridate)
    
    # Create data folder to hold the data
    if(!dir.exists("data")){
        dir.create("data")
    }
    
    # Download and unpack the data
    zipPath <- "data/household_power_consumption.zip"
    if(!file.exists(zipPath)){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data/household_power_consumption.zip")
    }
    
    filePath <- "data/household_power_consumption.txt"
    if(!file.exists(filePath)){
        unzip(zipfile = zipPath, exdir = "data")
    }
    
    # Read the data
    colTypes <- list(col_character(), col_character(), col_double(), col_double(), col_double(), col_double(), col_double(), col_double(), col_double())
    household_power_consumption <- 
        readr::read_delim("data/household_power_consumption.txt", ";", 
                          col_types = colTypes, 
                          na = "?")
    
    # Parse the DateTime
    hpc <- household_power_consumption %>% 
        mutate(
            DateTime = dmy_hms(paste(Date, Time))
        ) %>% select(DateTime, everything(), -Date, -Time)
    
    # Read Subset 2007-02-01 and 2007-02-02
    begin <- ymd_hms("2007-02-01 00:00:00")
    end <- ymd_hms("2007-02-03 00:00:00")
    hpc <- hpc %>% 
        filter(DateTime >= begin, DateTime < end)

    hpc
}