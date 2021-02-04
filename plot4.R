head(SCC)
#get a vector of index which containing "coal" in SCC$Short.Name
coal <- grep("coal", SCC$Short.Name, ignore.case = TRUE)
coal_SCC <- SCC$SCC[coal]
coal_EI<- subset(EI, EI$SCC %in% coal_SCC)
head(coal_EI)
coal_EI_year <- with (coal_EI, tapply(Emissions, year, sum, na.rm = TRUE))
coal_EI_year
plot(names(coal_EI_year), coal_EI_year,
     pch= 2, type ="b", col= "orange", lwd = 3,
     main = "Emission of PM2.5 from Coal combustion-relatated sources",
     ylab = "US PM2.5 Emission from coal combustion", xlab= "year")
dev.copy(png, "air_pollution_project/pm2.5_emission/plot4.png",
         width=600, height=500)
dev.off() 

