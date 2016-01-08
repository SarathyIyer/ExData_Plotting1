## Function plot1
##	Plot1 plots the histogram. The function input the file that has the
##	data. The grpah will be plotted in the output file that is also parameterized
##	
##
## Sample call plot1<-function("./data/exploreweek1proj/household_power_consumption.txt","./data/plot1.png")
plot1<-function(InputDirFile,OutputDirFile) {
## Plot1 InputDirFile = "./data/exploreweek1proj/household_power_consumption.txt"
## OutputDirFile = "./data/plot1.png"
fullData<-read.table(file=InputDirFile,sep=";",header=TRUE)
names(fullData)
dim(fullData)
## Ensures that no NA value in Date
fullData1<-fullData[complete.cases(fullData$Date),]
## Chooses the date Jan 2007-02-01 and 2007-02-02 from the data set
fullData1<-fullData1[as.Date(fullData1$Date,format="%d/%m/%Y")==as.Date("2007-02-01",format="%Y-%m-%d") | as.Date(fullData1$Date,format="%d/%m/%Y")==as.Date("2007-02-02",format="%Y-%m-%d"),]
## As suggested in the instruction this eliminates the possibility of ? in the date
fullDataGlobalActivePower<-fullData1[fullData1$Global_active_power != "?",]
## Opens the png file with 480*480
png(filename = OutputDirFile, width = 480, height = 480, units = "px")
## Histogram
hist(as.numeric(fullDataGlobalActivePower$Global_active_power)/1000, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
## End of Plot 1
}

