plot1=function(filename){
        quiz=read.table(filename,header=T,skip=66000,
                        nrows=4000,sep=";")
        colnames(quiz)=c("Date","Time","Global_active_power",
        "Global_reactive_power","Voltage","Global_intensity",
        "Sub_metering_1","Sub_metering_2","Sub_metering_3")
        quiz$datetime=paste(quiz$Date,quiz$Time)
        quiz$datetime=strptime(quiz$datetime,"%d/%m/%Y %H:%M:%S")
        quiz$Date=as.Date(quiz$Date)
        quiz=quiz[quiz$Date=="1/2/2007"|quiz$Date=="2/2/2007",]
        hist(quiz$Global_active_power,col="red",
             main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="png1.png",width=480,height=480);dev.off()
}