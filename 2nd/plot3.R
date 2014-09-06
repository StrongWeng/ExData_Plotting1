## the first 12 lines are roughly the same as the previous 2 plots, 
## so i delete the text description to save space and make it more
## tidy
plot3=function(){
    quiz=read.table("household_power_consumption.txt",sep=";"
                    ,nrows=5000,skip=65000,na.strings="?")
    col.names=read.table("household_power_consumption.txt",header=T,
                         nrows=1,sep=";")
    colnames(quiz)=names(col.names)
    quiz$datetime=paste(quiz$Date,quiz$Time)
    quiz$datetime=strptime(quiz$datetime,format="%d/%m/%Y %H:%M:%S")
    quiz=quiz[quiz$Date=="1/2/2007"|quiz$Date=="2/2/2007",]
## proceed to plot the graph as instructions
    png(filename="plot3.png",width=480,height=480)
    plot(quiz$datetime,quiz$Sub_metering_1,type="n",xlab=""
         ,ylab="Energy sub metering")
    lines(quiz$datetime,quiz$Sub_metering_1,col="black")
    lines(quiz$datetime,quiz$Sub_metering_2,col="red")
    lines(quiz$datetime,quiz$Sub_metering_3,col="blue")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2"
        ,"Sub_metering_3"),col=c("black","red","blue"),lty=1)
    dev.off()
}