## Load Data
setwd("C:/Users/HP/Documents/data/Exploratory Data Analysis")
ElecPowerConsum <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

## Subset, remove records without values (?)
ElecPowerConsumRemoveNA <- ElecPowerConsum[ElecPowerConsum$Global_active_power != "?",]

## Create Date_Time variable
ElecPowerConsumRemoveNA$Date_Time <- with (ElecPowerConsumRemoveNA, paste(as.character(Date), as.character(Time)))

## Create Date - Time Field
ElecPowerConsumRemoveNA$Date_Time <- with(ElecPowerConsumRemoveNA, (paste(Date, Time)))

## Convert to Data, Time and Numeric
ElecPowerConsumRemoveNA$Date <- as.Date(ElecPowerConsumRemoveNA$Date, format = "%d/%m/%Y")
ElecPowerConsumRemoveNA$Global_active_power <- as.numeric(as.character(ElecPowerConsumRemoveNA$Global_active_power))
ElecPowerConsumRemoveNA$Sub_metering_1 <- as.numeric(as.character(ElecPowerConsumRemoveNA$Sub_metering_1))
ElecPowerConsumRemoveNA$Sub_metering_2 <- as.numeric(as.character(ElecPowerConsumRemoveNA$Sub_metering_2))
ElecPowerConsumRemoveNA$Sub_metering_3 <- as.numeric(as.character(ElecPowerConsumRemoveNA$Sub_metering_3))
ElecPowerConsumRemoveNA$Date_Time <- strptime(ElecPowerConsumRemoveNA$Date_Time, "%d/%m/%Y %H:%M:%S") 

## Subset to February 1st and 2nd 2007
SubsetElecPowerConsum <- ElecPowerConsumRemoveNA[ElecPowerConsumRemoveNA$Date >= "2007-02-01" & ElecPowerConsumRemoveNA$Date <= "2007-02-02",]

## Create Histogram
plot(SubsetElecPowerConsum$Date_Time, SubsetElecPowerConsum$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(SubsetElecPowerConsum$Date_Time, SubsetElecPowerConsum$Sub_metering_2, col="red")
lines(SubsetElecPowerConsum$Date_Time, SubsetElecPowerConsum$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black","red","blue"))
    

## Create Ping File
dev.copy(png, file = "plot3.png")
dev.off()
