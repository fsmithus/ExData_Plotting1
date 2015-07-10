
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
png(filename="plot3.png",width=480,height=480)
par(mfcol=c(1,1))
plot(data$sub_kitchen ~ data$timestamp,type="n",xlab="",ylab="Energy sub metering")
points(data$sub_kitchen ~ data$timestamp,type="l",col="black")
points(data$sub_laundry ~ data$timestamp,type="l",col="red")
points(data$sub_utility ~ data$timestamp,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","blue","red"),lwd=1)

# Save to file.  Note that previous approach using dev.copy() caused legend to be truncated. So, I pre-defined the device
# to have the desired dimensions, and this gave a better result.
##dev.copy(png,filename="plot3.png",width=480,height=480)

dev.off()
