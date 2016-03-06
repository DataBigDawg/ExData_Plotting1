plot4 <- function() {
    
    ## set the working folder
    setwd("c:/users/frase/Documents/GitHub/ExData_Plotting1")
    
    ## read the file
    plot4fl <- read.table("household_power_consumption.txt",sep=";",na.strings="?",header = TRUE,stringsAsFactors = FALSE)
    ## findout someinfo onthe file
    dim(plot4fl)
    summary(plot4fl)
    str(plot4fl)
    
    ## create new column for date and time
    plot4fl$dttime <- paste(plot4fl$Dat,plot4fl$Time, sep=" ")
    plot4fl$dttime <- strptime(plot4fl$dttime, "%d/%m/%Y %H:%M:%S")
    
    ## convert the Date column to a date format
    plot4fl$Date  <- as.Date(plot4fl$Date,format="%d/%m/%Y")
    #plot4fl$Time  <- as.Date(plot4fl$Time,format="%H:%M:%S")
    
    ## subset the file to include only dates 2007-02-01 and 2007-02-02
    ## not sure this is the best way
    d1 <- as.Date("2007-02-01")
    d2 <- as.Date("2007-02-02")
    plot4sub <- plot4fl[plot4fl$Date >=d1 & plot4fl$Date <= d2,]
    
    ## windows()
    # dev.new()
    
    png("plot4.png",width=480, height = 480, units = "px")
    
    par(mfrow=c(2,2))
    
    ## start the top left plot
    plot(plot4sub$dttime,plot4sub$Global_active_power,type="l",xlab="",ylab="Global Active Power")
    
    ## start the top right plot
    plot(plot4sub$dttime,plot4sub$Voltage,type="l",xlab="datetime",ylab="Voltage")

    ## start the bottom left plot
    plot(plot4sub$dttime,plot4sub$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")   ## start off with a blank plot
    lines(plot4sub$dttime,plot4sub$Sub_metering_1,col="black")
    lines(plot4sub$dttime,plot4sub$Sub_metering_2,col="red")
    lines(plot4sub$dttime,plot4sub$Sub_metering_3,col="blue")
    
    ## add the legend
    legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_Metering_2","Sub_Metering_3"),lty=c(1,1,1),lwd=2)
   
    ## start the bottom right plot
    plot(plot4sub$dttime,plot4sub$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
    
    ## create the png file
    #dev.copy(png,"plot4.png",width=480, height = 480, units = "px")
    
    ## clean up
    dev.off()
    
}