plot1=function(){
## Read in data which includes the date range of 1/2~2/2 in 2007.
quiz=read.table("household_power_consumption.txt",sep=";"
            ,nrows=5000,skip=65000,na.strings="?")
## Because first step skiped the variable names, we need to read in
## agaain from the raw data.
col.names=read.table("household_power_consumption.txt",header=T,
            nrows=1,sep=";")
colnames(quiz)=names(col.names)
## subset the exact cases from data which were read in.
quiz=quiz[quiz$Date=="1/2/2007"|quiz$Date=="2/2/2007",]
### proceed to construct the first graph after subsetting the data.
png(filename="plot1.png",width=480,height=480)
hist(quiz$Global_active_power,main="Global Active Power"
     ,xlab="Global Active Power(Kilowatts)",col="red")
dev.off()
}