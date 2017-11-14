library(data.table) 
read.table(file.choose(), header=T, sep=";", na.strings = "?") -> my_data ## select data file in your download directory
as.Date(my_data$Date, format = "%d/%m/%Y") -> my_data$Date ## formatting Date column
my_data <- data.table(my_data) ## data table formatting for data frame
my_data[my_data$Date >= "2007-02-01" & my_data$Date <= "2007-02-02"] -> sub_data ## subsetting data from two dates

## Plot1:
png(file = "plot1.png", height = 480, width = 480) ## opening graphic device
hist(sub_data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red") ## plot construction
dev.off() ## closing graphic device