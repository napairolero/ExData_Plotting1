############################## first plot #####################################
temp <- tempfile() 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep=";",stringsAsFactors=FALSE)
unlink(temp)

colnames(data) <- sapply(data[1,], as.character)
data <- data[2:length(data[,1]),]

data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
data$Global_active_power <- as.numeric(data$Global_active_power)


png(file="plot1.png", width=480, height=480, units ="px")
hist(data$Global_active_power, breaks=seq(0,7.5,.5), col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()