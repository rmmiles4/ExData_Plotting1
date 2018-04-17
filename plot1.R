##Read in data
data <- read.csv("household_power_consumption.txt", header= TRUE, sep= ";")

data$Date<- as.Date(data$Date,"%d/%m/%Y" ) # date format now 'yyyy-mm-dd'
data$Time <- as.POSIXct(strptime(data$Time, "%H:%M:%S"))
data$Global_active_power <- as.character(data$Global_active_power)
data$Global_active_power <- as.numeric(data$Global_active_power)

##Subset dataframe
Data1 <- subset(data, Date== "2007-02-01" | Date== "2007-02-02") 

##plot histogram
png(file= "plot1.png")
hist(Data1$Global_active_power, col= "red", 
     xlab= "Global Active Power (kilowatts)", main= "Global Active Power")
dev.off()

