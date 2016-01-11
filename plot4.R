temp <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
date <- as.Date(temp$Date,format="%d/%m/%Y")

data <- temp[date>=as.Date("2007-02-01",format="%Y-%m-%d") & date<=as.Date("2007-02-02",format="%Y-%m-%d"),]
datetime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))#,mar=c(3,2,3,2))

# Panel 1 (topleft)
plot(datetime,as.numeric(data$Global_active_power),type="n",xlab="",ylab="Global Active Power (kilowatt)")
lines(datetime,as.numeric(data$Global_active_power),type="l")

# Panel 2 (topright)
plot(datetime,as.numeric(data$Voltage),type="n",xlab="datetime",ylab="Voltage")
lines(datetime,as.numeric(data$Voltage),type="l")

# Panel 3 (bottomleft)
plot(datetime,as.numeric(data$Sub_metering_1),type="n",xlab="",ylab="Energy Sub metering")
lines(datetime,as.numeric(data$Sub_metering_1),type="l",col="black")
lines(datetime,as.numeric(data$Sub_metering_2),type="l",col="red")
lines(datetime,as.numeric(data$Sub_metering_3),type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n")

# Panel 4 (bottomright)
plot(datetime,as.numeric(data$Global_reactive_power),type="n",xlab="datetime",ylab="Global_reactive_power")
lines(datetime,as.numeric(data$Global_reactive_power),type="l")

dev.off()