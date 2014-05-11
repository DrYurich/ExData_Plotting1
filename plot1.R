d=read.table('household_power_consumption.txt',header=T,as.is=T,sep=';',na.strings="?")


timepoints=strptime(paste(d[,1],d[,2]), "%d/%m/%Y %H:%M:%S")


starttime=strptime("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S")
endtime=strptime("2007-02-02 23:59:59","%Y-%m-%d %H:%M:%S")

d = d[ timepoints >= starttime & timepoints <= endtime,]
d=d[!is.na(d[,1]),]

png("plot1.png",width=480,height=480)
hist(d$Global_active_power,col="orangered",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()


