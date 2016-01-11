plot1 = function(){
      activeData=subset(data, data$Date=='1/2/2007' | data$Date=='2/2/2007')
      activeData$Time=as.character(activeData$Time)
      for(i in 3:8){activeData[,i]=as.character(activeData[,i])}
      is.na(activeData)=activeData=='?'
      for(i in 3:8){activeData[,i]=as.numeric(activeData[,i])}
      hist(activeData$Global_active_power,col='red',xlab='Global active power (kilowatts)',main='Global active power')
      dev.copy(png,file='plot1.png')
      dev.off()
}
