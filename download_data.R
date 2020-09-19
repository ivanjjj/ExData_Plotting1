library(lubridate)
library(dplyr)

## Download and unzip data
data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(data_url, "power_data.zip", method = "curl")
path <- file.path(getwd(),"power_data.zip")
unzip(path)

## Read data into R data frame
power_data <- read.table("household_power_consumption.txt", sep = ";",na.strings = "?", header = TRUE,stringsAsFactors = FALSE)

## Merge date/time columns
power_data$Date <- strptime(paste(power_data$Date, power_data$Time), format="%d/%m/%Y %H:%M:%S")

## Remove Time column
power_data <- select(power_data, -Time)
power_data <- rename(power_data, Date_time = Date)

## Filter 
power_data <- filter(power_data, as.Date(Date_time) == as.Date("2007-02-01") | as.Date(Date_time) == as.Date("2007-02-02"))

## Write back to file for use
write.csv(power_data, "power_data.csv")