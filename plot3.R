system.time(dfAll <- read.csv("household_power_consumption.txt", header = TRUE, sep=";"))
dfAll$Date <- as.Date( as.character(dfAll$Date), "%d/%m/%Y")
dfAll$DateTime <- strptime(paste(dfAll$Date, dfAll$Time), "%Y-%m-%d %H:%M:%S") 

df <- subset(dfAll, (dfAll$Date >=as.Date("2007-02-1") &  dfAll$Date <=as.Date("2007-02-02")))


png("plot3.png", width = 480, height = 480)
par(bg=NA)
plot(df$DateTime,df$Sub_metering_1,type="n",main="",
     ylab ="Energy sub metering",xlab="")
lines(df$DateTime,df$Sub_metering_1,type="l",col="black")
lines(df$DateTime,as.numeric(df$Sub_metering_2),type="l",col="red")
lines(df$DateTime,df$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c("solid","solid","solid"),col=c("black","red","blue"))

dev.off()