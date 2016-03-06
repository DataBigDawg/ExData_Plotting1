plot1 <- function() {
    
    ## set the working folder
    setwd("c:/users/frase/Documents/GitHub/ExData_Plotting1")
    
    ## read the file
    plotfl <- read.table("household_power_consumption.txt",sep=";",na.strings="?",header = TRUE,stringsAsFactors = FALSE)
    ## findout someinfo onthe file
    dim(plotfl)
    summary(plotfl)
    str(plotfl)
    
    ## convert the Date column to a date format
    plotfl$Date  <- as.Date(plotfl$Date,format="%d/%m/%Y")
    #plot2fl$Time  <- as.Date(plot2fl$Time,format="%H:%M:%S")
    

    ## subset the file to include only dates 2007-02-01 and 2007-02-02
    ## not sure this is the best way
    d1 <- as.Date("2007-02-01")
    d2 <- as.Date("2007-02-02")
    plotsub <- plotfl[plotfl$Date >=d1 & plotfl$Date <= d2,]
    
    ## windows()
    # dev.new()
    png("plot1.png",width=480, height = 480, units = "px")
    
    ## start the plot
    hist(plotsub$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")    

    #dev.copy(png,"plot1.png",width=480, height = 480, units = "px")
     
    dev.off()
    
    
   
}