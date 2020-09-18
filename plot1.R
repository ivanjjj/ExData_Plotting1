plot1_data <- read.csv("power_data.csv",stringsAsFactors = TRUE,row.names = 1)

png("plot1.png")

par(
  cex.main = 1.1,
  cex.axis = .9,
  cex.lab = .9,
  cex = 1.1,
  bg = NA
)

with(plot1_data,
     hist(Global_active_power,
          xlab = "Global Active Power (kilowatts)",
          main = "Global Active Power",
          col = "red"
          ))
dev.off()