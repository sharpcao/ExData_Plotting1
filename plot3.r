dt <- read.table("household_power_consumption.txt",,sep=";",colClasses = c("character","character",
			rep("numeric",7)),header=F,na.strings="?",skip=66637,nrows=24*60*2)
names(dt) <- c("date","time","global_active_power","global_reactive_power","voltage",
			"global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")
dt <- transform(dt, datetime = strptime(paste(date,time),"%d/%m/%Y %H:%M:%S"))

Sys.setlocale("LC_TIME", "USA")


png("plot3.png")
plot(sub_metering_1~datetime,data = dt,type="l",xlab="",ylab="Energy sub metering")
lines(sub_metering_2~datetime,data = dt,col="red")
lines(sub_metering_3~datetime,data = dt,col="blue")
legend("topright", col=c("black","red","blue"),legend=paste0("Sub_metering_",1:3),lty=1)
dev.off()