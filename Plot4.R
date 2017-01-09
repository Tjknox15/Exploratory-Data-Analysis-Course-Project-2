##QUESTION:: Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

##Read in the data
NEI <- readRDS("./Course Project 2/summarySCC_PM25.rds")
SCC <- readRDS("./Course Project 2/Source_Classification_Code.rds")

##Merge the two data sets
NEISCC <- merge(NEI, SCC, by = "SCC")

##Subset for those rows with emissions from coal combustion-related sources
##  Then aggregate by year

coalFilter <- grepl("Fuel Comb.*Coal", NEISCC$EI.Sector)
coalData <- NEISCC[coalFilter, ]
aggregateData <- aggregate(Emissions ~ year, coalData, sum)

##Create Plot and save in PNG file
Library(ggplot2)

png("Plot4.png", width = 480, height = 480)
ggplot(aggregateData, aes(x = year, y = Emissions, fill = year)) +
    geom_bar(stat = "identity") +
    xlab("Year") + 
    ylab("Pm2.5 Emissions") + 
    ggtitle("Coal Combustion Emissions in the U.S. from 1999-2008")
dev.off()
  

