setwd("~/a_MOOC/Coursera classes/Exploratory Data Analysis")
# Plot 2
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c(Date = "character", Time = "character", 
                Global_active_power = "numeric", Global_reactive_power = "numeric", Voltage = "numeric", Global_intensity = "numeric", 
                Sub_metering_1 = "numeric", Sub_metering_2 = "numeric", Sub_metering_3 = "numeric"), na.strings = "?")
#Converting character vector into date vector
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
#Subsetting the dataset
df1 <- subset(df, df$Date >= "2007-02-01" & df$Date < "2007-02-03")
#pasting Date and time
df1 <- transform(df1, datetime = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
#creating line plot for plot2

plot2 <- function() {
    plot(df1$datetime, df1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    dev.copy(png, filename = "plot2.png", width = 480, height = 480)
    cat("plot2.png", getwd())
    dev.off()
}
plot2()

