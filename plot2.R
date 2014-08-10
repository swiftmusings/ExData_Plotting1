system.time(dfAll <- read.csv("household_power_consumption.txt", header = TRUE, sep=";"))
dfAll$Date <- as.Date( as.character(dfAll$Date), "%d/%m/%Y")
dfAll$DateTime <- strptime(paste(dfAll$Date, dfAll$Time), "%Y-%m-%d %H:%M:%S") 

df <- subset(dfAll, (dfAll$Date >=as.Date("2007-02-1") &  dfAll$Date <=as.Date("2007-02-02")))

png("plot2.png", width = 480, height = 480)
par(bg=NA)
plot(df$DateTime,df$Global_active_power,type="n",
     ylab="Global Active Power (kilowatts)",xlab="")
lines(df$DateTime,df$Global_active_power,type="l")
dev.off()