plot3 <- function() {
    
    ## set the working folder
    setwd("c:/users/frase/Documents/GitHub/ExData_Plotting1")
    
    ## read the file
    plot3fl <- read.table("household_power_consumption.txt",sep=";",na.strings="?",header = TRUE,stringsAsFactors = FALSE)
    ## findout someinfo onthe file
    dim(plot3fl)
    summary(plot3fl)
    str(plot3fl)
    
    ## create new column for date and time
    plot3fl$dttime <- paste(plot3fl$Dat,plot3fl$Time, sep=" ")
    plot3fl$dttime <- strptime(plot3fl$dttime, "%d/%m/%Y %H:%M:%S")
    
    ## convert the Date column to a date format
    plot3fl$Date  <- as.Date(plot3fl$Date,format="%d/%m/%Y")
    #plot3fl$Time  <- as.Date(plot3fl$Time,format="%H:%M:%S")
    
    ## subset the file to include only dates 2007-02-01 and 2007-02-02
    ## not sure this is the best way
    d1 <- as.Date("2007-02-01")
    d2 <- as.Date("2007-02-02")
    plot3sub <- plot3fl[plot3fl$Date >=d1 & plot3fl$Date <= d2,]
    
    ## windows()
    # dev.new()

    png("plot3.png",width=480, height = 480, units = "px")
    
    ## start the plot
    plot(plot3sub$dttime,plot3sub$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")   ## start off with a blank plot
    lines(plot3sub$dttime,plot3sub$Sub_metering_1,col="black")
    lines(plot3sub$dttime,plot3sub$Sub_metering_2,col="red")
    lines(plot3sub$dttime,plot3sub$Sub_metering_3,col="blue")
    
    ## add the legend
    legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_Metering_2","Sub_Metering_3"),lty=c(1,1,1),lwd=2)
    
    ## create the png file
    #dev.copy(png,"plot3.png",width=480, height = 480, units = "px")
    
    ## clean up
    dev.off()
    
}