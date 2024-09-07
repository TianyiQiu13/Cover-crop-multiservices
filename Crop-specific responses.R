library(ggplot2)
library(metafor)
library(agricolae)
library(readxl)

setwd("D:/Document/Cover crop")
font=theme(axis.title=element_text(size=13),axis.text = element_text(size=12,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12),plot.subtitle = element_text(size=13))#11.6inches


b <- read.csv("Crop responses.csv")
b$type <- factor(b$type,levels = c("Wheat","Maize","Rice","Soybean","Sorghum","Others"))
b$variable <- factor(b$variable,levels=c("Yield","SOC","N2O","CH4","MWD"),
                     labels=c("Yield",expression(SOC[stock]),
                              expression(N[2]*O),expression(CH[4]),"MWD"))

ggplot(b)+ 
  geom_point(aes(x=type, y=mean, col=variable,shape=sig),stat="identity",size=3.6)+ 
  geom_errorbar(aes(x=type,ymin=CI1, ymax=CI2, col=variable), width=0.2, size=0.5)+ 
  facet_wrap(~variable,nrow = 1,scales = "free_x",labeller = label_parsed)+
  scale_shape_manual(values = c(16,21))+
  geom_text(aes(label=n, x=type, y=CI2+0.1,hjust=0), col="black", size=3.6)+ 
  coord_flip()+ scale_x_discrete(limits = rev(levels(b$type)))+ 
  theme_bw()+ theme(panel.background = element_blank())+
  scale_colour_manual(values=c("#e4615d","#fdc58f","#99d9d0","#95b2d6","#ea9c9d")) +
  theme(legend.position="none")+ 
  geom_hline(aes(yintercept=0),linetype="dashed",colour="black")+font+ 
  ylab("Crop-specific CC effect on agroecosystem services (%)")+
  theme(axis.title.y = element_blank(),legend.position = "none",
        legend.background = element_blank(),legend.key = element_blank(),
        legend.box = "horizontal", panel.grid = element_blank(),
        panel.border = element_rect(color = "black", size = 0.75),
        strip.background = element_rect(color = "black", size = 0.75))#11.6*5.4
