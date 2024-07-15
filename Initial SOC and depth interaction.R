library(ggrepel)
library(rcartocolor)
library(metafor)
library(boot)
library(parallel)
library(doParallel)
library(agricolae)
library(readxl)
library(broom)
library(ggforestplot)
library(funModeling)
library(dplyr)
library(cowplot)

doParallel::registerDoParallel(20)
setwd("D:/资料/Cover crop")
make_pct <- function(x) (exp(x) - 1) * 100
font=theme(axis.title=element_text(size=13),axis.text = element_text(size=12,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12))#11.6inches
a <- read.csv("Co-management of water and N.csv")
a$ID <- as.factor(a$ID)
a$study <- as.factor(a$study)


###Plot###


###Calculation###
###Interaction###
a<- read.csv("Initial SOC and depth interaction.csv")
a$study <- as.factor(a$ID)
a$study <- as.factor(a$study)
a$layer2 <- factor(a$layer2,levels=c("0-10","10-30","30-60","60-100",">100"))
#a <- a%>%filter(layer2!="30-60")%>%filter(layer2!="60-100")%>%filter(layer2!=">100")
a$SOC2 <- factor(a$SOC2,levels=c("low","moderate","high"))
#a$layer2 <- as.numeric(a$layer2)
#OF
SOC.func5 <- function(a, index) {
  SOC <- rma.mv(rrSOC,varSOC,data=a,subset=index,mods = ~layer2*SOC-1,random=~1|study/ID)
  c(SOC$beta, SOC$se^2)}

a1 <- a%>%filter(layer2=="0-10")
a2 <- a%>%filter(layer2=="10-30")
a3 <- a%>%filter(layer2=="30-60")
a4 <- a%>%filter(layer2!="60-100")%>%filter(layer2!=">100")

model1 <- rma.mv(rrSOC,varSOC,data=a1,mods = ~SOC*pH3,random=~1|study/ID)
model2 <- rma.mv(rrSOC,varSOC,data=a2,mods = ~SOC*pH3,random=~1|study/ID)
model3 <- rma.mv(rrSOC,varSOC,data=a3,mods = ~SOC*pH3,random=~1|study/ID)

model4 <- rma.mv(rrSOC,varSOC,data=a4,mods = ~SOC*pH3*depth2,random=~1|study/ID)

AIC(model1,model2,model3,model4)


ggplot(a,aes(x=SOC,y=rrSOC))+
  geom_point()+
  stat_smooth()+
  facet_wrap(~layer2,scales = "free_x")
  





