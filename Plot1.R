##QUESTION:: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##  Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
##  for each of the years 1999, 2002, 2005, and 2008.


##Read in the data
NEI <- readRDS("./Course Project 2/summarySCC_PM25.rds")
SCC <- readRDS("./Course Project 2/Source_Classification_Code.rds")

##Subset the data for the TOTAL PM2.5 emission from all sources for years 1999, 2002, 2005, 2008
subset_totals <- aggregate(Emissions ~ year, NEI, sum)

##Create Plot and save in PNG file
png("Plot1.png", width = 480, height = 480)
barplot(subset_totals$Emissions,
     names.arg = subset_totals$year,    
     xlab = "Year", 
     ylab = "Pm2.5 Emissions", 
     main = "PM2.5 Emissions From All U.S. Sources",
     col = "blue")
dev.off()
