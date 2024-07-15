library(ggplot2)
library(dplyr)
library(cowplot)


registerDoParallel(20)
setwd("D:/资料/Cover crop")
font=theme(axis.title=element_text(size=12),axis.text= element_text(size=10,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12))#11.6inches

font2=theme(axis.title=element_text(size=13),axis.text= element_text(size=12,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12))#11.6inches
####upland####
yield.bang.upland <- read.csv("yield.upland.perc.country.csv")
yieldbenefit.bang.upland <- read.csv("yield.upland.benefit.country.csv")
SOC.bang.upland <- read.csv("SOC.upland.perc.country.csv")
N2O.bang.upland <- read.csv("N2O.upland.perc.country.csv")
CH4.bang.upland <- read.csv("CH4.upland.perc.country.csv")
MWD.bang.upland <- read.csv("MWD.upland.perc.country.csv")
NGHGB.bang.upland <- read.csv("NGHGB.upland.perc.country.csv")
Erosion.bang.upland <- read.csv("Erosion.upland.perc.country.csv")
AMS.bang.upland <- read.csv("AMS.upland.perc.country.csv")


yield.plot.upland <- ggplot(yield.bang.upland,aes(x=reorder(Group.1, x,decreasing=T),
                                                  y=x))+
  geom_point(size=1.6,color="#e4615d")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#e4615d")+
  #scale_y_discrete(position = 'right')+
  ylab("Yield (%)") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
    theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
          axis.title.x = element_blank())
yield.plot.upland 

SOC.plot.upland <- ggplot(SOC.bang.upland,aes(x=reorder(Group.1, x,decreasing=T),
                                                  y=x))+
  geom_point(size=1.6,color="#fdc58f")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#fdc58f")+
  #scale_y_discrete(position = 'right')+
  ylab(expression(paste(SOC[stock]," (%)",sep=""))) +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
        axis.title.x = element_blank())
SOC.plot.upland 

N2O.plot.upland <- ggplot(N2O.bang.upland,aes(x=reorder(Group.1, x,decreasing=T),
                                              y=x))+
  geom_point(size=1.6,color="#99d9d0")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#99d9d0")+
  #scale_y_discrete(position = 'right')+
  ylab(expression(paste(N[2],"O (%)",sep = ""))) +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
        axis.title.x = element_blank())
N2O.plot.upland 

CH4.plot.upland <- ggplot(CH4.bang.upland,aes(x=reorder(Group.1, x,decreasing=T),
                                              y=x))+
  geom_point(size=1.6,color="#95b2d6")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#95b2d6")+
  #scale_y_discrete(position = 'right')+
  ylab(expression(paste(CH[4]," (%)",sep = ""))) +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
        axis.title.x = element_blank())
CH4.plot.upland 

MWD.plot.upland <- ggplot(MWD.bang.upland,aes(x=reorder(Group.1, x,decreasing=T),
                                              y=x))+
  geom_point(size=1.6,color="#ea9c9d")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#ea9c9d")+
  #scale_y_discrete(position = 'right')+
  ylab("MWD (%)") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
        axis.title.x = element_blank())
MWD.plot.upland

yieldbenefit.plot.upland <- ggplot(yieldbenefit.bang.upland,aes(x=reorder(Group.1, x,decreasing=T),
                                              y=x))+
  geom_point(size=1.6,color="#37b776")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#37b776")+
  #scale_y_discrete(position = 'right')+
  ylab("Crop production (Mg/ha)") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
        axis.title.x = element_blank())
yieldbenefit.plot.upland

NGHGB.plot.upland <- ggplot(NGHGB.bang.upland,aes(x=reorder(Group.1, x,decreasing=T),
                                                                y=x))+
  geom_point(size=1.6,color="#026aad")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#026aad")+
  #scale_y_discrete(position = 'right')+
  ylab("NGHGB (Mg/ha)") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
        axis.title.x = element_blank())
NGHGB.plot.upland

Erosion.plot.upland <- ggplot(Erosion.bang.upland,aes(x=reorder(Group.1, x,decreasing=T),
                                                  y=x))+
  geom_point(size=1.6,color="#eec56b")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#eec56b")+
  #scale_y_discrete(position = 'right')+
  ylab("Erosion control (Mg/ha)") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
        axis.title.x = element_blank())
Erosion.plot.upland



####paddy####
yield.bang.paddy <- read.csv("yield.paddy.perc.country.csv")
yieldbenefit.bang.paddy <- read.csv("yield.paddy.benefit.country.csv")
SOC.bang.paddy <- read.csv("SOC.paddy.perc.country.csv")
N2O.bang.paddy <- read.csv("N2O.paddy.perc.country.csv")
CH4.bang.paddy <- read.csv("CH4.paddy.perc.country.csv")
MWD.bang.paddy <- read.csv("MWD.paddy.perc.country.csv")
NGHGB.bang.paddy <- read.csv("NGHGB.paddy.perc.country.csv")
Erosion.bang.paddy <- read.csv("Erosion.paddy.perc.country.csv")
AMS.bang.paddy <- read.csv("AMS.paddy.perc.country.csv")


yield.plot.paddy <- ggplot(yield.bang.paddy,aes(x=reorder(Group.1, x,decreasing=T),
                                                  y=x))+
  geom_point(size=1.6,color="#e4615d")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#e4615d")+
  #scale_y_discrete(position = 'right')+
  ylab("Yield (%)") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
        axis.title.x = element_blank())
yield.plot.paddy 

SOC.plot.paddy <- ggplot(SOC.bang.paddy,aes(x=reorder(Group.1, x,decreasing=T),
                                              y=x))+
  geom_point(size=1.6,color="#fdc58f")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#fdc58f")+
  #scale_y_discrete(position = 'right')+
  ylab(expression(paste(SOC[stock]," (%)",sep=""))) +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
        axis.title.x = element_blank())
SOC.plot.paddy 

N2O.plot.paddy <- ggplot(N2O.bang.paddy,aes(x=reorder(Group.1, x,decreasing=T),
                                              y=x))+
  geom_point(size=1.6,color="#99d9d0")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#99d9d0")+
  #scale_y_discrete(position = 'right')+
  ylab(expression(paste(N[2],"O (%)",sep = ""))) +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
        axis.title.x = element_blank())
N2O.plot.paddy 

CH4.plot.paddy <- ggplot(CH4.bang.paddy,aes(x=reorder(Group.1, x,decreasing=T),
                                              y=x))+
  geom_point(size=1.6,color="#95b2d6")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#95b2d6")+
  #scale_y_discrete(position = 'right')+
  ylab(expression(paste(CH[4]," (%)",sep = ""))) +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
        axis.title.x = element_blank())
CH4.plot.paddy 

MWD.plot.paddy <- ggplot(MWD.bang.paddy,aes(x=reorder(Group.1, x,decreasing=T),
                                              y=x))+
  geom_point(size=1.6,color="#ea9c9d")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#ea9c9d")+
  #scale_y_discrete(position = 'right')+
  ylab("MWD (%)") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
        axis.title.x = element_blank())
MWD.plot.paddy

yieldbenefit.plot.paddy <- ggplot(yieldbenefit.bang.paddy,aes(x=reorder(Group.1, x,decreasing=T),
                                                                y=x))+
  geom_point(size=1.6,color="#37b776")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#37b776")+
  #scale_y_discrete(position = 'right')+
  ylab("Crop production (Mg/ha)") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
        axis.title.x = element_blank())
yieldbenefit.plot.paddy

NGHGB.plot.paddy <- ggplot(NGHGB.bang.paddy,aes(x=reorder(Group.1, x,decreasing=T),
                                                      y=x))+
  geom_point(size=1.6,color="#026aad")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#026aad")+
  #scale_y_discrete(position = 'right')+
  ylab("NGHGB (Mg/ha)") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
        axis.title.x = element_blank())
NGHGB.plot.paddy

Erosion.plot.paddy <- ggplot(Erosion.bang.paddy,aes(x=reorder(Group.1, x,decreasing=T),
                                                      y=x))+
  geom_point(size=1.6,color="#eec56b")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#eec56b")+
  #scale_y_discrete(position = 'right')+
  ylab("Erosion control (Mg/ha)") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
        axis.title.x = element_blank())
Erosion.plot.paddy

###AMS###
AMS.plot.upland <- ggplot(AMS.bang.upland,aes(x=reorder(Group.1, x,decreasing=T),
                                            y=x))+
  geom_point(size=2,color="#c84629")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#c84629")+
  #scale_y_discrete(position = 'right')+
  ylab("Agroecosystem multiservices (%)") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
        axis.title.x = element_blank())
AMS.plot.upland

AMS.plot.paddy <- ggplot(AMS.bang.paddy,aes(x=reorder(Group.1, x,decreasing=T),
                                                    y=x))+
  geom_point(size=2,color="#c84629")+ 
  geom_segment(aes(x=Group.1,xend=Group.1,
                   y=0,yend=x),color="#c84629")+
  #scale_y_discrete(position = 'right')+
  ylab("Agroecosystem multiservices (%)") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  theme_cowplot()+ 
  theme(legend.position = "none")+font+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust=0.3,colour = "black"),
        axis.title.x = element_blank())
AMS.plot.paddy



bang.perc <- plot_grid( yield.plot.upland+ theme(plot.margin = unit(c(0.1,0,-0.5,0.1), "cm")),
                        yield.plot.paddy+ theme(plot.margin = unit(c(0.1,0,-0.5,0.1), "cm")),
                        SOC.plot.upland+ theme(plot.margin = unit(c(0.1,0,-0.5,0.1), "cm")),
                        SOC.plot.paddy+ theme(plot.margin = unit(c(0.1,0,-0.5,0.1), "cm")),
                        N2O.plot.upland+ theme(plot.margin = unit(c(0.1,0,-0.5,0.1), "cm")),
                        N2O.plot.paddy+ theme(plot.margin = unit(c(0.1,0,-0.5,0.1), "cm")),
                        CH4.plot.upland+ theme(plot.margin = unit(c(0.1,0,-0.5,0.1), "cm")),
                        CH4.plot.paddy+ theme(plot.margin = unit(c(0.1,0,-0.5,0.1), "cm")),
                        MWD.plot.upland+ theme(plot.margin = unit(c(0.1,0,-0.5,0.1), "cm")),
                        MWD.plot.paddy+ theme(plot.margin = unit(c(0.1,0,-0.5,0.1), "cm")),
                        align = 'hv', 
                        axis = "tb",
                         label_size = 15,
                         labels = c("a","b","c","d","e"," f","g","h"," i"," j"),
                         #vjust = -1, 
                         #vjust= 4,
                         nrow = 5,
                         ncol=2
)+ theme(plot.margin = unit(c(0.1,0.1,0.1,0.1), "cm"))
bang.perc##11.6*11.0

bang.actual <- plot_grid(yieldbenefit.plot.upland,
                        yieldbenefit.plot.paddy,
                        NGHGB.plot.upland,
                        NGHGB.plot.paddy,
                        Erosion.plot.upland,
                        Erosion.plot.paddy,
                        align = 'hv', 
                        axis = "tb",
                        label_size = 15,
                        labels = c("a","b","c","d","e"," f"),
                        #vjust = -1, 
                        #vjust= 4,
                        nrow = 3,
                        ncol=2
)
bang.actual##11.6*10.2

bang.AMS <- plot_grid(AMS.plot.upland+ theme(plot.margin = unit(c(0.5,0.5,-0.1,0.5), "cm")),
                         AMS.plot.paddy+ theme(plot.margin = unit(c(0.5,0.5,-0.1,0.5), "cm")),
                         align = 'hv', 
                         axis = "tb",
                         label_size = 15,
                         labels = c("a","b"),
                         #vjust = -1, 
                         #vjust= 4,
                         nrow = 2,
                         ncol=1
)+draw_label("Upland",color = "black",size=16,x=0.825,y=0.95,fontface = "bold")+
  draw_label("Paddy",color = "black",size=16,x=0.825,y=0.45,fontface = "bold")
bang.AMS##8.6*7.8
