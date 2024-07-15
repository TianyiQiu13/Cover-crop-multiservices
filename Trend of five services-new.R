library(tidyverse)
library(sf)
library(raster)
library(ggplot2)
library(ggspatial)
library(cowplot)

setwd("D:/Document/Cover crop")
font=theme(axis.title=element_text(size=13),axis.text = element_text(size=12,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12))#11.6inches


####Trend of yield####
line.data <- read.csv("Future projection mean.csv")
line.yield <- line.data[line.data$variable=="yield",]
line.yield.upland <- line.yield[line.yield$cropland.type=="upland",]
line.yield.upland$pathway <- factor(line.yield.upland$pathway,labels = c("SSP126","SSP370"))
line.yield.upland$period <- factor(line.yield.upland$period,
                                 levels = c("current","2020s","2040s","2060s","2090s"),
                                 labels = c("Current","2020s","2040s","2060s","2090s"))

line.upland.yield <- ggplot(line.yield.upland, aes(y=mean, x=period,color=pathway))+ 
  geom_line(aes(group=pathway))+ geom_point(size=3,alpha=0.35)+
  labs(x="Period")+
  ylab("Yield (%)") +
  scale_color_manual(values = c("purple","darkgreen"))+
  theme_cowplot()+font+theme(axis.title.x = element_blank(),
                             axis.text.x = element_text(angle=30,hjust = 1))+
  theme(legend.position = "none")

line.yield.paddy <- line.yield[line.yield$cropland.type=="paddy",]
line.yield.paddy$pathway <- factor(line.yield.paddy$pathway,labels = c("SSP126","SSP370"))
line.yield.paddy$period <- factor(line.yield.paddy$period,
                                levels = c("current","2020s","2040s","2060s","2090s"),
                                labels = c("Current","2020s","2040s","2060s","2090s"))

line.paddy.yield <- ggplot(line.yield.paddy, aes(y=mean, x=period,color=pathway))+ 
  geom_line(aes(group=pathway))+ geom_point(size=3,alpha=0.35)+
  labs(x="Period")+
  ylab("Yield (%)") +
  scale_color_manual(values = c("purple","darkgreen"))+
  theme_cowplot()+font+theme(axis.title.x = element_blank(),
                             axis.text.x = element_text(angle=30,hjust = 1))+
  theme(legend.position = "none")

line.yield.upland$time <- ifelse(line.yield.upland$period=="Current",2020,
                               ifelse(line.yield.upland$period=="2020s",2025,
                                      ifelse(line.yield.upland$period=="2040s",2045,
                                             ifelse(line.yield.upland$period=="2060s",2065,2095))))
line.yield.paddy$time <- ifelse(line.yield.paddy$period=="Current",2020,
                              ifelse(line.yield.paddy$period=="2020s",2025,
                                     ifelse(line.yield.paddy$period=="2040s",2045,
                                            ifelse(line.yield.paddy$period=="2060s",2065,2095))))
line.yield$time <- ifelse(line.yield$period=="current",2020,
                        ifelse(line.yield$period=="2020s",2025,
                               ifelse(line.yield$period=="2040s",2045,
                                      ifelse(line.yield$period=="2060s",2065,2095))))

slope.yield.upland <- lm(mean~time,line.yield.upland)
slope.yield.upland.boot <- confint(slope.yield.upland,method="boot")
slope.yield.upland.boot.df <- rbind.data.frame(slope.yield.upland.boot)[2,]
slope.yield.upland.boot.df$mean <- (slope.yield.upland.boot.df$`2.5 %`+slope.yield.upland.boot.df$`97.5 %`)/2
names(slope.yield.upland.boot.df) <- c("CI1","CI2","mean")
slope.yield.upland.boot.df$type <- "Upland"

slope.yield.paddy <- lm(mean~time,line.yield.paddy)
slope.yield.paddy.boot <- confint(slope.yield.paddy,method="boot")
slope.yield.paddy.boot.df <- rbind.data.frame(slope.yield.paddy.boot)[2,]
slope.yield.paddy.boot.df$mean <- (slope.yield.paddy.boot.df$`2.5 %`+slope.yield.paddy.boot.df$`97.5 %`)/2
names(slope.yield.paddy.boot.df) <- c("CI1","CI2","mean")
slope.yield.paddy.boot.df$type <- "Paddy"

slope.yield.global <- lm(mean~time,line.yield)
slope.yield.global.boot <- confint(slope.yield.global,method="boot")
slope.yield.global.boot.df <- rbind.data.frame(slope.yield.global.boot)[2,]
slope.yield.global.boot.df$mean <- (slope.yield.global.boot.df$`2.5 %`+slope.yield.global.boot.df$`97.5 %`)/2
names(slope.yield.global.boot.df) <- c("CI1","CI2","mean")
slope.yield.global.boot.df$type <- "Global"

slope.yield.all <- rbind.data.frame(slope.yield.upland.boot.df,slope.yield.paddy.boot.df,
                                  slope.yield.global.boot.df)

slope.yield.global <- ggplot(data=slope.yield.all,aes(type, mean)) + 
  geom_point(aes(color=type),size=3.6,alpha=1)+
  geom_errorbar(aes(y=mean,ymin=CI1,ymax=CI2,x=type,color=type), width=0, size=0.75)+
  scale_color_manual(values = c("#efaf1280","#3e773980","#BEBADA")) +
  #scale_y_continuous(breaks = c(0,0.03,0.06,0.09))+
  ylab("Boostrapped\nslope of time") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  geom_vline(xintercept = 2.5,linetype="dashed",color="black")+
  scale_x_discrete(labels=c("Upland","Paddy","Global"))+
  theme_cowplot()+font+
  theme(axis.text.x = element_text(angle=30,hjust = 1,colour = "black"),
        axis.title.x = element_blank(),legend.position = "none")
slope.yield.global


####Trend of SOC####
line.data <- read.csv("Future projection mean.csv")
line.SOC <- line.data[line.data$variable=="SOC",]
line.SOC.upland <- line.SOC[line.SOC$cropland.type=="upland",]
line.SOC.upland$pathway <- factor(line.SOC.upland$pathway,labels = c("SSP126","SSP370"))
line.SOC.upland$period <- factor(line.SOC.upland$period,
                                   levels = c("current","2020s","2040s","2060s","2090s"),
                                   labels = c("Current","2020s","2040s","2060s","2090s"))

line.upland.SOC <- ggplot(line.SOC.upland, aes(y=mean, x=period,color=pathway))+ 
  geom_line(aes(group=pathway))+ geom_point(size=3,alpha=0.35)+
  labs(x="Period")+
  ylab(expression(paste(SOC[stock]," (%)",sep=""))) +
  scale_color_manual(values = c("purple","darkgreen"))+
  theme_cowplot()+font+theme(axis.title.x = element_blank(),
                             axis.text.x = element_text(angle=30,hjust = 1))+
  theme(legend.position = "none")

line.SOC.paddy <- line.SOC[line.SOC$cropland.type=="paddy",]
line.SOC.paddy$pathway <- factor(line.SOC.paddy$pathway,labels = c("SSP126","SSP370"))
line.SOC.paddy$period <- factor(line.SOC.paddy$period,
                                  levels = c("current","2020s","2040s","2060s","2090s"),
                                  labels = c("Current","2020s","2040s","2060s","2090s"))

line.paddy.SOC <- ggplot(line.SOC.paddy, aes(y=mean, x=period,color=pathway))+ 
  geom_line(aes(group=pathway))+ geom_point(size=3,alpha=0.35)+
  labs(x="Period")+
  ylab(expression(paste(SOC[stock]," (%)",sep=""))) +
  scale_color_manual(values = c("purple","darkgreen"))+
  theme_cowplot()+font+theme(axis.title.x = element_blank(),
                             axis.text.x = element_text(angle=30,hjust = 1))+
  theme(legend.position = "none")

line.SOC.upland$time <- ifelse(line.SOC.upland$period=="Current",2020,
                                 ifelse(line.SOC.upland$period=="2020s",2025,
                                        ifelse(line.SOC.upland$period=="2040s",2045,
                                               ifelse(line.SOC.upland$period=="2060s",2065,2095))))
line.SOC.paddy$time <- ifelse(line.SOC.paddy$period=="Current",2020,
                                ifelse(line.SOC.paddy$period=="2020s",2025,
                                       ifelse(line.SOC.paddy$period=="2040s",2045,
                                              ifelse(line.SOC.paddy$period=="2060s",2065,2095))))
line.SOC$time <- ifelse(line.SOC$period=="current",2020,
                          ifelse(line.SOC$period=="2020s",2025,
                                 ifelse(line.SOC$period=="2040s",2045,
                                        ifelse(line.SOC$period=="2060s",2065,2095))))

slope.SOC.upland <- lm(mean~time,line.SOC.upland)
slope.SOC.upland.boot <- confint(slope.SOC.upland,method="boot")
slope.SOC.upland.boot.df <- rbind.data.frame(slope.SOC.upland.boot)[2,]
slope.SOC.upland.boot.df$mean <- (slope.SOC.upland.boot.df$`2.5 %`+slope.SOC.upland.boot.df$`97.5 %`)/2
names(slope.SOC.upland.boot.df) <- c("CI1","CI2","mean")
slope.SOC.upland.boot.df$type <- "Upland"

slope.SOC.paddy <- lm(mean~time,line.SOC.paddy)
slope.SOC.paddy.boot <- confint(slope.SOC.paddy,method="boot")
slope.SOC.paddy.boot.df <- rbind.data.frame(slope.SOC.paddy.boot)[2,]
slope.SOC.paddy.boot.df$mean <- (slope.SOC.paddy.boot.df$`2.5 %`+slope.SOC.paddy.boot.df$`97.5 %`)/2
names(slope.SOC.paddy.boot.df) <- c("CI1","CI2","mean")
slope.SOC.paddy.boot.df$type <- "Paddy"

slope.SOC.global <- lm(mean~time,line.SOC)
slope.SOC.global.boot <- confint(slope.SOC.global,method="boot")
slope.SOC.global.boot.df <- rbind.data.frame(slope.SOC.global.boot)[2,]
slope.SOC.global.boot.df$mean <- (slope.SOC.global.boot.df$`2.5 %`+slope.SOC.global.boot.df$`97.5 %`)/2
names(slope.SOC.global.boot.df) <- c("CI1","CI2","mean")
slope.SOC.global.boot.df$type <- "Global"

slope.SOC.all <- rbind.data.frame(slope.SOC.upland.boot.df,slope.SOC.paddy.boot.df,
                                    slope.SOC.global.boot.df)

slope.SOC.global <- ggplot(data=slope.SOC.all,aes(type, mean)) + 
  geom_point(aes(color=type),size=3.6,alpha=1)+
  geom_errorbar(aes(y=mean,ymin=CI1,ymax=CI2,x=type,color=type), width=0, size=0.75)+
  scale_color_manual(values = c("#efaf1280","#3e773980","#BEBADA")) +
  #scale_y_continuous(breaks = c(0,0.03,0.06,0.09))+
  ylab("Boostrapped\nslope of time") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  geom_vline(xintercept = 2.5,linetype="dashed",color="black")+
  scale_x_discrete(labels=c("Upland","Paddy","Global"))+
  theme_cowplot()+font+
  theme(axis.text.x = element_text(angle=30,hjust = 1,colour = "black"),
        axis.title.x = element_blank(),legend.position = "none")
slope.SOC.global


####Trend of N2O####
line.data <- read.csv("Future projection mean.csv")
line.N2O <- line.data[line.data$variable=="N2O",]
line.N2O.upland <- line.N2O[line.N2O$cropland.type=="upland",]
line.N2O.upland$pathway <- factor(line.N2O.upland$pathway,labels = c("SSP126","SSP370"))
line.N2O.upland$period <- factor(line.N2O.upland$period,
                                   levels = c("current","2020s","2040s","2060s","2090s"),
                                   labels = c("Current","2020s","2040s","2060s","2090s"))

line.upland.N2O <- ggplot(line.N2O.upland, aes(y=mean, x=period,color=pathway))+ 
  geom_line(aes(group=pathway))+ geom_point(size=3,alpha=0.35)+
  labs(x="Period")+
  ylab(expression(paste(N[2],"O (%)",sep = ""))) +
  scale_color_manual(values = c("purple","darkgreen"))+
  theme_cowplot()+font+theme(axis.title.x = element_blank(),
                             axis.text.x = element_text(angle=30,hjust = 1))+
  theme(legend.position = "none")

line.N2O.paddy <- line.N2O[line.N2O$cropland.type=="paddy",]
line.N2O.paddy$pathway <- factor(line.N2O.paddy$pathway,labels = c("SSP126","SSP370"))
line.N2O.paddy$period <- factor(line.N2O.paddy$period,
                                  levels = c("current","2020s","2040s","2060s","2090s"),
                                  labels = c("Current","2020s","2040s","2060s","2090s"))

line.paddy.N2O <- ggplot(line.N2O.paddy, aes(y=mean, x=period,color=pathway))+ 
  geom_line(aes(group=pathway))+ geom_point(size=3,alpha=0.35)+
  labs(x="Period")+
  ylab(expression(paste(N[2],"O (%)",sep = ""))) +
  scale_color_manual(values = c("purple","darkgreen"))+
  theme_cowplot()+font+theme(axis.title.x = element_blank(),
                             axis.text.x = element_text(angle=30,hjust = 1))+
  theme(legend.position = "none")

line.N2O.upland$time <- ifelse(line.N2O.upland$period=="Current",2020,
                                 ifelse(line.N2O.upland$period=="2020s",2025,
                                        ifelse(line.N2O.upland$period=="2040s",2045,
                                               ifelse(line.N2O.upland$period=="2060s",2065,2095))))
line.N2O.paddy$time <- ifelse(line.N2O.paddy$period=="Current",2020,
                                ifelse(line.N2O.paddy$period=="2020s",2025,
                                       ifelse(line.N2O.paddy$period=="2040s",2045,
                                              ifelse(line.N2O.paddy$period=="2060s",2065,2095))))
line.N2O$time <- ifelse(line.N2O$period=="current",2020,
                          ifelse(line.N2O$period=="2020s",2025,
                                 ifelse(line.N2O$period=="2040s",2045,
                                        ifelse(line.N2O$period=="2060s",2065,2095))))

slope.N2O.upland <- lm(mean~time,line.N2O.upland)
slope.N2O.upland.boot <- confint(slope.N2O.upland,method="boot")
slope.N2O.upland.boot.df <- rbind.data.frame(slope.N2O.upland.boot)[2,]
slope.N2O.upland.boot.df$mean <- (slope.N2O.upland.boot.df$`2.5 %`+slope.N2O.upland.boot.df$`97.5 %`)/2
names(slope.N2O.upland.boot.df) <- c("CI1","CI2","mean")
slope.N2O.upland.boot.df$type <- "Upland"

slope.N2O.paddy <- lm(mean~time,line.N2O.paddy)
slope.N2O.paddy.boot <- confint(slope.N2O.paddy,method="boot")
slope.N2O.paddy.boot.df <- rbind.data.frame(slope.N2O.paddy.boot)[2,]
slope.N2O.paddy.boot.df$mean <- (slope.N2O.paddy.boot.df$`2.5 %`+slope.N2O.paddy.boot.df$`97.5 %`)/2
names(slope.N2O.paddy.boot.df) <- c("CI1","CI2","mean")
slope.N2O.paddy.boot.df$type <- "Paddy"

slope.N2O.global <- lm(mean~time,line.N2O)
slope.N2O.global.boot <- confint(slope.N2O.global,method="boot")
slope.N2O.global.boot.df <- rbind.data.frame(slope.N2O.global.boot)[2,]
slope.N2O.global.boot.df$mean <- (slope.N2O.global.boot.df$`2.5 %`+slope.N2O.global.boot.df$`97.5 %`)/2
names(slope.N2O.global.boot.df) <- c("CI1","CI2","mean")
slope.N2O.global.boot.df$type <- "Global"

slope.N2O.all <- rbind.data.frame(slope.N2O.upland.boot.df,slope.N2O.paddy.boot.df,
                                    slope.N2O.global.boot.df)

slope.N2O.global <- ggplot(data=slope.N2O.all,aes(type, mean)) + 
  geom_point(aes(color=type),size=3.6,alpha=1)+
  geom_errorbar(aes(y=mean,ymin=CI1,ymax=CI2,x=type,color=type), width=0, size=0.75)+
  scale_color_manual(values = c("#efaf1280","#3e773980","#BEBADA")) +
  #scale_y_continuous(breaks = c(0,0.03,0.06,0.09))+
  ylab("Boostrapped\nslope of time") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  geom_vline(xintercept = 2.5,linetype="dashed",color="black")+
  scale_x_discrete(labels=c("Upland","Paddy","Global"))+
  theme_cowplot()+font+
  theme(axis.text.x = element_text(angle=30,hjust = 1,colour = "black"),
        axis.title.x = element_blank(),legend.position = "none")
slope.N2O.global


####Trend of CH4####
line.data <- read.csv("Future projection mean.csv")
line.CH4 <- line.data[line.data$variable=="CH4",]
line.CH4.upland <- line.CH4[line.CH4$cropland.type=="upland",]
line.CH4.upland$pathway <- factor(line.CH4.upland$pathway,labels = c("SSP126","SSP370"))
line.CH4.upland$period <- factor(line.CH4.upland$period,
                                   levels = c("current","2020s","2040s","2060s","2090s"),
                                   labels = c("Current","2020s","2040s","2060s","2090s"))

line.upland.CH4 <- ggplot(line.CH4.upland, aes(y=mean, x=period,color=pathway))+ 
  geom_line(aes(group=pathway))+ geom_point(size=3,alpha=0.35)+
  labs(x="Period")+
  ylab(expression(paste(CH[4]," (%)",sep = ""))) +
  scale_color_manual(values = c("purple","darkgreen"))+
  theme_cowplot()+font+theme(axis.title.x = element_blank(),
                             axis.text.x = element_text(angle=30,hjust = 1))+
  theme(legend.position = "none")

line.CH4.paddy <- line.CH4[line.CH4$cropland.type=="paddy",]
line.CH4.paddy$pathway <- factor(line.CH4.paddy$pathway,labels = c("SSP126","SSP370"))
line.CH4.paddy$period <- factor(line.CH4.paddy$period,
                                  levels = c("current","2020s","2040s","2060s","2090s"),
                                  labels = c("Current","2020s","2040s","2060s","2090s"))

line.paddy.CH4  <- ggplot(line.CH4.paddy, aes(y=mean, x=period,color=pathway))+ 
  geom_line(aes(group=pathway))+ geom_point(size=3,alpha=0.35)+
  labs(x="Period")+
  ylab(expression(paste(CH[4]," (%)",sep = ""))) +
  scale_color_manual(values = c("purple","darkgreen"))+
  theme_cowplot()+font+theme(axis.title.x = element_blank(),
                             axis.text.x = element_text(angle=30,hjust = 1))+
  theme(legend.position = "none")

line.CH4.upland$time <- ifelse(line.CH4.upland$period=="Current",2020,
                                 ifelse(line.CH4.upland$period=="2020s",2025,
                                        ifelse(line.CH4.upland$period=="2040s",2045,
                                               ifelse(line.CH4.upland$period=="2060s",2065,2095))))
line.CH4.paddy$time <- ifelse(line.CH4.paddy$period=="Current",2020,
                                ifelse(line.CH4.paddy$period=="2020s",2025,
                                       ifelse(line.CH4.paddy$period=="2040s",2045,
                                              ifelse(line.CH4.paddy$period=="2060s",2065,2095))))
line.CH4$time <- ifelse(line.CH4$period=="current",2020,
                          ifelse(line.CH4$period=="2020s",2025,
                                 ifelse(line.CH4$period=="2040s",2045,
                                        ifelse(line.CH4$period=="2060s",2065,2095))))

slope.CH4.upland <- lm(mean~time,line.CH4.upland)
slope.CH4.upland.boot <- confint(slope.CH4.upland,method="boot")
slope.CH4.upland.boot.df <- rbind.data.frame(slope.CH4.upland.boot)[2,]
slope.CH4.upland.boot.df$mean <- (slope.CH4.upland.boot.df$`2.5 %`+slope.CH4.upland.boot.df$`97.5 %`)/2
names(slope.CH4.upland.boot.df) <- c("CI1","CI2","mean")
slope.CH4.upland.boot.df$type <- "Upland"

slope.CH4.paddy <- lm(mean~time,line.CH4.paddy)
slope.CH4.paddy.boot <- confint(slope.CH4.paddy,method="boot")
slope.CH4.paddy.boot.df <- rbind.data.frame(slope.CH4.paddy.boot)[2,]
slope.CH4.paddy.boot.df$mean <- (slope.CH4.paddy.boot.df$`2.5 %`+slope.CH4.paddy.boot.df$`97.5 %`)/2
names(slope.CH4.paddy.boot.df) <- c("CI1","CI2","mean")
slope.CH4.paddy.boot.df$type <- "Paddy"

slope.CH4.global <- lm(mean~time,line.CH4)
slope.CH4.global.boot <- confint(slope.CH4.global,method="boot")
slope.CH4.global.boot.df <- rbind.data.frame(slope.CH4.global.boot)[2,]
slope.CH4.global.boot.df$mean <- (slope.CH4.global.boot.df$`2.5 %`+slope.CH4.global.boot.df$`97.5 %`)/2
names(slope.CH4.global.boot.df) <- c("CI1","CI2","mean")
slope.CH4.global.boot.df$type <- "Global"

slope.CH4.all <- rbind.data.frame(slope.CH4.upland.boot.df,slope.CH4.paddy.boot.df,
                                    slope.CH4.global.boot.df)

slope.CH4.global <- ggplot(data=slope.CH4.all,aes(type, mean)) + 
  geom_point(aes(color=type),size=3.6,alpha=1)+
  geom_errorbar(aes(y=mean,ymin=CI1,ymax=CI2,x=type,color=type), width=0, size=0.75)+
  scale_color_manual(values = c("#efaf1280","#3e773980","#BEBADA")) +
  #scale_y_continuous(breaks = c(0,0.03,0.06,0.09))+
  ylab("Boostrapped\nslope of time") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  geom_vline(xintercept = 2.5,linetype="dashed",color="black")+
  scale_x_discrete(labels=c("Upland","Paddy","Global"))+
  theme_cowplot()+font+
  theme(axis.text.x = element_text(angle=30,hjust = 1,colour = "black"),
        axis.title.x = element_blank(),legend.position = "none")
slope.CH4.global


####Trend of MWD####
line.data <- read.csv("Future projection mean.csv")
line.MWD <- line.data[line.data$variable=="MWD",]
line.MWD.upland <- line.MWD[line.MWD$cropland.type=="upland",]
line.MWD.upland$pathway <- factor(line.MWD.upland$pathway,labels = c("SSP126","SSP370"))
line.MWD.upland$period <- factor(line.MWD.upland$period,
                                 levels = c("current","2020s","2040s","2060s","2090s"),
                                 labels = c("Current","2020s","2040s","2060s","2090s"))

line.upland.MWD <- ggplot(line.MWD.upland, aes(y=mean, x=period,color=pathway))+ 
  geom_line(aes(group=pathway))+ geom_point(size=3,alpha=0.35)+
  labs(x="Period")+
  ylab("MWD (%)") +
  scale_color_manual(values = c("purple","darkgreen"))+
  theme_cowplot()+font+theme(axis.title.x = element_blank(),
                             axis.text.x = element_text(angle=30,hjust = 1))+
  theme(legend.position = "none")

line.MWD.paddy <- line.MWD[line.MWD$cropland.type=="paddy",]
line.MWD.paddy$pathway <- factor(line.MWD.paddy$pathway,labels = c("SSP126","SSP370"))
line.MWD.paddy$period <- factor(line.MWD.paddy$period,
                                levels = c("current","2020s","2040s","2060s","2090s"),
                                labels = c("Current","2020s","2040s","2060s","2090s"))

line.paddy.MWD <- ggplot(line.MWD.paddy, aes(y=mean, x=period,color=pathway))+ 
  geom_line(aes(group=pathway))+ geom_point(size=3,alpha=0.35)+
  labs(x="Period")+
  ylab("MWD (%)") +
  scale_color_manual(values = c("purple","darkgreen"))+
  theme_cowplot()+font+theme(axis.title.x = element_blank(),
                             axis.text.x = element_text(angle=30,hjust = 1))+
  theme(legend.position = "none")

line.MWD.upland$time <- ifelse(line.MWD.upland$period=="Current",2020,
                               ifelse(line.MWD.upland$period=="2020s",2025,
                                      ifelse(line.MWD.upland$period=="2040s",2045,
                                             ifelse(line.MWD.upland$period=="2060s",2065,2095))))
line.MWD.paddy$time <- ifelse(line.MWD.paddy$period=="Current",2020,
                              ifelse(line.MWD.paddy$period=="2020s",2025,
                                     ifelse(line.MWD.paddy$period=="2040s",2045,
                                            ifelse(line.MWD.paddy$period=="2060s",2065,2095))))
line.MWD$time <- ifelse(line.MWD$period=="current",2020,
                        ifelse(line.MWD$period=="2020s",2025,
                               ifelse(line.MWD$period=="2040s",2045,
                                      ifelse(line.MWD$period=="2060s",2065,2095))))

slope.MWD.upland <- lm(mean~time,line.MWD.upland)
slope.MWD.upland.boot <- confint(slope.MWD.upland,method="boot")
slope.MWD.upland.boot.df <- rbind.data.frame(slope.MWD.upland.boot)[2,]
slope.MWD.upland.boot.df$mean <- (slope.MWD.upland.boot.df$`2.5 %`+slope.MWD.upland.boot.df$`97.5 %`)/2
names(slope.MWD.upland.boot.df) <- c("CI1","CI2","mean")
slope.MWD.upland.boot.df$type <- "Upland"

slope.MWD.paddy <- lm(mean~time,line.MWD.paddy)
slope.MWD.paddy.boot <- confint(slope.MWD.paddy,method="boot")
slope.MWD.paddy.boot.df <- rbind.data.frame(slope.MWD.paddy.boot)[2,]
slope.MWD.paddy.boot.df$mean <- (slope.MWD.paddy.boot.df$`2.5 %`+slope.MWD.paddy.boot.df$`97.5 %`)/2
names(slope.MWD.paddy.boot.df) <- c("CI1","CI2","mean")
slope.MWD.paddy.boot.df$type <- "Paddy"

slope.MWD.global <- lm(mean~time,line.MWD)
slope.MWD.global.boot <- confint(slope.MWD.global,method="boot")
slope.MWD.global.boot.df <- rbind.data.frame(slope.MWD.global.boot)[2,]
slope.MWD.global.boot.df$mean <- (slope.MWD.global.boot.df$`2.5 %`+slope.MWD.global.boot.df$`97.5 %`)/2
names(slope.MWD.global.boot.df) <- c("CI1","CI2","mean")
slope.MWD.global.boot.df$type <- "Global"

slope.MWD.all <- rbind.data.frame(slope.MWD.upland.boot.df,slope.MWD.paddy.boot.df,
                                  slope.MWD.global.boot.df)

slope.MWD.global <- ggplot(data=slope.MWD.all,aes(type, mean)) + 
  geom_point(aes(color=type),size=3.6,alpha=1)+
  geom_errorbar(aes(y=mean,ymin=CI1,ymax=CI2,x=type,color=type), width=0, size=0.75)+
  scale_color_manual(values = c("#efaf1280","#3e773980","#BEBADA")) +
  #scale_y_continuous(breaks = c(0,0.03,0.06,0.09))+
  ylab("Boostrapped\nslope of time") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  geom_vline(xintercept = 2.5,linetype="dashed",color="black")+
  scale_x_discrete(labels=c("Upland","Paddy","Global"))+
  theme_cowplot()+font+
  theme(axis.text.x = element_text(angle=30,hjust = 1,colour = "black"),
        axis.title.x = element_blank(),legend.position = "none")
slope.MWD.global

line.upland <- plot_grid( line.upland.yield  ,
                          line.upland.SOC  ,
                          line.upland.N2O  ,
                          line.upland.CH4  ,
                          line.upland.MWD  ,
                         align = 'hv', 
                         axis = "tb",
                         label_size = 15,
                         labels = c("a","d","g"," j","m"),
                         #hjust = -3, 
                         #vjust= 4,
                         nrow = 5,
                         ncol=1
)
line.upland

line.paddy <- plot_grid( line.paddy.yield  ,
                          line.paddy.SOC  ,
                          line.paddy.N2O  ,
                          line.paddy.CH4  ,
                          line.paddy.MWD  ,
                          align = 'hv', 
                          axis = "tb",
                          label_size = 15,
                          labels = c("b","e","h","k","n"),
                          #hjust = -3, 
                          #vjust= 4,
                          nrow = 5,
                          ncol=1
)
line.paddy

box.global <- plot_grid( slope.yield.global  ,
                         slope.SOC.global ,
                         slope.N2O.global  ,
                         slope.CH4.global  ,
                         slope.MWD.global  ,
                         align = 'hv', 
                         axis = "tb",
                         label_size = 15,
                         labels = c("c"," f"," i"," l","o"),
                         #vjust = -1, 
                         #vjust= 4,
                         nrow = 5,
                         ncol=1
)
box.global


total <- plot_grid(line.upland+ theme(plot.margin = unit(c(0,0,0,0), "cm")),
                   line.paddy + theme(plot.margin = unit(c(0,0,0,0), "cm")),
                   box.global+theme(plot.margin = unit(c(0,0,0,0), "cm")),
                   labels =NULL ,
                   rel_widths = c(1,1,0.5),
                   nrow = 1, ncol=3)
total#11.6*11 inches


###Yield resistance###
line.yield <- read.csv("Yield resistance-new.csv")
line.yield.upland <- line.yield[line.yield$cropland.type=="upland",]
line.yield.upland$pathway <- factor(line.yield.upland$pathway,labels = c("SSP126","SSP370"))

line.upland.yield <- ggplot(line.yield.upland, aes(y=mean, x=duration,color=pathway))+ 
  geom_line(aes(group=pathway))+ geom_point(size=3,alpha=0.35)+
  labs(x="Duration (yr)",color="")+
  ylab("Resistance of yield change\nunder CC practice") +
  scale_x_continuous(breaks=c(6,26,46,76),
                     labels = c(6,26,46,76))+
  scale_color_manual(values = c("purple","darkgreen"))+
  theme_cowplot()+font+
  theme(legend.position = c(0.675,0.875))
line.upland.yield

line.yield.paddy <- line.yield[line.yield$cropland.type=="paddy",]
line.yield.paddy$pathway <- factor(line.yield.paddy$pathway,labels = c("SSP126","SSP370"))
line.yield.paddy$period <- factor(line.yield.paddy$period,
                                  levels = c("current","2020s","2040s","2060s","2090s"),
                                  labels = c("Current","2020s","2040s","2060s","2090s"))

line.paddy.yield <- ggplot(line.yield.paddy, aes(y=mean, x=duration,color=pathway))+ 
  geom_line(aes(group=pathway))+ geom_point(size=3,alpha=0.35)+
  labs(x="Duration (yr)",color="")+
  ylab("Resistance of yield change\nunder CC practice") +
  scale_x_continuous(breaks=c(6,26,46,76),
                     labels = c(6,26,46,76))+
  scale_color_manual(values = c("purple","darkgreen"))+
  theme_cowplot()+font+
  theme(legend.position = "none")
line.paddy.yield

line.yield.126.upland<- line.yield.upland[line.yield.upland$pathway=="SSP126",]
line.yield.126.paddy<- line.yield.upland[line.yield.paddy$pathway=="SSP126",]
line.yield.126<- line.yield[line.yield$pathway=="ssp126",]

slope.yield.126.upland <- lm(mean~duration,line.yield.126.upland)
slope.yield.126.upland.boot <- confint(slope.yield.126.upland,method="boot")
slope.yield.126.upland.boot.df <- rbind.data.frame(slope.yield.126.upland.boot)[2,]
slope.yield.126.upland.boot.df$mean <- (slope.yield.126.upland.boot.df$`2.5 %`+slope.yield.126.upland.boot.df$`97.5 %`)/2
names(slope.yield.126.upland.boot.df) <- c("CI1","CI2","mean")
slope.yield.126.upland.boot.df$type <- "Upland"

slope.yield.126.paddy <- lm(mean~duration,line.yield.126.paddy)
slope.yield.126.paddy.boot <- confint(slope.yield.126.paddy,method="boot")
slope.yield.126.paddy.boot.df <- rbind.data.frame(slope.yield.126.paddy.boot)[2,]
slope.yield.126.paddy.boot.df$mean <- (slope.yield.126.paddy.boot.df$`2.5 %`+slope.yield.126.paddy.boot.df$`97.5 %`)/2
names(slope.yield.126.paddy.boot.df) <- c("CI1","CI2","mean")
slope.yield.126.paddy.boot.df$type <- "Paddy"

slope.yield.126.global <- lm(mean~duration,line.yield.126)
slope.yield.126.global.boot <- confint(slope.yield.126.global,method="boot")
slope.yield.126.global.boot.df <- rbind.data.frame(slope.yield.126.global.boot)[2,]
slope.yield.126.global.boot.df$mean <- (slope.yield.126.global.boot.df$`2.5 %`+slope.yield.126.global.boot.df$`97.5 %`)/2
names(slope.yield.126.global.boot.df) <- c("CI1","CI2","mean")
slope.yield.126.global.boot.df$type <- "Global"

slope.yield.126.all <- rbind.data.frame(slope.yield.126.upland.boot.df,slope.yield.126.paddy.boot.df,
                                    slope.yield.126.global.boot.df)

slope.yield.126.global <- ggplot(data=slope.yield.126.all,aes(type, mean)) + 
  geom_point(aes(color=type),size=3.6,alpha=1)+
  geom_errorbar(aes(y=mean,ymin=CI1,ymax=CI2,x=type,color=type), width=0, size=0.75)+
  scale_color_manual(values = c("#efaf1280","#3e773980","#BEBADA")) +
  #scale_y_continuous(breaks = c(0,0.03,0.06,0.09))+
  ylab("Boostrapped lope of time\nunder SSP126") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  geom_vline(xintercept = 2.5,linetype="dashed",color="black")+
  scale_x_discrete(labels=c("Upland","Paddy","Global"))+
  theme_cowplot()+font+
  theme(axis.text.x = element_text(angle=30,hjust = 1,colour = "black"),
        axis.title.x = element_blank(),legend.position = "none")
slope.yield.126.global


line.yield.370.upland<- line.yield.upland[line.yield.upland$pathway=="SSP370",]
line.yield.370.paddy<- line.yield.upland[line.yield.paddy$pathway=="SSP370",]
line.yield.370<- line.yield[line.yield$pathway=="ssp370",]

slope.yield.370.upland <- lm(mean~duration,line.yield.370.upland)
slope.yield.370.upland.boot <- confint(slope.yield.370.upland,method="boot")
slope.yield.370.upland.boot.df <- rbind.data.frame(slope.yield.370.upland.boot)[2,]
slope.yield.370.upland.boot.df$mean <- (slope.yield.370.upland.boot.df$`2.5 %`+slope.yield.370.upland.boot.df$`97.5 %`)/2
names(slope.yield.370.upland.boot.df) <- c("CI1","CI2","mean")
slope.yield.370.upland.boot.df$type <- "Upland"

slope.yield.370.paddy <- lm(mean~duration,line.yield.370.paddy)
slope.yield.370.paddy.boot <- confint(slope.yield.370.paddy,method="boot")
slope.yield.370.paddy.boot.df <- rbind.data.frame(slope.yield.370.paddy.boot)[2,]
slope.yield.370.paddy.boot.df$mean <- (slope.yield.370.paddy.boot.df$`2.5 %`+slope.yield.370.paddy.boot.df$`97.5 %`)/2
names(slope.yield.370.paddy.boot.df) <- c("CI1","CI2","mean")
slope.yield.370.paddy.boot.df$type <- "Paddy"

slope.yield.370.global <- lm(mean~duration,line.yield.370)
slope.yield.370.global.boot <- confint(slope.yield.370.global,method="boot")
slope.yield.370.global.boot.df <- rbind.data.frame(slope.yield.370.global.boot)[2,]
slope.yield.370.global.boot.df$mean <- (slope.yield.370.global.boot.df$`2.5 %`+slope.yield.370.global.boot.df$`97.5 %`)/2
names(slope.yield.370.global.boot.df) <- c("CI1","CI2","mean")
slope.yield.370.global.boot.df$type <- "Global"

slope.yield.370.all <- rbind.data.frame(slope.yield.370.upland.boot.df,slope.yield.370.paddy.boot.df,
                                        slope.yield.370.global.boot.df)

slope.yield.370.global <- ggplot(data=slope.yield.370.all,aes(type, mean)) + 
  geom_point(aes(color=type),size=3.6,alpha=1)+
  geom_errorbar(aes(y=mean,ymin=CI1,ymax=CI2,x=type,color=type), width=0, size=0.75)+
  scale_color_manual(values = c("#efaf1280","#3e773980","#BEBADA")) +
  #scale_y_continuous(breaks = c(0,0.03,0.06,0.09))+
  ylab("Boostrapped slope of time\nunder SSP370") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  geom_vline(xintercept = 2.5,linetype="dashed",color="black")+
  scale_x_discrete(labels=c("Upland","Paddy","Global"))+
  theme_cowplot()+font+
  theme(axis.text.x = element_text(angle=30,hjust = 1,colour = "black"),
        axis.title.x = element_blank(),legend.position = "none")
slope.yield.370.global

resistance <- plot_grid(line.upland.yield+ theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")),
                        line.paddy.yield+ theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) ,
                        slope.yield.126.global+ theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")),
                        slope.yield.370.global+ theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")),
                        align = 'hv', 
                        axis = "tb",
                        label_size = 15,
                        labels = c("a"," b","c","d"),
                   nrow = 2, ncol=2)+
  draw_label("Upland",color = "black",size=16,x=0.425,y=0.685,fontface = "bold")+
  draw_label("Paddy",color = "black",size=16,x=0.925,y=0.685,fontface = "bold")
resistance#7.8*7.0 inches
