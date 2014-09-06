plot3=function(filename){
        quiz=read.table(filename,header=T,skip=66000,
                        nrows=4000,sep=";")
        colnames(quiz)=c("Date","Time","Global_active_power",
        "Global_reactive_power","Voltage","Global_intensity",
        "Sub_metering_1","Sub_metering_2","Sub_metering_3")
        quiz$datetime=paste(quiz$Date,quiz$Time)
        quiz$datetime=strptime(quiz$datetime,"%d/%m/%Y %H:%M:%S")
        quiz$Date=as.Date(quiz$Date)
        quiz=quiz[quiz$Date=="1/2/2007"|quiz$Date=="2/2/2007",]
plot(quiz$datetime,quiz$Sub_metering_1,type="l",xlab=""
        ,ylab="Energy sub metering")
lines(quiz$datetime,quiz$Sub_metering_2,col="red")
lines(quiz$datetime,quiz$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2",
    "Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.5,
    ncol=1,xjust = 1, yjust =0, x.intersp =0.1, y.intersp =0.4)
dev.copy(png,file="png3.png",width=480,height=480);dev.off()
}