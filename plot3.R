#reads data from previously saved file
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

#converts date to class date in a new column
data$newdate <- as.Date(data$Date,"%d/%m/%Y")

#subsets to tdata based on data conditional match
tData <- subset(data,data$newdate=="2007-02-01"|data$newdate=="2007-02-02")

#creates numeric class of Global active power in new column
tData$GAP <- as.numeric(as.character(tData$Global_active_power))

#combines old date & time
tData$newDT <- paste(tData$Date,tData$Time,sep=";")

#converts newdate time with date time function and store in newDT1
tData$newDT1 <- strptime(tData$newDT,"%d/%m/%Y;%H:%M:%S")

# make numeric metering data
tData$sm1 <- as.numeric(as.character(tData$Sub_metering_1))
tData$sm2 <- as.numeric(as.character(tData$Sub_metering_2))
tData$sm3 <- as.numeric(as.character(tData$Sub_metering_3))

#initiate plot
plot(tData$newDT1,tData$sm1,type="n",ylab="Energy Sub Metering",xlab="")

#draw lines on plot
lines(tData$newDT1,tData$sm1,col="black")
lines(tData$newDT1,tData$sm2,col="red")
lines(tData$newDT1,tData$sm3,col="blue")
legend("topright",legend=c("Sub Metering 1","Sub Metering 3","Sub Metering 3"),c,col=c("black","red","blue"),lty=1,text.font=2,cex=0.64)

#copies plot to png device
dev.copy(png,file="plot3.png")

#closes device
dev.off()
