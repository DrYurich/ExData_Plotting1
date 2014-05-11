d=read.table('household_power_consumption.txt',header=T,as.is=T,sep=';',na.strings="?")


timepoints=strptime(paste(d[,1],d[,2]), "%d/%m/%Y %H:%M:%S")


starttime=strptime("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S")
endtime=strptime("2007-02-02 23:59:59","%Y-%m-%d %H:%M:%S")

d = d[ timepoints >= starttime & timepoints <= endtime,]
d=d[!is.na(d[,1]),]

ticks=which ( d$Time=="00:00:00" & ( d$Date == "1/2/2007" | d$Date == "2/2/2007" ) |  d$Date == "2/2/2007" & d$Time=="23:59:00" )


png("plot4.png",width=480,height=480)

par(mfrow=c(2,2))

# first plot

plot(d$Global_active_power,type='l',xaxt='n',xlab="",
   ylab="Global Active Power (kilowatts)",lwd=0.5)
axis(1,at=ticks,labels=c('Thu','Fri','Sat'))

# second plot

plot(d$Voltage,type='l',xaxt='n',xlab="datetime",ylab="Voltage",lwd=0.5)
axis(1,at=ticks,labels=c('Thu','Fri','Sat'))


# third plot

plot(d$Sub_metering_1,type='l',xaxt='n',xlab="",ylab="Energy Sub Metering",lwd=0.5)
lines(d$Sub_metering_2,type='l',col='red',lwd=0.5)
lines(d$Sub_metering_3,type='l',col='blue',lwd=0.5)

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
    col=c("black","red","blue"),bty='n',lwd=1)
axis(1,at=ticks,labels=c('Thu','Fri','Sat'))

# forth plot

plot(d$Global_reactive_power,type='l',xaxt='n',xlab="datetime",
   ylab="Global_reactive_power",lwd=0.5)
axis(1,at=ticks,labels=c('Thu','Fri','Sat'))



dev.off()


