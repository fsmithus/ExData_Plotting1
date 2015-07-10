
# Setup
setwd("Exploratory Data Analysis/ExData_Plotting1/")

# Read the data, convert strings to actual dates/times, and filter the desired 2 days in February 2007.
data <- read.table("household_power_consumption.txt",
                          # nrows=100,
                          header=TRUE,
                          sep=";",
                          na.strings="?",
                          col.names=c("date_s","time_s","active_power","reactive_power","voltage","current","sub_kitchen","sub_laundry","sub_utility")
)
data <- cbind(timestamp=strptime(paste(data$date_s,data$time_s),"%d/%m/%Y %H:%M:%S"),data)

# Subset the data for the desired two days in February 2007.
start <- strptime("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S")
end <- strptime("2007-02-02 23:59:59","%Y-%m-%d %H:%M:%S")
data <- subset(data,((start <= timestamp) & (timestamp <= end)))

# Plot the data.
par(mfcol=c(1,1))
with(data, plot(active_power~timestamp,
                type="l",xlab="",ylab="Global Active Power (kilowatts)"))

# Save to file.
dev.copy(png,filename="plot2.png",width=480,height=480)
dev.off()
