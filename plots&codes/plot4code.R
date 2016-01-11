plot4=function(){
      activeData=subset(data, data$Date=='1/2/2007' | data$Date=='2/2/2007')
      activeData$Time=as.character(activeData$Time)
      for(i in 3:8){activeData[,i]=as.character(activeData[,i])}
      is.na(activeData)=activeData=='?'
      for(i in 3:8){activeData[,i]=as.numeric(activeData[,i])}
      activeData$DateTime=as.POSIXct(paste(activeData$Date, activeData$Time), format="%d/%m/%Y %H:%M:%S")
      par(mfrow=c(2,2))
      with(activeData,{
      plot(DateTime,Global_active_power,type='n',ylab='Global active power')
      lines(DateTime,Global_active_power)
      plot(DateTime,Voltage,type='n',ylab='Voltage')
      lines(DateTime,Voltage)
      plot(DateTime,Sub_metering_1,type='n',xlab='',ylab='Energy sub metering')
      lines(DateTime,Sub_metering_1)
      lines(DateTime,Sub_metering_2,col='red')
      lines(DateTime,Sub_metering_3,col='blue')
      legend('topright',lty=c(1,1),col=c('black','red','blue'),
             legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
      plot(DateTime,Global_reactive_power,type='n',ylab=Global_reactive_power)
      lines(DateTime,Global_reactive_power)})
      dev.copy(png,file='plot4.png')
      dev.off()
}