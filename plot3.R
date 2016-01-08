## Function plot3
##	Plot3 plots the Line graph. The function input the file that has the
##	data. The grpah will be plotted in the output file that is also parameterized
##	No legends or xlab or main labels were requested in this assignment
##
## Sample call plot3<-function("./data/exploreweek1proj/household_power_consumption.txt","./data/plot3.png")
plot3<-function(InputDirFile,OutputDirFile) {
## Plot3 InputDirFile = "./data/exploreweek1proj/household_power_consumption.txt"
## OutputDirFile = "./data/plot3.png"

## Import Library datasets
### Plot 3
library(datasets)
fullData<-read.table(file=InputDirFile,sep=";",header=TRUE)
names(fullData)
dim(fullData)
fullData1<-fullData[complete.cases(fullData$Date),]
fullData1<-fullData1[as.Date(fullData1$Date,format="%d/%m/%Y")==as.Date("2007-02-01",format="%Y-%m-%d") | as.Date(fullData1$Date,format="%d/%m/%Y")==as.Date("2007-02-02",format="%Y-%m-%d"),]
png(filename = OutputDirFile, width = 480, height = 480, units = "px")
with(fullData1, plot(strptime(paste(as.Date(fullData1$Date,format="%d/%m/%Y"),fullData1$Time),"%Y-%m-%d %H:%M:%S"),fullData1$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="",col="black"))
with(fullData1, points(strptime(paste(as.Date(fullData1$Date,format="%d/%m/%Y"),fullData1$Time),"%Y-%m-%d %H:%M:%S"),fullData1$Sub_metering_2,ylab="",type="l",xlab="", col="red"))
with(fullData1, points(strptime(paste(as.Date(fullData1$Date,format="%d/%m/%Y"),fullData1$Time),"%Y-%m-%d %H:%M:%S"),fullData1$Sub_metering_3,ylab="",type="l",xlab="", col="blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), pch="-", lwd=c(3,3,3))
dev.off()
## Plot3
}

