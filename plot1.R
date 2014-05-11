#reads data from previously saved file
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

#converts date to class date in a new column
data$newdate <- as.Date(data$Date,"%d/%m/%Y")

#subsets to tdata based on data conditional match
tData <- subset(data,data$newdate=="2007-02-01"|data$newdate=="2007-02-02")

#creates numeric class of Global active power in new column
tData$GAP <- as.numeric(as.character(tData$Global_active_power))

#plots hist plot from tData$GAP data with colours and labelling
hist(tData$GAP,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")

#copies plot to png device
dev.copy(png,file="plot1.png")

#closes device
dev.off()
