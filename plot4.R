library(lubridate)

## Read data into R
plot4_data <- read.csv("power_data.csv",row.names = 1)

## Covert Date_time column into POSIX format
plot4_data$Date_time <- parse_date_time(plot4_data$Date_time,"ymdHMS")
plot4_data$Date_time <- as.POSIXct(plot4_data$Date_time)

## Create PNG file
png("plot4.png",width=480,height=480)

## Create plot

par(
  bg = NA,
  mfcol = c(2,2)
)

with(plot4_data,
     plot(Date_time, Global_active_power,
          xlab = "",
          ylab = "Global Active Power (kilowatts)",
          type = "l",
          mar = c(4,4,2,1)
     )
     
)

with(plot4_data,
     plot(Date_time, Sub_metering_1,
          xlab = "",
          ylab = "Energy sub metering",
          type = "l",
          mar = c(4,4,2,1)
     )
     
)
## Plot seperate lines and legend

lines(plot3_data$Date_time, plot3_data$Sub_metering_2,type="l",col="red")
lines(plot3_data$Date_time, plot3_data$Sub_metering_3,type="l",col="blue")
legend("topright",bty = "n",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"),lty=1)

with(plot4_data,
     plot(Date_time, Voltage,
          xlab = "datetime",
          ylab = "Voltage",
          type = "l",
          mar = c(4,4,2,1)
     )
     
)

with(plot4_data,
     plot(Date_time, Global_reactive_power,
          xlab = "datetime",
          ylab = "Global_reactive_power",
          type = "l",
          mar = c(4,4,2,1)
     )
     
)

## Save and close plot to file
dev.off()