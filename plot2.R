## Function plot2
##	Plot2 plots the Line graph. The function input the file that has the
##	data. The grpah will be plotted in the output file that is also parameterized
##	No legends or xlab or main labels were requested in this assignment
##
## Sample call plot2<-function("./data/exploreweek1proj/household_power_consumption.txt","./data/plot2.png")
plot2<-function(InputDirFile,OutputDirFile) {
## Plot2 InputDirFile = "./data/exploreweek1proj/household_power_consumption.txt"
## OutputDirFile = "./data/plot2.png"

## Plot 2
## Import Library datasets
library(datasets)
fullData<-read.table(file=InputDirFile,sep=";",header=TRUE)
names(fullData)
dim(fullData)
fullData1<-fullData[complete.cases(fullData$Date),]
## Collects the data corresponding to Feb dates 2007-02-01 and 2007-02-02
fullData1<-fullData1[as.Date(fullData1$Date,format="%d/%m/%Y")==as.Date("2007-02-01",format="%Y-%m-%d") | as.Date(fullData1$Date,format="%d/%m/%Y")==as.Date("2007-02-02",format="%Y-%m-%d"),]
fullDataGlobalActivePower<-fullData1[fullData1$Global_active_power != "?",]

fullDataGlobalActivePower$Day<-as.character(format(as.Date(fullDataGlobalActivePower$Date,format="%d/%m/%Y"),"%a"))
fullDataGlobalActivePower$KW<-as.numeric(fullDataGlobalActivePower$Global_active_power)/1000
png(filename = OutputDirFile, width = 480, height = 480, units = "px")
with(fullDataGlobalActivePower, plot(strptime(paste(as.Date(fullDataGlobalActivePower$Date,format="%d/%m/%Y"),fullDataGlobalActivePower$Time),"%Y-%m-%d %H:%M:%S"),KW,ylab="Global Active Power (kilowatts)",type="l",xlab=""))
dev.off()

## End of Plot2
}