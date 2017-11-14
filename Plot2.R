## plot2
read.table(file.choose(), header=T, sep=";", na.strings = "?") -> my_data ## select data file in your download directory
as.Date(my_data$Date, format = "%d/%m/%Y") -> my_data$Date ## formatting Date column
sub_data <- subset(my_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02")) ## subsetting data from two dates
sub_data$datetime <- strptime(paste(sub_data$Date, sub_data$Time), "%Y-%m-%d %H:%M:%S") ## construct additional datetime column
sub_data$datetime <- as.POSIXct(sub_data$datetime) ## formatting additional column into appropiate format

png(file = "plot2.png", height = 480, width = 480) ## opening graphic device
with(sub_data, {
  plot(Global_active_power~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")}) ## plot construction
dev.off() ## closing graphic device