## Load Data
setwd("C:/Users/HP/Documents/data/Exploratory Data Analysis")
ElecPowerConsum <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

## Subset, remove records without values (?)
ElecPowerConsumRemoveNA <- ElecPowerConsum[ElecPowerConsum$Global_active_power != "?",]

## Convert to Data, Time and Numeric
ElecPowerConsumRemoveNA$Date <- as.Date(ElecPowerConsumRemoveNA$Date, format="%d/%m/%Y")
ElecPowerConsumRemoveNA$Time <- strptime(ElecPowerConsumRemoveNA$Time, "%H:%M:%S")
ElecPowerConsumRemoveNA$Global_active_power <- as.numeric(as.character(ElecPowerConsumRemoveNA$Global_active_power))

## Subset to February 1st and 2nd 2007
SubsetElecPowerConsum <- ElecPowerConsumRemoveNA[ElecPowerConsumRemoveNA$Date >= "2007-02-01" & ElecPowerConsumRemoveNA$Date <= "2007-02-02",]

## Create Histogram
hist(SubsetElecPowerConsum$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

## Create Ping File
dev.copy(png, file = "plot1.png")
dev.off()
