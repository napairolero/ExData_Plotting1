############################## third plot #####################################
temp <- tempfile() 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep=";",stringsAsFactors=FALSE)
unlink(temp)

colnames(data) <- sapply(data[1,], as.character)
data <- data[2:length(data[,1]),]

data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
data$Global_active_power <- as.numeric(data$Global_active_power)

#create date/timevariable
data$dateTime <- apply(data[,1:2], 1, function(x) paste(x[1], x[2], sep=" "))
data$dateTime <- strptime(data$dateTime,"%d/%m/%Y %H:%M:%S")

png(file="plot3.png", width=480, height=480, units ="px")
plot(data$dateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")
lines(data$dateTime, data$Sub_metering_2, type="l", col="red")
lines(data$dateTime, data$Sub_metering_3, type="l", col ="blue")
legend("topright",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()