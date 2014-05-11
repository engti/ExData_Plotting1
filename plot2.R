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

#initiate plot
plot(tData$newDT1,tData$GAP,type="n",ylab="Global Active Power (kilowatts)",xlab="")

#draw lines on plot
lines(tData$newDT1,tData$GAP)

#copies plot to png device
dev.copy(png,file="plot2.png")

#closes device
dev.off()
