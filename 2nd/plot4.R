## the first 13 lines are roughly the same as the previous 3 
## plots,so i delete the text description to save space and 
## make it more tidy.
plot4=function(){
    quiz=read.table("household_power_consumption.txt",sep=";"
            ,nrows=5000,skip=65000,na.strings="?")
    col.names=read.table("household_power_consumption.txt"
            ,header=T,nrows=1,sep=";")
    colnames(quiz)=names(col.names)
    quiz$datetime=paste(quiz$Date,quiz$Time)
    quiz$datetime=strptime(quiz$datetime,format="%d/%m/%Y %T")
    quiz=quiz[quiz$Date=="1/2/2007"|quiz$Date=="2/2/2007",]
    png(filename="plot4.png",width=480,height=480)
## I use mfcol instead of mfrow to correspond with my plot order.
    par(mfcol=c(2,2))
## below i plot first graph.    
    {plot(quiz$datetime,quiz$Global_active_power,type="n",xlab=""
         ,ylab="Global Active Power")
    lines(quiz$datetime,quiz$Global_active_power)}
## below i plot second graph.     
    {plot(quiz$datetime,quiz$Sub_metering_1,type="n",xlab=""
         ,ylab="Energy sub metering")
    lines(quiz$datetime,quiz$Sub_metering_1,col="black")
    lines(quiz$datetime,quiz$Sub_metering_2,col="red")
    lines(quiz$datetime,quiz$Sub_metering_3,col="blue")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2"
        ,"Sub_metering_3"),col=c("black","red","blue"),lty=1
        ,bty="n")}
## below comes up third graph.     
    {plot(quiz$datetime,quiz$Voltage,type="n",xlab="datetime"
         ,ylab="Voltage")
    lines(quiz$datetime,quiz$Voltage)}
## below to complete this assignment.    
    {plot(quiz$datetime,quiz$Global_reactive_power,type="n"
          ,xlab="datetime",ylab="Global_reactive_power")
    lines(quiz$datetime,quiz$Global_reactive_power)}
    dev.off()
}