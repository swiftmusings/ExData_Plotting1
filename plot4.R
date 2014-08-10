system.time(dfAll <- read.csv("household_power_consumption.txt", header = TRUE, sep=";"))
dfAll$Date <- as.Date( as.character(dfAll$Date), "%d/%m/%Y")
dfAll$DateTime <- strptime(paste(dfAll$Date, dfAll$Time), "%Y-%m-%d %H:%M:%S") 

df <- subset(dfAll, (dfAll$Date >=as.Date("2007-02-1") &  dfAll$Date <=as.Date("2007-02-02")))

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0),bg=NA)
with(df,{
  plot(DateTime,Global_active_power,type="n",ylab="Global Active Power", xlab="")
  lines(DateTime,Global_active_power)
  
  plot(DateTime,Voltage,type="n",ylab="Voltage")
  lines(DateTime,Voltage)
  
  plot(df$DateTime,df$Sub_metering_1,type="n",main="",
       ylab ="Energy sub metering",xlab="")
  lines(df$DateTime,df$Sub_metering_1,type="l",col="black")
  lines(df$DateTime,df$Sub_metering_2,type="l",col="red")
  lines(df$DateTime,df$Sub_metering_3,type="l",col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=c("solid","solid","solid"),col=c("black","red","blue"),bty="n")
  
  plot(DateTime,Global_reactive_power,type="n")
  lines(DateTime,Global_reactive_power)
})
dev.off()
