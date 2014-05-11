d=read.table('household_power_consumption.txt',header=T,as.is=T,sep=';',na.strings="?")


timepoints=strptime(paste(d[,1],d[,2]), "%d/%m/%Y %H:%M:%S")


starttime=strptime("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S")
endtime=strptime("2007-02-02 23:59:59","%Y-%m-%d %H:%M:%S")

d = d[ timepoints >= starttime & timepoints <= endtime,]
d=d[!is.na(d[,1]),]


png("plot2.png",width=480,height=480)

plot(d$Global_active_power,type='l',xaxt='n',xlab="",ylab="Global Active Power (kilowatts)")

ticks=which ( d$Time=="00:00:00" & ( d$Date == "1/2/2007" | d$Date == "2/2/2007" ) |  d$Date == "2/2/2007" & d$Time=="23:59:00" )

axis(1,at=ticks,labels=c('Thu','Fri','Sat'))

dev.off()


