setwd("C:/Users/wenju/OneDrive/Documents/R/Exploratory_data/week4")
getwd()
EI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")
head(EI)
str(SCC)
tEI <- with (EI, tapply(Emissions, year, sum, na.rm = TRUE))
plot(names(tEI), tEI, pch =1, type ="b", col= "red",
     ylab = "total US PM2.5 Emission", xlab= "year")

dev.copy(png, "air_pollution_project/pm2.5_emission/plot1.png",
         width=600, height=500)
dev.off()  

