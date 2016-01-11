temp <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
date <- as.Date(temp$Date,format="%d/%m/%Y")
data <- temp[date>=as.Date("2007-02-01",format="%Y-%m-%d") & date<=as.Date("2007-02-02",format="%Y-%m-%d"),]
png("plot1.png",width=480,height=480)
hist(as.numeric(data$Global_active_power),col="red",xlab="Global Active Power (kilowatt)",main="Global Active Power")
dev.off()