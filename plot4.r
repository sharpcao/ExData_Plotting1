dt <- read.table("household_power_consumption.txt",,sep=";",colClasses = c("character","character",
			rep("numeric",7)),header=F,na.strings="?",skip=66637,nrows=24*60*2)
names(dt) <- c("date","time","global_active_power","global_reactive_power","voltage",
			"global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")
dt <- transform(dt, datetime = strptime(paste(date,time),"%d/%m/%Y %H:%M:%S"))

Sys.setlocale("LC_TIME", "USA")


png("plot4.png")	
par(mfrow=c(2,2))
with(dt, {
	plot(global_active_power~datetime,type="l", ylab="Global Active Power",xlab="")
	plot(voltage~datetime, type="l", ylab="Voltage")

	plot(sub_metering_1~datetime,type="l",xlab="",ylab="Energy sub metering")
	lines(sub_metering_2~datetime,col="red")
	lines(sub_metering_3~datetime,col="blue")
	legend("topright", col=c("black","red","blue"),legend=paste0("Sub_metering_",1:3),lty=1,bty="n")

	plot(global_reactive_power~datetime, type="l", ylab="Global_reactive_power")

})
dev.off()