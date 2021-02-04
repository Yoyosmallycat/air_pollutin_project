bltm<- subset(EI, fips == "24510")
head(bltm)
mean(is.na(bltm$Emissions))
annual_bltm<- with(bltm, tapply(Emissions, year, sum, na.rm= TRUE))
annual_bltm
plot(names(annual_bltm),annual_bltm, pch =5, type ="b", col= "green",
     main ="total PM2.5 emission in Baltimore", 
     ylab = "total Baltimore PM2.5 Emission", xlab= "year")

dev.copy(png, "air_pollution_project/pm2.5_emission/plot2.png",
         width=600, height=500)
dev.off() 

