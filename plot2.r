dt <- read.table("household_power_consumption.txt",,sep=";",colClasses = c("character","character",
			rep("numeric",7)),header=F,na.strings="?",skip=66637,nrows=24*60*2)
names(dt) <- c("date","time","global_active_power","global_reactive_power","voltage",
			"global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")
dt <- transform(dt, datetime = strptime(paste(date,time),"%d/%m/%Y %H:%M:%S"))

Sys.setlocale("LC_TIME", "USA")


png("plot2.png")
plot(global_active_power~datetime,data= dt,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()