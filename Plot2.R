rm(list=ls())
setwd("J:/personal/r-course/Assignments/4DV")

#Same data as plot 1. Or just read the subset below.

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

png(filename = "rplot2.png", width = 480, height = 480)
plot(datetime,mydata2$Global_active_power,
     ylab="Global Active Power (kilowatts)",
     xlab="",
     type="l"
     )

dev.off()


