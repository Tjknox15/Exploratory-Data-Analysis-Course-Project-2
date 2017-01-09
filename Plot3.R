##QUESTION:: Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
##  which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
##  Which have seen increases in emissions from 1999-2008? 
##  Use the ggplot2 plotting system to make a plot answer this question.

##Read in the data
NEI <- readRDS("./Course Project 2/summarySCC_PM25.rds")
SCC <- readRDS("./Course Project 2/Source_Classification_Code.rds")

##Subset data to only include emissions from Baltimore City (fips == "24510") from 1999 to 2008
##  Also total the data by TYPE and YEAR

bmore_data <- NEI[NEI$fips == "24510", ]
bmoreFinal <- aggregate(Emissions ~ year + type, bmore_data, sum)

##Create Plot and save in PNG file
library(ggplot2)

png("Plot3.png", width = 480, height = 480)
qplot(year, Emissions, data = bmoreFinal, color = type, geom = "line",  
  main = "PM2.5 Emissions in Baltimore City, MD by each Source Type", 
  xlab = "Year", 
  ylab = "Pm2.5 Emissions"
  )
dev.off()