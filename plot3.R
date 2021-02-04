library(dplyr)
library(ggplot2)
str(bltm)
ty_bltm<- bltm %>% group_by(type, year)%>% 
  summarise(total_pm2.5=sum(Emissions))
ty_bltm

plot_3<- ggplot(ty_bltm, aes(x=year, y=total_pm2.5, 
                             shape=type, color=type)) +
  geom_point()+
  geom_line()+
  ggtitle("Total Baltimore PM2.5 Emission by Year and Source Type") + 
  xlab("year") + ylab("Total PM2.5")+
  theme(legend.position="bottom")
plot_3
dev.copy(png, "air_pollution_project/pm2.5_emission/plot3.png",
         width=600, height=500)
dev.off() 
