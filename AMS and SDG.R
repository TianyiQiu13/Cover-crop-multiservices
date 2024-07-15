library(ggplot2)
library(RColorBrewer)
library(ggpmisc)
library(cowplot)
library(dplyr)
library(rstatix)

setwd("D:/Document/Cover crop")
font=theme(axis.title=element_text(size=13),axis.text = element_text(size=12,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12))#11.6inches

a <- read.csv("AMS and SDG-upland.csv")%>%mutate(cropland.type="Upland")
b <- read.csv("AMS and SDG-paddy.csv")%>%mutate(cropland.type="Paddy")
c <- rbind.data.frame(a,b)
c$group <- factor(c$group)
c$cropland.type <- factor(c$cropland.type,levels=c("Upland","Paddy"))

kruskal.test(AMS~group,data=c)

p1 <- ggplot(c, aes(x=SDG.Index.Score, y=AMS,color=cropland.type))+
  geom_point(position=position_jitter(0.17),size=3.6,alpha=0.65)+
  geom_smooth(method = "lm", 
              formula = y ~ poly(x, 1, raw = TRUE),se=F)+
  geom_smooth(color="black", method = "lm", 
              formula = y ~ poly(x, 1, raw = TRUE),se=F)+
  geom_hline(yintercept = 0, color = "gray50", linetype = "dashed") + 
  scale_color_manual(values = c("orange","darkgreen"))+
  scale_x_continuous(breaks = c(55,60,65,70,75,80))+
  scale_y_continuous(limits = c(-15,15))+
  stat_poly_eq(aes(label = paste(..eq.label..,..rr.label..,..p.value.label..,sep="*\", \"*")),
               formula = y ~ poly(x, 1, raw = TRUE), parse = T,label.x = "right",label.y = "top")+
  stat_poly_eq(color="black",aes(label = paste(..eq.label..,..rr.label..,..p.value.label..,sep="*\", \"*")),
               formula = y ~ poly(x, 1, raw = TRUE), parse = T,label.x = "left",label.y = "bottom")+
  theme_cowplot()+
  labs(x="SDG index score",y="Agroecosystem multiservices (%)",color="Cropland type")+font+
  theme(legend.position="top")
p1

p2 <- ggplot(c, aes(x=group, y=AMS,fill=group))+
  geom_boxplot(color="black",notch = F,size=0.7,alpha=0.75)+
  geom_jitter(position=position_jitter(0.25),color="black",size=1.8,alpha=0.65)+
  scale_fill_manual(values=colorRampPalette(brewer.pal(9, 'RdYlBu'))(5))+
  theme_cowplot()+
  labs(x="SDG bundle",y="Agroecosystem multiservices (%)",fill="SDG bundle")+font+
  theme(legend.position="top")
p2

ggdraw()+ 
  draw_plot(p1, x=0, y=0, width = 0.5, height = 1)+
  draw_plot(p2, x=0.5, y=0, width = 0.5, height = 1)+
  draw_label("Kruskal-Wallis P < 0.001",x=0.6,y=0.175,size=12,hjust = 0)+
  draw_plot_label(label=c("a","b"),size = 15,
                  x=c(0,0.5),y=c(1,1))##10.2*5.4 inches

