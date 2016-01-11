temp <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
date <- as.Date(temp$Date,format="%d/%m/%Y")

data <- temp[date>=as.Date("2007-02-01",format="%Y-%m-%d") & date<=as.Date("2007-02-02",format="%Y-%m-%d"),]
datetime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

png("plot2.png",width=480,height=480)
plot(datetime,as.numeric(data$Global_active_power),type="n",xlab="",ylab="Global Active Power (kilowatt)")
lines(datetime,as.numeric(data$Global_active_power),type="l")
dev.off()