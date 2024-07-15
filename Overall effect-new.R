library(ggplot2)
library(cowplot)
library(dplyr)
library(tidyverse)
library(grid)
library(ggpmisc)

setwd("D:/Document/Cover crop")
font=theme(axis.title=element_text(size=13),axis.text = element_text(size=12,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12))#11.6inches

dat <- read.csv("F2-plot.csv")
dat$variable <- factor(dat$variable,levels=c("Yield","SOC","N2O","CH4","MWD"))

###Fig.a###
Yield <- read.csv("OverallnRR-Yield.csv")
SOC <- read.csv("OverallnRR-SOC.csv")
N2O <- read.csv("OverallnRR-N2O.csv")
CH4 <- read.csv("OverallnRR-CH4.csv")
MWD <- read.csv("OverallnRR-MWD.csv")
Yield$type <- "Yield"
SOC$type <- "SOC"
N2O$type <- "N2O"
CH4$type <- "CH4"
MWD$type <- "MWD"
a1 <- rbind.data.frame(Yield,SOC,N2O,CH4,MWD)
write.csv(a1,"OverallnRR-total.csv")
a2 <- dat[dat$type=="total",]
write.csv(a2,"Overall effect-total.csv")

a <- read.csv("Overall effect-total.csv")
a$type <- factor(a$type,levels = c("Yield","SOC","N2O","CH4","MWD"))

p1 <- ggplot(a)+
  geom_point(aes(x=sort,y=mean,color=type),alpha=0.08,size=0.5)+
  geom_errorbar(aes(x=sort,ymin=CI1,ymax=CI2, col=type), width=0, size=0.5,alpha=0.08)+
  geom_errorbar(aes(x=sort,ymin=low,ymax=upper, col=type), width=2, size=2)+
  geom_point(aes(x=sort,y=mean2,color=type),size=4.4,shape=18)+
  geom_hline(aes(yintercept=0),linetype="dashed",colour="black")+
  facet_wrap(~type,nrow = 1,scales = "free_x")+
  scale_color_manual(values = c("#e4615d","#fdc58f","#99d9d0","#95b2d6","#ea9c9d"))+
  scale_y_continuous(limits = c(-1.8,1.5),breaks = c(-2,-1,0,1,2))+
  ylab(expression(paste(Ln,italic(RR),"s",sep="")))+
  geom_text(aes(label=n, x=sort-3, y=-1.5,hjust=0.4), col="black", size=3.8)+  ##添加数据量
  geom_text(aes(label=sig, x=sort, y=1,hjust=0.2), col="black", size=4)+
  geom_text(aes(label=label, x=sort+5, y=mean2+0.2,hjust=0.2), col="black", size=3.8)+
  theme_classic()+font+
  theme(panel.grid = element_blank(),legend.position = "none")+
  theme(axis.title.x = element_blank(),axis.text.x = element_blank(),axis.line.x = element_blank(),
        axis.ticks.x = element_blank(),strip.text = element_blank(),strip.background = element_blank())
p1

###Fig.b###
b <- dat[dat$type!="total",]
b$type <- factor(b$type,levels = c("legume","nonlegume","mixture","incorporated","surface","removed",
                                   "shortterm","longterm"),
                            labels=c("Legume","Non-legume","Mixture","Incorporated","Surface","Removed",
                                     "<5 yrs","≥5 yrs"))
b$type2 <- factor(b$type2,levels = c("type","application","duration"),
                  labels = c("CC type","Residue management","Duration"))
b$variable <- factor(b$variable,levels=c("Yield","SOC","N2O","CH4","MWD"),
                      labels=c("Yield",expression(SOC[stock]),
                                          expression(N[2]*O),expression(CH[4]),"MWD"))

p2 <- ggplot(b)+ 
  geom_vline(xintercept = 2.5,linetype="solid",color="black")+
  geom_vline(xintercept = 5.5,linetype="solid",color="black")+
  geom_rect(xmin=0,xmax=2.5, ymin =-100,ymax = 200,fill = alpha("#ededed", 0.05))+
  geom_rect(xmin=5.5,xmax=10, ymin =-100,ymax = 200,fill = alpha("#ededed", 0.05))+
  geom_point(aes(x=type, y=mean, col=variable,shape=sig),stat="identity",size=3.6)+ ##画数据点
  geom_errorbar(aes(x=type,ymin=CI1, ymax=CI2, col=variable), width=0.2, size=0.5)+ ##画95%CI
  facet_wrap(~variable,nrow = 1,scales = "free_x",labeller = label_parsed)+
  scale_shape_manual(values = c(16,21))+
  geom_text(aes(label=n, x=type, y=CI2+0.1,hjust=0), col="black", size=3.6)+  ##添加数据量
  geom_text(aes(label=n2, x=type, y=mean+0.7,hjust=0), col="black", size=3.6)+  ##添加数据量
  coord_flip()+ scale_x_discrete(limits = rev(levels(b$type)))+  ##转换x-y，变量排序
  theme_bw()+ theme(panel.background = element_blank())+ ##格式
  scale_colour_manual(values=c("#e4615d","#fdc58f","#99d9d0","#95b2d6","#ea9c9d")) +
  theme(legend.position="none")+  ##格式
  #scale_colour_manual(values=c("#e47b79","#a9c3e0"))   ##格式
  geom_hline(aes(yintercept=0),linetype="dashed",colour="black")+font+ ##在0画虚线
  theme(panel.grid = element_blank())+
  ylab("CC effect on agroecosystem services (%)")+
  theme(axis.title.y = element_blank())
p2

###Fig.c###
c <- read.csv("LnRR-Diversity.csv")
c$variable <- factor(c$variable,levels = c("Yield","SOC","N2O","CH4","MWD"))
c1 <- c[c$variable=="Yield",]
p3 <- ggplot(c1)+
  geom_point(aes(richness,yi, size = Weight), color="#e4615d",alpha=0.2) +
  geom_smooth(aes(richness,yi, weight = Weight), method = "lm", 
              formula = y ~ poly(x, 2, raw = TRUE), color = "red",se=F)+
  geom_hline(yintercept = 0, color = "gray50", linetype = "dashed") + 
  scale_size_continuous(range=c(1,3.6))+
  scale_x_continuous(breaks = c(0,2,4,6,8,10,12))+
  #scale_y_continuous(limits = c(-1.5,1.5))+
  stat_poly_eq(aes(richness,yi,
                             label = paste(..rr.label..,..p.value.label..,sep="*\", \"*")),
               formula = y ~ poly(x, 2, raw = TRUE), parse = T,label.x = "right",label.y = "bottom")+ 
  theme_test()+
  xlab(" ")+theme(legend.position = "none")+
  ylab(expression(paste(Ln,italic(RR)," of yield",sep="")))+font
p3

c2 <- c[c$variable=="SOC",]
p4 <- ggplot(c2)+
  geom_point(aes(richness,yi, size = Weight), color="#fdc58f",alpha=0.2) +
  geom_smooth(aes(richness,yi, weight = Weight), method = "lm", 
              formula = y ~ poly(x, 1, raw = TRUE), color = "red",se=F)+
  geom_hline(yintercept = 0, color = "gray50", linetype = "dashed") + 
  scale_size_continuous(range=c(1,3.6))+
  scale_x_continuous(breaks = c(0,2,4,6,8,10,12))+
  scale_y_continuous(limits = c(-1.5,1.5))+
  stat_poly_eq(aes(richness,yi,
                             label = paste(..rr.label..,..p.value.label..,sep="*\", \"*")),
               formula = y ~ poly(x, 1, raw = TRUE), parse = T,label.x = "right",label.y = "bottom")+ 
  theme_test()+
  xlab(" ")+theme(legend.position = "none")+
  ylab(expression(paste(Ln,italic(RR)," of ",SOC[stock]," (%)",sep="")))+font
p4

c3 <- c[c$variable=="N2O",]
p5 <- ggplot(c3)+
  geom_point(aes(richness,yi, size = Weight), color="#99d9d0",alpha=0.2) +
  geom_smooth(aes(richness,yi, weight = Weight), method = "lm", 
              formula = y ~ poly(x, 2, raw = TRUE), color = "red",se=F)+
  geom_hline(yintercept = 0, color = "gray50", linetype = "dashed") + 
  scale_size_continuous(range=c(1,3.6))+
  scale_x_continuous(breaks = c(0,2,4,6,8,10,12))+
  #scale_y_continuous(limits = c(-1,1.5))+
  stat_poly_eq(aes(richness,yi,
                             label = paste(..rr.label..,..p.value.label..,sep="*\", \"*")),
               formula = y ~ poly(x, 2, raw = TRUE), parse = T,label.x = "right",label.y = "bottom")+ 
  theme_test()+
  xlab("CC diversity")+theme(legend.position = "none")+
  ylab(expression(paste(Ln,italic(RR)," of ",N[2]*O," (%)",sep="")))+font
p5

c4 <- c[c$variable=="CH4",]
p6 <- ggplot(c4)+
  geom_point(aes(richness,yi, size = Weight), color="#95b2d6",alpha=0.2) +
  geom_smooth(aes(richness,yi, weight = Weight), method = "lm", 
              formula = y ~ poly(x, 2, raw = TRUE), color = "red",se=F)+
  geom_hline(yintercept = 0, color = "gray50", linetype = "dashed") + 
  scale_size_continuous(range=c(1,3.6))+
  scale_x_continuous(breaks = c(0,2,4,6,8,10,12))+
  #scale_y_continuous(limits = c(-1,1.5))+
  stat_poly_eq(aes(richness,yi,
                             label = paste(..rr.label..,..p.value.label..,sep="*\", \"*")),
               formula = y ~ poly(x, 2, raw = TRUE), parse = T,label.x = "right",label.y = "bottom")+ 
  theme_test()+
  xlab(" ")+theme(legend.position = "none")+
  ylab(expression(paste(Ln,italic(RR)," of ",CH[4]," (%)",sep="")))+font
p6

c5 <- c[c$variable=="MWD",]
p7 <- ggplot(c5)+
  geom_point(aes(richness,yi, size = Weight), color="#ea9c9d",alpha=0.2) +
  geom_hline(yintercept = 0, color = "gray50", linetype = "dashed") + 
  scale_size_continuous(range=c(1,3.6))+
  scale_x_continuous(breaks = c(0,2,4,6,8,10,12))+
  #scale_y_continuous(limits = c(-1,1.5))+
  stat_poly_eq(aes(richness,yi,
                             label = paste(..p.value.label..,sep="*\", \"*")),
               formula = y ~ poly(x, 2, raw = TRUE), parse = T,label.x = "right",label.y = "bottom")+ 
  theme_test()+
  xlab(" ")+theme(legend.position = "none")+
  ylab(expression(paste(Ln,italic(RR)," of MWD",sep="")))+font
p7

p8 <- ggdraw()+ 
  draw_plot(p3, x=0, y=0, width = 0.2, height = 1)+
  draw_plot(p4, x=0.2, y=0, width = 0.2, height = 1)+
  draw_plot(p5, x=0.4, y=0, width = 0.2, height = 1)+
  draw_plot(p6, x=0.6, y=0, width = 0.2, height = 1)+
  draw_plot(p7, x=0.8, y=0, width = 0.2, height = 1)


ggdraw()+ 
  draw_plot(p1, x=0.05, y=0.725, width = 0.95, height = 0.275)+
  draw_plot(p2, x=0, y=0.305, width = 1, height = 0.43)+
  draw_plot(p8, x=0.05, y=0, width = 0.95, height = 0.3)+
  draw_label("CC type",color = "black",size=12,x=0.32,y=0.665,fontface = "italic")+
  draw_label("Residue\n   management",color = "black",size=12,x=0.322,y=0.54,fontface = "italic")+
  draw_label("Duration",color = "black",size=12,x=0.32,y=0.428,fontface = "italic")+
  draw_plot_label(label = c("a","b","c"), size = 15,
                  x=c(0.01,0.01,0.01), y=c(1,0.71,0.3))##11.6*8.6
