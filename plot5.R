library(ggplot2)
library(dplyr)
#gather the subst of EI which fips is "24510"(Baltimore city's fip)
bltm<- subset(EI, fips == "24510")
# get the index in SCC table responding to motor vehicle 
veh0<- grep("vehicle", SCC$EI.Sector, ignore.case = TRUE)
veh1<- grep("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
veh2<- grep("vehicle", SCC$SCC.Level.Three, ignore.case = TRUE)
veh3<- grep("vehicle", SCC$SCC.Level.Four, ignore.case = TRUE)
#merge the veh0-3 without duplicate
veh<- unique(c(veh0, veh1, veh2, veh3))
veh_SCC<- SCC$SCC[veh]

bltm_veh<- subset(bltm, bltm$SCC %in% veh_SCC)
head(bltm_veh)
bltm_veh_yr<- bltm_veh %>% group_by(year) %>% 
  summarise(pm2.5=sum(Emissions))
bltm_veh_yr$year<-as.character(bltm_veh_yr$year)
head(bltm_veh_yr)

plot_5<- ggplot(data =bltm_veh_yr, 
                aes(x= year, y= pm2.5))+
  geom_bar(stat="identity", fill="steelblue")+
  ggtitle("Baltimore Vehicle PM2.5 Emission by Year") + 
  xlab("Year") + ylab("Total PM2.5 Emission")

plot_5
dev.copy(png, "air_pollution_project/pm2.5_emission/plot5.png",
         width=600, height=500)
dev.off() 

