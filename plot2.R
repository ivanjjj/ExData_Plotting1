library(lubridate)

## Read data into R
plot2_data <- read.csv("power_data.csv",row.names = 1)

## Covert Date_time column into POSIX format
plot2_data$Date_time <- parse_date_time(plot2_data$Date_time,"ymdHMS")
plot2_data$Date_time <- as.POSIXct(plot2_data$Date_time)

## Create PNG file
png("plot2.png",width=480,height=480)

## Create plot

par(
  bg = NA
)

with(plot2_data,
     plot(Date_time, Global_active_power,
          xlab = "",
          ylab = "Global Active Power (kilowatts)",
          type = "l",
          mar = c(4,4,2,1)
          )
      
     )

## Save and close plot to file
dev.off()