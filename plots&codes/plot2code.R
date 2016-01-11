plot2 = function(){
      activeData=subset(data, data$Date=='1/2/2007' | data$Date=='2/2/2007')
activeData$Time=as.character(activeData$Time)
for(i in 3:8){activeData[,i]=as.character(activeData[,i])}
is.na(activeData)=activeData=='?'
for(i in 3:8){activeData[,i]=as.numeric(activeData[,i])}
activeData$DateTime=as.POSIXct(paste(activeData$Date, activeData$Time), format="%d/%m/%Y %H:%M:%S")
plot(activeData$DateTime,activeData$Global_active_power,type='n',xlab='',ylab='Global active power(kilowatts)')
lines(activeData$DateTime,activeData$Global_active_power)
dev.copy(png,file='plot2.png')
dev.off()
}