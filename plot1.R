system.time(dfAll <- read.csv("household_power_consumption.txt", header = TRUE, sep=";"))
dfAll$Date <- as.Date( as.character(dfAll$Date), "%d/%m/%Y")
dfAll$DateTime <- strptime(paste(dfAll$Date, dfAll$Time), "%Y-%m-%d %H:%M:%S") 

df <- subset(dfAll, (dfAll$Date >=as.Date("2007-02-1") &  dfAll$Date <=as.Date("2007-02-02")))

#########################################################################################
png("plot1.png", width = 480, height = 480)
par(bg=NA)
hist(as.numeric(df$Global_active_power), col="red",
     main="Global Active Power",
     xlab ="Global Active Power (kilowatts)")
dev.off()
