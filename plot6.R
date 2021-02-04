library(ggplot2)
library(dplyr)
#gather the subst of EI which fips is "24510"(Baltimore city's fip)
# or "06037"(LA county's fip)
bltm_LA<- subset(EI, fips == "24510" | fips == "06037")
unique(bltm_LA$fips)

# show the SCC 8-digits code responding to motor vehicle
veh_SCC

#gathet the subset of bltm_LA data responding to motor vehicle
bltm_LA_veh<- subset(bltm_LA, bltm$SCC %in% veh_SCC)

bltm_LA_veh_yr<- bltm_LA_veh %>% group_by(year, fips) %>% 
  summarise(pm2.5=sum(Emissions))
bltm_LA_veh_yr


plot_6<- ggplot(bltm_LA_veh_yr, 
                aes(x=year, y=pm2.5, color =fips)) +
  geom_point()+
  geom_line()+
  ggtitle("Baltimore and Los Angeles Vehicle PM2.5 Emission ") + 
  xlab("Year") + ylab("Vehicle PM2.5 Emission")
  
plot_6 <- plot_6 +theme(legend.position="right")+
  scale_color_discrete(name = "City", 
                      labels = c("Los Ageles", "Baltimore"))
 
plot_6

dev.copy(png, "air_pollution_project/pm2.5_emission/plot6.png",
         width=600, height=500)
dev.off() 
