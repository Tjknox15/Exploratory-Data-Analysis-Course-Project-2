##QUESTION:: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
##  from 1999 to 2008? Use the base plotting system to make a plot answering this question.

##Read in the data
NEI <- readRDS("./Course Project 2/summarySCC_PM25.rds")
SCC <- readRDS("./Course Project 2/Source_Classification_Code.rds")

##Subset data to only include emissions from Baltimore City (fips == "24510") from 1999 to 2008
bmore_data <- NEI[NEI$fips == "24510", ]
bmoreFinal <- aggregate(Emissions ~ year, bmore_data, sum)

##Create Plot and save in PNG file
png("Plot2.png", width = 480, height = 480)
barplot(bmoreFinal$Emissions,
        names.arg = bmoreFinal$year,    
        xlab = "Year", 
        ylab = "Pm2.5 Emissions", 
        main = "PM2.5 Emissions In Baltimore City, MD",
        col = "blue")
dev.off()