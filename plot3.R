# Download data using the link, and save in working directory.
# Read data into R and assign descriptive column names.
# Then create subset of the data to include only data from 1/2/2007 and 2/2/2007.

Power_Consumption <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(Power_Consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
Power_Consumption_Subset <- subset(Power_Consumption,Power_Consumption$Date=="1/2/2007" | Power_Consumption$Date=="2/2/2007")

#Plot 3
# Coerce the date and time variables into useable formats using as.Date() and strptime()

png("plot3.png", width=480, height=480)

Power_Consumption_Subset$Date <- as.Date(Power_Consumption_Subset$Date, format="%d/%m/%Y")
Power_Consumption_Subset$Time <- strptime(Power_Consumption_Subset$Time, format="%H:%M:%S")

# Change format to days

Power_Consumption_Subset[1:1440,"Time"] <- format(Power_Consumption_Subset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
Power_Consumption_Subset[1441:2880,"Time"] <- format(Power_Consumption_Subset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Plot data and add various features to graphic as in assignment question. Then add title.

plot(Power_Consumption_Subset$Time,Power_Consumption_Subset$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(Power_Consumption_Subset,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(Power_Consumption_Subset,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(Power_Consumption_Subset,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

title(main="Energy sub-metering")

dev.off()