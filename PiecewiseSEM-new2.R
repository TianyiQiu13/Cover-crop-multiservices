library(ggplot2)
library(rcartocolor)
library(lme4)
library(metafor)
library(piecewiseSEM)
library(QuantPsyc)
library(cluster)
library(factoextra)
library(lavaan)
library(dplyr)
library(cowplot)
library(tidyverse)

setwd("D:/Document/Cover crop")
make_pct <- function(x) (exp(x) - 1) * 100
font=theme(axis.title=element_text(size=13),axis.text = element_text(size=12,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12))#11.6inches
#####SEM#####
data <- read.csv("Prediction-fulldata-new.csv",row.names = 1)
data$study <- as.factor(data$study)
data$OF2 <- factor(data$OF2,levels = c("No","Yes"))
data$tillage <- factor(data$tillage,levels=c("conventional","conservation"))
data$type <- factor(data$type,levels=c("legume","non-legume","mixture"))
data$application <- factor(data$application,levels=c("incorporated","surface","removed"))

###upland###
upland <- data%>%filter(cropland.type=="upland")
upland$irrigation <- factor(upland$irrigation,levels=c("rainfed","irrigated"))

##agroecosystem multiservices calculation##
upland$AMS <- (upland$yieldfull*0.786*0.9+upland$SOCfull*0.341*0.6-
                 upland$N2Ofull*0.288*0.3-upland$CH4full*0.537*0.3+
                 upland$MWDfull*0.384*0.6)/(0.786*0.9+0.341*0.6+0.288*0.3+0.537*0.3+0.384*0.6)
                ##weight based on network strength and benefit factor from Manning et al. 2018

AMS_overall_upland <- lmer(AMS~1+(1|study),upland)
AMS_overall_upland_boot <- confint(AMS_overall_upland,method="boot")
AMS_overall_upland.df <- rbind.data.frame(AMS_overall_upland_boot)[3,]
AMS_overall_upland.df$mean <- (AMS_overall_upland.df$`2.5 %`+AMS_overall_upland.df$`97.5 %`)/2
AMS_overall_upland.df <- make_pct(AMS_overall_upland.df)
names(AMS_overall_upland.df) <- c("CI1","CI2","mean")
AMS_overall_upland.df$type <- "Upland"

p5 <- ggplot(AMS_overall_upland.df)+
  geom_point(aes(x=mean,y=type),color="#df3d2c",size=3.4)+
  geom_errorbar(aes(x=mean,xmin=CI1,xmax=CI2,y=type),color="#df3d2c", width=0, size=0.75)+
  geom_vline(aes(xintercept=0),linetype="dashed",colour="black")+
  xlab("Agroecosystem multiservices (%)")+
  theme_cowplot()+
  theme(legend.position = "none",axis.title.y = element_blank())+font
p5

## Climate
model1<-lm(AMS~MAT+MAP+AI, upland)
summary(model1)
AMS_MAT <-  summary(model1)$coefficients[2, 1]
AMS_MAP <-  summary(model1)$coefficients[3, 1]
AMS_AI <-  summary(model1)$coefficients[4, 1]
climate_AMS <- AMS_MAT * upland$MAT + AMS_MAP * upland$MAP + AMS_AI * upland$AI 
upland$climate <- climate_AMS
summary(lm(AMS~climate,upland))

## Soil
model2<-lm(AMS~BD+sand+clay+SOC+CN+pH, upland)
summary(model2)
AMS_BD <-  summary(model2)$coefficients[2, 1]
AMS_sand <-  summary(model2)$coefficients[3, 1]
AMS_clay <-  summary(model2)$coefficients[4, 1]
AMS_SOC <-  summary(model2)$coefficients[5, 1]
AMS_CN <-  summary(model2)$coefficients[6, 1]
AMS_pH <-  summary(model2)$coefficients[7, 1]
soil_AMS <- AMS_BD * upland$BD + AMS_sand * upland$sand + AMS_clay * upland$clay + 
            AMS_SOC * upland$SOC + AMS_CN * upland$CN + AMS_pH * upland$pH 
upland$soil <- soil_AMS
summary(lm(AMS~soil,upland))

## Microbe
model3<-lm(AMS~soil.biodiversity+MBC+FBratio, upland)
summary(model3)
AMS_soil.biodiversity <-  summary(model3)$coefficients[2, 1]
AMS_MBC <-  summary(model3)$coefficients[3, 1]
AMS_FBratio <-  summary(model3)$coefficients[4, 1]
microbe_AMS <- AMS_soil.biodiversity * upland$soil.biodiversity + 
              AMS_MBC * upland$MBC + AMS_FBratio * upland$FBratio
upland$microbe <- microbe_AMS
summary(lm(AMS~microbe,upland))

## Agriculture management
upland$OF2 <- as.numeric(upland$OF2)
upland$tillage <- as.numeric(upland$tillage)
upland$irrigation <- as.numeric(upland$irrigation)
model4<-lm(AMS~Nrate+OF2+tillage+irrigation, upland)
summary(model4)
AMS_Nrate <-  summary(model4)$coefficients[2, 1]
AMS_OF <-  summary(model4)$coefficients[3, 1]
AMS_tillage <-  summary(model4)$coefficients[4, 1]
AMS_irrigation <-  summary(model4)$coefficients[5, 1]
agriculture_AMS <- AMS_Nrate * upland$Nrate + AMS_OF * upland$OF2 + 
                  AMS_tillage * upland$tillage + AMS_irrigation * upland$irrigation
upland$agriculture<- agriculture_AMS
summary(lm(AMS~agriculture,upland))

## Cover crops
upland$type <- as.numeric(upland$type)
upland$application <- as.numeric(upland$application)
model5<-lm(AMS~type+application+richness+duration+cover.days+terminate.time, upland)
summary(model5)
AMS_type <-  summary(model5)$coefficients[2, 1]
AMS_application <-  summary(model5)$coefficients[3, 1]
AMS_richness <-  summary(model5)$coefficients[4, 1]
AMS_duration <-  summary(model5)$coefficients[5, 1]
AMS_cover.days <-  summary(model5)$coefficients[6, 1]
AMS_terminate.time <-  summary(model5)$coefficients[7, 1]
CC_AMS <- AMS_type * upland$type + AMS_application * upland$application + 
          AMS_richness * upland$richness + AMS_duration * upland$duration + 
          AMS_cover.days * upland$cover.days + AMS_terminate.time * upland$terminate.time
upland$CC <- CC_AMS
summary(lm(AMS~CC,upland))

write.csv(upland,"AMS-upland.csv")
# AES_SEM
upland_sem <- read.csv("AMS-upland.csv")
AMS_SEM.list_upland <- list(lme4::lmer(soil~climate+agriculture+CC+(1|study),upland_sem),
                            lme4::lmer(microbe~climate+soil+agriculture+(1|study),upland_sem),
                            lme4::lmer(AMS~climate+soil+microbe+agriculture+CC+(1|study),upland_sem))

AMS_SEM_upland <- as.psem(AMS_SEM.list_upland)
summary(AMS_SEM_upland,.progressBar = T)
rsquared(AMS_SEM_upland)
anova(AMS_SEM_upland)
fisherC(AMS_SEM_upland)

###paddy###
paddy <- data%>%filter(cropland.type=="paddy")
paddy$irrigation <- factor(paddy$irrigation,levels=c("rainfed","flooding","intermittent"))

##agroecosystem multiservices calculation##
paddy$AMS <- (paddy$yield*0.674*0.9+paddy$SOCrr*1.07*0.6-
                 paddy$N2O*0.362*0.3-paddy$CH4*0.9*0.3+
                 paddy$MWD*0.327*0.6)/(0.674*0.9+1.07*0.6+0.362*0.3+0.9*0.3+0.327*0.6)
                ##weight based on network strength and benefit factor from Manning et al. 2018

AMS_overall_paddy <- lmer(AMS~1+(1|study),paddy)
AMS_overall_paddy_boot <- confint(AMS_overall_paddy,method="boot")
AMS_overall_paddy.df <- rbind.data.frame(AMS_overall_paddy_boot)[3,]
AMS_overall_paddy.df$mean <- (AMS_overall_paddy.df$`2.5 %`+AMS_overall_paddy.df$`97.5 %`)/2
AMS_overall_paddy.df <- make_pct(AMS_overall_paddy.df)
names(AMS_overall_paddy.df) <- c("CI1","CI2","mean")
AMS_overall_paddy.df$type <- "Paddy"

p6 <- ggplot(AMS_overall_paddy.df)+
  geom_point(aes(x=mean,y=type),color="darkgray",size=3.4)+
  geom_errorbar(aes(x=mean,xmin=CI1,xmax=CI2,y=type),color="darkgray", width=0, size=0.75)+
  geom_vline(aes(xintercept=0),linetype="dashed",colour="black")+
  xlab("Agroecosystem multiservices (%)")+
  theme_cowplot()+
  theme(legend.position = "none",axis.title.y = element_blank())+font
p6

## Climate
model1<-lm(AMS~MAT+MAP+AI, paddy)
summary(model1)
AMS_MAT <-  summary(model1)$coefficients[2, 1]
AMS_MAP <-  summary(model1)$coefficients[3, 1]
AMS_AI <-  summary(model1)$coefficients[4, 1]
climate_AMS <- AMS_MAT * paddy$MAT + AMS_MAP * paddy$MAP + AMS_AI * paddy$AI 
paddy$climate <- climate_AMS
summary(lm(AMS~climate,paddy))

## Soil
model2<-lm(AMS~BD+sand+clay+SOC+CN+pH, paddy)
summary(model2)
AMS_BD <-  summary(model2)$coefficients[2, 1]
AMS_sand <-  summary(model2)$coefficients[3, 1]
AMS_clay <-  summary(model2)$coefficients[4, 1]
AMS_SOC <-  summary(model2)$coefficients[5, 1]
AMS_CN <-  summary(model2)$coefficients[6, 1]
AMS_pH <-  summary(model2)$coefficients[7, 1]
soil_AMS <- AMS_BD * paddy$BD + AMS_sand * paddy$sand + AMS_clay * paddy$clay + 
  AMS_SOC * paddy$SOC + AMS_CN * paddy$CN + AMS_pH * paddy$pH 
paddy$soil <- soil_AMS
summary(lm(AMS~soil,paddy))

## Microbe
model3<-lm(AMS~soil.biodiversity+MBC+FBratio, paddy)
summary(model3)
AMS_soil.biodiversity <-  summary(model3)$coefficients[2, 1]
AMS_MBC <-  summary(model3)$coefficients[3, 1]
AMS_FBratio <-  summary(model3)$coefficients[4, 1]
microbe_AMS <- AMS_soil.biodiversity * paddy$soil.biodiversity + 
  AMS_MBC * paddy$MBC + AMS_FBratio * paddy$FBratio
paddy$microbe <- microbe_AMS
summary(lm(AMS~microbe,paddy))

## Agriculture management
paddy$OF2 <- as.numeric(paddy$OF2)
paddy$tillage <- as.numeric(paddy$tillage)
paddy$irrigation <- as.numeric(paddy$irrigation)
model4<-lm(AMS~Nrate+OF2+tillage+irrigation, paddy)
summary(model4)
AMS_Nrate <-  summary(model4)$coefficients[2, 1]
AMS_OF <-  summary(model4)$coefficients[3, 1]
AMS_tillage <-  summary(model4)$coefficients[4, 1]
AMS_irrigation <-  summary(model4)$coefficients[5, 1]
agriculture_AMS <- AMS_Nrate * paddy$Nrate + AMS_OF * paddy$OF2 + 
  AMS_tillage * paddy$tillage + AMS_irrigation * paddy$irrigation
paddy$agriculture<- agriculture_AMS
summary(lm(AMS~agriculture,paddy))

## Cover crops
paddy$type <- as.numeric(paddy$type)
paddy$application <- as.numeric(paddy$application)
model5<-lm(AMS~type+application+richness+duration+cover.days+terminate.time, paddy)
summary(model5)
AMS_type <-  summary(model5)$coefficients[2, 1]
AMS_application <-  summary(model5)$coefficients[3, 1]
AMS_richness <-  summary(model5)$coefficients[4, 1]
AMS_duration <-  summary(model5)$coefficients[5, 1]
AMS_cover.days <-  summary(model5)$coefficients[6, 1]
AMS_terminate.time <-  summary(model5)$coefficients[7, 1]
CC_AMS <- AMS_type * paddy$type + AMS_application * paddy$application + 
  AMS_richness * paddy$richness + AMS_duration * paddy$duration + 
  AMS_cover.days * paddy$cover.days + AMS_terminate.time * paddy$terminate.time
paddy$CC <- CC_AMS
summary(lm(AMS~CC,paddy))

write.csv(paddy,"AMS-paddy.csv")
# AES_SEM
paddy_sem <- read.csv("AMS-paddy.csv")
AMS_SEM.list_paddy <- list(lme4::lmer(soil~climate+agriculture+CC+(1|study),paddy_sem),
                            lme4::lmer(microbe~climate+soil+(1|study),paddy_sem),
                            lme4::lmer(AMS~climate+soil+microbe+agriculture+CC+(1|study),paddy_sem))

AMS_SEM_paddy <- as.psem(AMS_SEM.list_paddy)
summary(AMS_SEM_paddy,.progressBar = T)
rsquared(AMS_SEM_paddy)
anova(AMS_SEM_paddy)
fisherC(AMS_SEM_paddy)

#####Standardized effect plot#####
SEM.effect <- read.csv("SEM effect.csv")
SEM.effect$type <- factor(SEM.effect$type,levels = c("climate","soil","microbe","agriculture","CC"),
                          labels = c("Climate","Soil","Microbe",
                                     "Agricultural management","\nCC practice\ncharacteristics"))
SEM.effect$effect <- factor(SEM.effect$effect,levels = c("direct","indirect","total"),
                            labels = c("Direct effect","Indirect effect","Total effect"))
##upland##
upland.effect <- SEM.effect%>%filter(cropland.type=="upland")

p3 <- ggplot(upland.effect,aes(y = type, x = total, color=type))+
  geom_segment(aes(y=type,yend = type), xend=0, size=5,alpha=0.5)+
  geom_point(size=4.5)+
  scale_y_discrete(limits=rev(levels(upland.effect$type)))+
  scale_color_manual(values=c("#2D5F8A","#966729","#7E3F5F", "#4A4849","#5A7B29"))+
  theme_cowplot()+font+
  theme(legend.position = "none",axis.title.y = element_blank())+
  xlab("Standardized total effect from SEM")
p3

##paddy##
paddy.effect <- SEM.effect%>%filter(cropland.type=="paddy")

p4 <- ggplot(paddy.effect,aes(y = type, x = total, color=type))+
  geom_segment(aes(y=type,yend = type), xend=0, size=5,alpha=0.5)+
  geom_point(size=4.5)+
  geom_vline(xintercept = 0,color="black")+
  scale_y_discrete(limits=rev(levels(paddy.effect$type)))+
  scale_color_manual(values=c("#2D5F8A","#966729","#7E3F5F", "#4A4849","#5A7B29"))+
  theme_cowplot()+font+
  theme(legend.position = "none",axis.title.y = element_blank())+
  xlab("Standardized total effect from SEM")
p4


ggdraw()+
  draw_plot(Over_c_upland, x=0, y=0.65, width = 0.5, height = 0.35)+
  draw_plot(node_g_upland, x=0, y=2/3-0.1, width = 0.2, height = 0.2)+
  draw_plot(p5, x=0.185, y=2/3-0.1, width =0.31, height = 0.1)+
  draw_plot(p3, x=0, y=0, width =0.5, height = 0.2)+
  draw_plot(Over_c_paddy, x=0.5, y=0.65, width = 0.5, height = 0.35)+
  draw_plot(node_g_paddy, x=0.5, y=2/3-0.1, width = 0.2, height = 0.2)+
  draw_plot(p6, x=0.685, y=2/3-0.1, width = 0.31, height = 0.1)+
  draw_plot(p4, x=0.5, y=0, width =0.5, height = 0.2)+
  draw_label("Yield",color = "black",size=12,x=0.251,y=0.826,fontface = "bold")+
  draw_label(expression(bold(SOC[stock])),color = "black",size=12,x=0.452,y=0.844)+
  draw_label(expression(bold(N[2]*O)),color = "black",size=12,x=0.302,y=0.689)+
  draw_label(expression(bold(CH[4])),color = "black",size=12,x=0.05,y=0.87)+
  draw_label("MWD",color = "black",size=12,x=0.322,y=0.962,fontface = "bold")+
  draw_label(expression(bold(SOC[stock])),color = "black",size=12,x=0.751,y=0.826)+
  draw_label("Yield",color = "black",size=12,x=0.952,y=0.844,fontface = "bold")+
  draw_label(expression(bold(CH[4])),color = "black",size=12,x=0.802,y=0.689)+
  draw_label(expression(bold(N[2]*O)),color = "black",size=12,x=0.55,y=0.87)+
  draw_label("MWD",color = "black",size=12,x=0.822,y=0.962,fontface = "bold")+
  draw_label("Upland",color = "black",size=16,x=0.25,y=0.985,fontface = "bold")+
  draw_label("Paddy",color = "black",size=16,x=0.75,y=0.985,fontface = "bold")+
  draw_plot_label(label = c("a","b","c","d","e","f","g","h"), size = 15,
                  x=c(0.005,0.505,0.225,0.725,0.005,0.505,0.005,0.505), 
                  y=c(0.985,0.985,2/3+0.01,2/3+0.01,0.575,0.575,0.2,0.2))##10.2*11.6
