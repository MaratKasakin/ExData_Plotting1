## plot4
read.table(file.choose(), header=T, sep=";", na.strings = "?") -> my_data ## select data file in your download directory
as.Date(my_data$Date, format = "%d/%m/%Y") -> my_data$Date ## formatting Date column
sub_data <- subset(my_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02")) ## subsetting data from two dates
sub_data$datetime <- strptime(paste(sub_data$Date, sub_data$Time), "%Y-%m-%d %H:%M:%S") ## construct additional datetime column
sub_data$datetime <- as.POSIXct(sub_data$datetime) ## formatting additional column into appropiate format

png(file = "plot4.png", height = 480, width = 480) ## opening graphic device
par(mfrow=c(2,2))
with(sub_data, {
     plot(Global_active_power~datetime, type="l",
             ylab="Global Active Power", xlab="")})
with(sub_data, {
    plot(Voltage~datetime, type="l",
                ylab="Voltage", xlab="datetime")})
with(sub_data, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Energy sub metering", xlab="")}) 
with(sub_data, {points(datetime, Sub_metering_2, type="l", col = "red")})
with(sub_data, {points(datetime, Sub_metering_3, type="l", col = "blue")})
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(sub_data, {
    plot(Global_reactive_power~datetime, type="l",
             ylab="Global_reactive_power", xlab="datetime")})
dev.off() ## closing graphic device