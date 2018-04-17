##Read in data
data <- read.csv("household_power_consumption.txt", header= TRUE, sep= ";")

data$Date1 <- paste(data$Date, data$Time)
data$Date1 <- as.POSIXct(strptime(data$Date1, "%d/%m/%Y %H:%M:%S"))
data$Date<- as.Date(data$Date,"%d/%m/%Y" )

sub_cols <- c(3, 4,5, 7, 8)
data[sub_cols] <- lapply(data[sub_cols], as.character)
data[sub_cols] <- lapply(data[sub_cols], as.numeric)


##Subset dataframe
Data1 <- subset(data, Date== "2007-02-01" | Date== "2007-02-02") 


##plot graphs
png(file= "plot4.png")
par(mfrow= c(2, 2))

##Global Active Power 
plot(x= Data1$Date1, y= Data1$Global_active_power, type= "l", xlab= " ",
     ylab= "Global Active Power (kilowatts)")

##Voltage 
plot(x= Data1$Date1, y= Data1$Voltage, type= "l", xlab= "datetime",
     ylab= "Voltage")

##Energy Sub Metering
plot(x= Data1$Date1, y= Data1$Sub_metering_1, type= "l", xlab= " ",
     ylab= "Energy sub metering")
lines(x= Data1$Date1, y= Data1$Sub_metering_2, col="red")
lines(x= Data1$Date1, y= Data1$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), lwd= 1, bty="n",
       legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Gloabl Reactive Power
plot(x= Data1$Date1, y= Data1$Global_reactive_power, type= "l", xlab= "datetime",
     ylab= "Global_reactive_power")

##Close file
dev.off()
