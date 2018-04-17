##Read in data
data <- read.csv("household_power_consumption.txt", header= TRUE, sep= ";")

data$Date1 <- paste(data$Date, data$Time)
data$Date1 <- as.POSIXct(strptime(data$Date1, "%d/%m/%Y %H:%M:%S"))
data$Date<- as.Date(data$Date,"%d/%m/%Y" )

data$Global_active_power <- as.character(data$Global_active_power)
data$Global_active_power <- as.numeric(data$Global_active_power)

##Subset dataframe
Data1 <- subset(data, Date== "2007-02-01" | Date== "2007-02-02") 


##plot graph
png(file= "plot2.png")
plot(x= Data1$Date1, y= Data1$Global_active_power, type= "l", xlab= " ",
     ylab= "Global Active Power (kilowatts)")
dev.off()

