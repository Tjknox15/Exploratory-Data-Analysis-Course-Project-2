##QUESTION:: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
##  sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time 
##  in motor vehicle emissions?

##Read in the data
NEI <- readRDS("./Course Project 2/summarySCC_PM25.rds")
SCC <- readRDS("./Course Project 2/Source_Classification_Code.rds")

##Merge the two data sets
NEISCC <- merge(NEI, SCC, by = "SCC")

##Subset data for both Baltimore City (fips == 24510) and LA County (fips == 06037)
##Also subset for motor vehicle emissions only
subset_data <- NEISCC[(NEISCC$fips %in% c("24510","06037")) & (NEISCC$type == "ON-ROAD"), ]

##Aggregate subset_data by year and fips
aggregateData <- aggregate(Emissions ~ year + fips, subset_data, sum)

##Create plot and save in PNG file
library(ggplot2)

png("Plot6.png", width = 480, height = 480)
ggplot(aggregateData, aes(x = factor(year), y = Emissions, fill = fips)) + 
  facet_grid(.~fips) + 
  geom_bar(stat = "identity", position = "dodge") + 
  xlab("Year") +
  ylab("PM2.5 Emissions") +
  ggtitle("Motor Vehicle Emissions from 1999-2008") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_fill_discrete(labels = c("Los Angeles County", "Baltimore City"))
dev.off()










