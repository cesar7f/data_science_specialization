
require(data.table)

if(!exists("df_power")){
  zip_file  <- "exdata-data-household_power_consumption.zip"
  text_file <- "household_power_consumption.txt"
  colClasses <- c("character","character",rep("numeric",7)) 
  df_power <- read.csv(unz(zip_file, text_file), header = TRUE, sep = ";", na.strings="?", colClasses=colClasses)
  df_power$Date = as.Date(df_power$Date, "%d/%m/%Y")
  df_power <- df_power[df_power$Date >= as.Date("2007/02/01") & df_power$Date <= as.Date("2007/02/02"),]
}


title_label = ""
x_label = ""
y_label = "Global Active Power (kilowatts)"

with(df_power, 
     plot(1:length(Date), Global_active_power, type="l", 
          xlab=x_label,ylab=y_label,xaxt="n"))
          
axis(1,at=c(0,length(df_power$Date)/2,length(df_power$Date)),labels=c("Thu","Fri","Sat"))



dev.copy(png,"plot2.png",width=480,height=480)
dev.off()

