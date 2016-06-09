rm(list=ls())
setwd("J:/personal/r-course/Assignments/4DV")

# mydata<-read.table("household_power_consumption.txt",header=TRUE,sep = ";",flush = TRUE)
# mydata2<-mydata[as.character(mydata$Date) %in% c("1/2/2007","2/2/2007"),]
# for(j in 3:9) {
#   if(!is.numeric(mydata2[,j]))
#   mydata2[,j]<-as.numeric(levels(mydata2[,j])[mydata2[,j]])
# }
# rm(j,mydata)
# saveRDS(mydata2,file="subsetdata.RDS")
mydata2<-readRDS(file="subsetdata.RDS")

datetime<-strptime(paste(as.character(mydata2$Date),as.character(mydata2$Time)),
                   format="%d/%m/%Y %H:%M:%S")
mydata2<-cbind(mydata2,datetime)

png(filename = "rplot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))
with(mydata2, {
  plot(datetime,Global_active_power,ylab="Global Active Power",xlab="",type="l")
  plot(datetime,Voltage,ylab="Voltage",xlab="datetime",type="l")
  plot(datetime,mydata2$Sub_metering_1,col="black",ylab="Energy sub metering",xlab="",type="l")
  lines(datetime,mydata2$Sub_metering_2,col="red")
  lines(datetime,mydata2$Sub_metering_3,col="blue")
  legend("topright", lty = 1, col = c("black","blue", "red"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime,Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")
})

dev.off()
