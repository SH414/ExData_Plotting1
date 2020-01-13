# Download data using the link, and save in working directory.
# Read data into R and assign descriptive column names.
# Then create subset of the data to include only data from 1/2/2007 and 2/2/2007.

Power_Consumption <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(Power_Consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
Power_Consumption_Subset <- subset(Power_Consumption,Power_Consumption$Date=="1/2/2007" | Power_Consumption$Date=="2/2/2007")

#Plot 1
# Plot histogram and set axis labels as in assignment question. Then add title.

png("plot1.png", width=480, height=480)

hist(as.numeric(as.character(Power_Consumption_Subset$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

title(main="Global Active Power")

dev.off()