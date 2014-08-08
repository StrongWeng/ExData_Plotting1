plot4=function(filename){
        quiz=read.table(filename,header=T,skip=66000,
                        nrows=4000,sep=";")
        colnames(quiz)=c("Date","Time","Global_active_power",
        "Global_reactive_power","Voltage","Global_intensity",
        "Sub_metering_1","Sub_metering_2","Sub_metering_3")
        quiz$datetime=paste(quiz$Date,quiz$Time)
        quiz$datetime=strptime(quiz$datetime,"%d/%m/%Y %H:%M:%S")
        quiz$Date=as.Date(quiz$Date)
        quiz=quiz[quiz$Date=="1/2/2007"|quiz$Date=="2/2/2007",]

par(mfcol=c(2,2),mar=c(2,2,2,2))
plot(quiz$datetime,quiz$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")

plot(quiz$datetime,quiz$Sub_metering_1,type="l",xlab=""
        ,ylab="Energy sub metering")
lines(quiz$datetime,quiz$Sub_metering_2,col="red")
lines(quiz$datetime,quiz$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2",
    "Sub_metering_3"),col=c("black","red","blue"),lty=1,
    cex=0.4,y.intersp=0.3,x.intersp=0.2)
plot(quiz$datetime,quiz$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(quiz$datetime,quiz$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.copy(png,file="png4.png",width=480,height=480);dev.off()
}