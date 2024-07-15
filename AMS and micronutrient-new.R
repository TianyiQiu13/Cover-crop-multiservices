library(raster)
library(tidyverse)
library(dplyr)
library(mapproj)
library(ggspatial)
library(ggalt)
library(rgdal)
library(rworldmap)
library(doParallel)
library(ggplot2)
library(ggpmisc)
library(cowplot)

setwd("D:/Document/Cover crop")
font=theme(axis.title=element_text(size=13),axis.text = element_text(size=12,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12))#11.6inches

micronutrient <- read.csv("AMS.micronutrient.csv")

upland <- ggplot(micronutrient)+
  geom_point(aes(Micronutrient/1000,AMS_upland.micronutrient),color="steelblue",size=3.6,alpha=0.5) +
  geom_smooth(aes(Micronutrient/1000,AMS_upland.micronutrient), color="red", method = "lm", 
              formula = y ~ poly(x, 1, raw = TRUE),se=F)+
  geom_hline(yintercept = 0, color = "gray50", linetype = "dashed") + 
  scale_x_continuous(limits = c(0,210))+
  stat_poly_eq(aes(Micronutrient/1000,AMS_upland.micronutrient,
               label = paste(..eq.label..,..rr.label..,..p.value.label..,sep="*\", \"*")),
               formula = y ~ poly(x, 1, raw = TRUE), parse = T,label.x = "right",label.y = "top")+
  theme_cowplot()+
  xlab("Soil micronutrient (g/kg)")+
  ylab("\nAgroecosystem multiservices (%)")+font
upland 

paddy <- ggplot(micronutrient)+
  geom_point(aes(Micronutrient/1000,AMS_paddy.micronutrient),color="steelblue",size=3.6,alpha=0.5) +
  geom_smooth(aes(Micronutrient/1000,AMS_paddy.micronutrient), color="red", method = "lm", 
              formula = y ~ poly(x, 1, raw = TRUE),se=F)+
  geom_hline(yintercept = 0, color = "gray50", linetype = "dashed") + 
  scale_x_continuous(limits = c(0,100))+
  stat_poly_eq(aes(Micronutrient/1000,AMS_paddy.micronutrient,
                   label = paste(..eq.label..,..rr.label..,..p.value.label..,sep="*\", \"*")),
               formula = y ~ poly(x, 1, raw = TRUE), parse = T,label.x = "right",label.y = "top")+
  theme_cowplot()+
  xlab("Soil micronutrient (g/kg)")+
  ylab("\nAgroecosystem multiservices (%)")+font
paddy 

upland_126 <- ggplot(micronutrient)+
  geom_point(aes(Micronutrient/1000,AMS_upland.micronutrient_126),color="purple",size=3.6,alpha=0.35) +
  geom_smooth(aes(Micronutrient/1000,AMS_upland.micronutrient_126), color="red", method = "lm", 
              formula = y ~ poly(x, 1, raw = TRUE),se=F)+
  geom_hline(yintercept = 0, color = "gray50", linetype = "dashed") + 
  scale_x_continuous(limits = c(0,210))+
  stat_poly_eq(aes(Micronutrient/1000,AMS_upland.micronutrient_126,
                   label = paste(..eq.label..,..rr.label..,..p.value.label..,sep="*\", \"*")),
               formula = y ~ poly(x, 1, raw = TRUE), parse = T,label.x = "right",label.y = "top")+
  theme_cowplot()+
  xlab("Soil micronutrient (g/kg)")+
  ylab("Agroecosystem multiservices\nunder SSP126 (%)")+font
upland_126 

paddy_126 <- ggplot(micronutrient)+
  geom_point(aes(Micronutrient/1000,AMS_paddy.micronutrient_126),color="purple",size=3.6,alpha=0.35) +
  geom_smooth(aes(Micronutrient/1000,AMS_paddy.micronutrient_126), color="red", method = "lm", 
              formula = y ~ poly(x, 1, raw = TRUE),se=F)+
  geom_hline(yintercept = 0, color = "gray50", linetype = "dashed") + 
  scale_x_continuous(limits = c(0,100))+
  stat_poly_eq(aes(Micronutrient/1000,AMS_paddy.micronutrient_126,
                   label = paste(..eq.label..,..rr.label..,..p.value.label..,sep="*\", \"*")),
               formula = y ~ poly(x, 1, raw = TRUE), parse = T,label.x = "right",label.y = "top")+
  theme_cowplot()+
  xlab("Soil micronutrient (g/kg)")+
  ylab("Agroecosystem multiservices\nunder SSP126 (%)")+font
paddy_126

upland_370 <- ggplot(micronutrient)+
  geom_point(aes(Micronutrient/1000,AMS_upland.micronutrient_370),color="darkgreen",size=3.6,alpha=0.35) +
  geom_smooth(aes(Micronutrient/1000,AMS_upland.micronutrient_370), color="red", method = "lm", 
              formula = y ~ poly(x, 1, raw = TRUE),se=F)+
  geom_hline(yintercept = 0, color = "gray50", linetype = "dashed") + 
  scale_x_continuous(limits = c(0,210))+
  stat_poly_eq(aes(Micronutrient/1000,AMS_upland.micronutrient_370,
                   label = paste(..eq.label..,..rr.label..,..p.value.label..,sep="*\", \"*")),
               formula = y ~ poly(x, 1, raw = TRUE), parse = T,label.x = "right",label.y = "top")+
  theme_cowplot()+
  xlab("Soil micronutrient (g/kg)")+
  ylab("Agroecosystem multiservices\nunder SSP370 (%)")+font
upland_370 

paddy_370 <- ggplot(micronutrient)+
  geom_point(aes(Micronutrient/1000,AMS_paddy.micronutrient_370),color="darkgreen",size=3.6,alpha=0.35) +
  geom_smooth(aes(Micronutrient/1000,AMS_paddy.micronutrient_370), color="red", method = "lm", 
              formula = y ~ poly(x, 1, raw = TRUE),se=F)+
  geom_hline(yintercept = 0, color = "gray50", linetype = "dashed") + 
  scale_x_continuous(limits = c(0,100))+
  stat_poly_eq(aes(Micronutrient/1000,AMS_paddy.micronutrient_370,
                   label = paste(..eq.label..,..rr.label..,..p.value.label..,sep="*\", \"*")),
               formula = y ~ poly(x, 1, raw = TRUE), parse = T,label.x = "right",label.y = "top")+
  theme_cowplot()+
  xlab("Soil micronutrient (g/kg)")+
  ylab("Agroecosystem multiservices\nunder SSP370 (%)")+font
paddy_370

micronutrient.total <- plot_grid(upland,paddy,
                                 upland_126,paddy_126,
                                 upland_370,paddy_370,
                                 align = 'hv', 
                                 axis = "tb",
                          label_size = 15,
                          labels = c("a","b","c","d","e"," f"),
                          #hjust = -3, 
                          #vjust= 4,
                          nrow = 3,
                          ncol=2
)
micronutrient.total##8.6*11.6





##########AMS##########
micronutrient <- read.csv("Micronutrient-new.csv")
micronutrient.sts <- micronutrient[,1:2]
micro.sts <- SpatialPoints(micronutrient.sts,proj4string = CRS("+proj=longlat +datum=WGS84"))

#### upland ####
AMS_upland <- raster("AMS.upland.percMean.tif")
AMS_upland.micronutrient_126 <- raster::extract(AMS_upland,micro.sts)
AMS.upland.micronutrient_126.df <- data.frame(micronutrient,AMS_upland.micronutrient_126)

AMS_upland_126 <-  raster("AMS.upaland.SSP126.2091-2100.percMean.tif")
AMS_upland.micronutrient_126_126 <- raster::extract(AMS_upland_126,micro.sts)
AMS.upland.micronutrient_126.df_126 <- data.frame(AMS.upland.micronutrient_126.df,AMS_upland.micronutrient_126_126)

AMS_upland_370 <-  raster("AMS.upaland.SSP370.2091-2100.percMean.tif")
AMS_upland.micronutrient_126_370 <- raster::extract(AMS_upland_370,micro.sts)
AMS.upland.micronutrient_126.df_370 <- data.frame(AMS.upland.micronutrient_126.df_126,
                                              AMS_upland.micronutrient_126_370)

#### paddy ####
AMS_paddy <- raster("AMS.paddy.percMean.tif")
AMS_paddy.micronutrient_126 <- raster::extract(AMS_paddy,micro.sts)
AMS.micronutrient_126.df <- data.frame(AMS.upland.micronutrient_126.df_370,AMS_paddy.micronutrient_126)

AMS_paddy_126 <-  raster("AMS.paddy.SSP126.2091-2100.percMean.tif")
AMS_paddy.micronutrient_126_126 <- raster::extract(AMS_paddy_126,micro.sts)
AMS.paddy.micronutrient_126.df_126 <- data.frame(AMS.micronutrient_126.df,AMS_paddy.micronutrient_126_126)

AMS_paddy_370 <-  raster("AMS.paddy.SSP370.2091-2100.percMean.tif")
AMS_paddy.micronutrient_126_370 <- raster::extract(AMS_paddy_370,micro.sts)
AMS.paddy.micronutrient_126.df_370 <- data.frame(AMS.paddy.micronutrient_126.df_126,
                                              AMS_paddy.micronutrient_126_370)



write.csv(AMS.paddy.micronutrient_126.df_370,"AMS.micronutrient_126.csv")
