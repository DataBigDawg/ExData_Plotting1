plot2 <- function() {
    
    ## set the working folder
    setwd("c:/users/frase/Documents/GitHub/ExData_Plotting1")
    
    ## read the file
    plot2fl <- read.table("household_power_consumption.txt",sep=";",na.strings="?",header = TRUE,stringsAsFactors = FALSE)
    ## findout someinfo onthe file
    dim(plot2fl)
    summary(plot2fl)
    str(plot2fl)
    
     ## create new column for date and time
    plot2fl$dttime <- paste(plot2fl$Dat,plot2fl$Time, sep=" ")
    plot2fl$dttime <- strptime(plot2fl$dttime, "%d/%m/%Y %H:%M:%S")
    
    ## convert the Date column to a date format
    plot2fl$Date  <- as.Date(plot2fl$Date,format="%d/%m/%Y")
    #plot2fl$Time  <- as.Date(plot2fl$Time,format="%H:%M:%S")
     
    ## subset the file to include only dates 2007-02-01 and 2007-02-02
    ## not sure this is the best way
    d1 <- as.Date("2007-02-01")
    d2 <- as.Date("2007-02-02")
    plot2sub <- plot2fl[plot2fl$Date >=d1 & plot2fl$Date <= d2,]
    
    ## windows()
    # dev.new()
    png("plot2.png",width=480, height = 480, units = "px")
    
    ## start the plot
    plot(plot2sub$dttime,plot2sub$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
    
    ## dev.copy(png,"plot2.png",width=480, height = 480, units = "px")
    
    dev.off()
    
}