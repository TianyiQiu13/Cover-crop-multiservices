library(raster)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggpmisc)
library(metafor)
library(cowplot)

make_pct <- function(x) (exp(x) - 1) * 100
font=theme(axis.title=element_text(size=13),axis.text = element_text(size=12,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12))#11.6inches

MWD_duration <- read.csv("MWD with duration-new.csv")

MWD.mod <- rma(rrMWD,varMWD,data=MWD_duration,mods=~duration)
Weight <- 1/(MWD_duration$varMWD+MWD.mod$tau2)
MWD_duration$weight <- Weight

MWD_duration.plot <- ggplot(MWD_duration,aes(weight=weight))+
  geom_point(aes(duration,rrMWD,size=weight),color="steelblue",alpha=0.5) +
  geom_smooth(aes(duration,rrMWD), color="red", method = "lm", 
              formula = y ~ poly(log(x), 1, raw = TRUE),se=T)+
  geom_hline(yintercept = 0, color = "gray50", linetype = "dashed") + 
  scale_size_continuous(range=c(1,3.6))+
  scale_x_continuous(limits = c(0,40))+
  stat_poly_eq(aes(duration,rrMWD,
                   label = paste(..eq.label..,..rr.label..,..p.value.label..,sep="*\", \"*")),
               formula = y ~ poly(log(x), 1, raw = TRUE), parse = T,label.x = "right",label.y = "top")+
  theme_cowplot()+
  xlab("Duration (yr)")+
  ylab(expression(paste(Ln,italic(RR)," of MWD",sep="")))+font+theme(legend.position = "none")
MWD_duration.plot##5.4*5.4
