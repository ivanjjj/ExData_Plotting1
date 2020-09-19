## Run download_data.R first to download and store the data into a new table

plot1_data <- read.csv("power_data.csv",stringsAsFactors = TRUE,row.names = 1)

png("plot1.png",width=480,height=480)

par(
  bg = NA
)

with(plot1_data,
     hist(Global_active_power,
          xlab = "Global Active Power (kilowatts)",
          main = "Global Active Power",
          col = "red"
          ))
dev.off()