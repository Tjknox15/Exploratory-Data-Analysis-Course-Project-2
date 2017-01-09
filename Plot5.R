##QUESTION:: How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

##Read in the data
NEI <- readRDS("./Course Project 2/summarySCC_PM25.rds")
SCC <- readRDS("./Course Project 2/Source_Classification_Code.rds")

##Merge the two data sets
NEISCC <- merge(NEI, SCC, by = "SCC")

##Subset for rows with emissions from motor vehicle sources from 1999-2008 in Baltimore City
bmore_vehicle_data <- NEISCC[(NEISCC$fips == "24510") & (NEISCC$type == "ON-ROAD"), ]

##Aggregate the data by year
aggregateData <- aggregate(Emissions ~ year, bmore_vehicle_data, sum)

##Create Plot and save in PNG file
library(ggplot2)

png("Plot5.png", width = 480, height = 480)
ggplot(aggregateData, aes(x = factor(year), y = Emissions, fill = year, label = round(Emissions,3))) + 
  geom_bar(stat = "identity") + 
  geom_label(aes(fill = year), colour = "white", fontface = "bold") + 
  xlab("Year") +
  ylab("PM2.5 Emissions") +
  ggtitle("Motor Vehicle Emissions in Baltimore City") + 
  theme(plot.title = element_text(hjust = 0.5))
dev.off()