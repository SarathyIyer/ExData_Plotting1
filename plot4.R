## Function plot4
##	Plot4 plots the multiple Line graph. The function input the file that has the
##	data. The grpah will be plotted in the output file that is also parameterized
##	No legends or xlab or main labels were requested in this assignment
##
## Sample call plot4<-function("./data/exploreweek1proj/household_power_consumption.txt","./data/plot4.png")
plot4<-function(InputDirFile,OutputDirFile) {
### Plot 4
library(datasets)
fullData<-read.table(file=InputDirFile,sep=";",header=TRUE)
names(fullData)
dim(fullData)
fullData1<-fullData[complete.cases(fullData$Date),]
fullData1<-fullData1[as.Date(fullData1$Date,format="%d/%m/%Y")==as.Date("2007-02-01",format="%Y-%m-%d") | as.Date(fullData1$Date,format="%d/%m/%Y")==as.Date("2007-02-02",format="%Y-%m-%d"),]
png(filename = OutputDirFile, width = 480, height = 480, units = "px")
###Initialize the graph with margin and 4 plots
par(mfrow=c(2,2), mar=c(4,4,2,1),oma=c(0,0,2,0))
#### Plot 1
fullDataGlobalActivePower<-fullData1[fullData1$Global_active_power != "?",]
fullDataGlobalActivePower$Day<-as.character(format(as.Date(fullDataGlobalActivePower$Date,format="%d/%m/%Y"),"%a"))
fullDataGlobalActivePower$KW<-as.numeric(fullDataGlobalActivePower$Global_active_power)/1000

with(fullDataGlobalActivePower, plot(strptime(paste(as.Date(fullDataGlobalActivePower$Date,format="%d/%m/%Y"),fullDataGlobalActivePower$Time),"%Y-%m-%d %H:%M:%S"),KW,ylab="Global Active Power",type="l",xlab=""))

#### Plot 2
with(fullDataGlobalActivePower, plot(strptime(paste(as.Date(fullDataGlobalActivePower$Date,format="%d/%m/%Y"),fullDataGlobalActivePower$Time),"%Y-%m-%d %H:%M:%S"),fullDataGlobalActivePower$Voltage,ylab="Voltage",type="l",xlab="datetime"))

#### Plot 3
with(fullData1, plot(strptime(paste(as.Date(fullData1$Date,format="%d/%m/%Y"),fullData1$Time),"%Y-%m-%d %H:%M:%S"),fullData1$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="",col="black"))
with(fullData1, points(strptime(paste(as.Date(fullData1$Date,format="%d/%m/%Y"),fullData1$Time),"%Y-%m-%d %H:%M:%S"),fullData1$Sub_metering_2,ylab="",type="l",xlab="", col="red"))
with(fullData1, points(strptime(paste(as.Date(fullData1$Date,format="%d/%m/%Y"),fullData1$Time),"%Y-%m-%d %H:%M:%S"),fullData1$Sub_metering_3,ylab="",type="l",xlab="", col="blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), pch="-", lwd=c(1,1,1))

#### Plot 4
with(fullDataGlobalActivePower, plot(strptime(paste(as.Date(fullDataGlobalActivePower$Date,format="%d/%m/%Y"),fullDataGlobalActivePower$Time),"%Y-%m-%d %H:%M:%S"),as.numeric(fullDataGlobalActivePower$Global_reactive_power)/1000,ylab="Global_reactive_power",type="l",xlab="datetime"))
dev.off()
## Plot4
}
