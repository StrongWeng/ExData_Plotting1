plot2=function(){
## read in the data from working directory.
quiz=read.table("household_power_consumption.txt",sep=";"
                ,nrows=5000,skip=65000,na.strings="?")
## Because first step skiped the variable names, we need to read in
### the raw data again to retrieve variable names.
col.names=read.table("household_power_consumption.txt",header=T,
                     nrows=1,sep=";")
colnames(quiz)=names(col.names)
## merge variables of Date and Time to create a new datetime var.
quiz$datetime=paste(quiz$Date,quiz$Time)
quiz$datetime=strptime(quiz$datetime,format="%d/%m/%Y %H:%M:%S")
## subset the data we read in to get the required cases.
quiz=quiz[quiz$Date=="1/2/2007"|quiz$Date=="2/2/2007",]
### proceed to construct the second graph from our tidy data.
png(filename="plot2.png",width=480,height=480)
plot(quiz$datetime,quiz$Global_active_power,type="n",xlab=""
     ,ylab="Global Active Power(Kilowatts)")
lines(quiz$datetime,quiz$Global_active_power)
dev.off()
}