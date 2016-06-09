rm(list=ls())
setwd("J:/personal/r-course/Assignments/4DV")

# COMMENT THIS SECTION IN to re-read all the data.
# Once it's run, same subsset used for remaining files. 

# mydata<-read.table("household_power_consumption.txt",header=TRUE,sep = ";",flush = TRUE)
# mydata2<-mydata[as.character(mydata$Date) %in% c("1/2/2007","2/2/2007"),]
# for(j in 3:9) {
#   if(!is.numeric(mydata2[,j]))
#   mydata2[,j]<-as.numeric(levels(mydata2[,j])[mydata2[,j]])
# }
# rm(j,mydata)
# saveRDS(mydata2,file="subsetdata.RDS")
mydata2<-readRDS(file="subsetdata.RDS")

png(filename = "rplot1.png",width = 480, height = 480)
hist(mydata2$Global_active_power,
     main="Global Active Power",
     col="red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

dev.off()


