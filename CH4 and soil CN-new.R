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

setwd("D:/Document/Cover crop")
make_pct <- function(x) (exp(x) - 1) * 100
font=theme(axis.title=element_text(size=13),axis.text = element_text(size=12,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12))#11.6inches

###Calculation###
a <- read.csv("CH4 and soil CN-new.csv")
a$ID <- factor(a$ID)
a$study <- factor(a$study)

upland <- subset(a,cropland.type=="upland")
paddy <- subset(a,cropland.type=="paddy")

upland.func1 <- function(upland, index) {
  upland <- rma.mv(rrCH4,varCH4,data=upland,subset=index,mods=~CN,random=~1|study/ID)
  c(upland$beta, upland$se^2)}
paddy.func2 <- function(paddy, index) {
  paddy <- rma.mv(rrCH4,varCH4,data=paddy,subset=index,mods=~CN,random=~1|study/ID)
  c(paddy$beta, paddy$se^2)}

upland_boot1 <- boot(upland, upland.func1, R=49)
paddy_boot2 <- boot(paddy, paddy.func2, R=49)

upland_ci <- tidy(upland_boot1,conf.int=T,conf.method = "perc")
upland_ci <- data.frame(upland_ci)
upland_ci$mean <- (upland_ci$conf.low+upland_ci$conf.high)/2
upland_ci <- upland_ci[2,3:6]

paddy_ci2 <- tidy(paddy_boot2,conf.int=T,conf.method = "perc")
paddy_ci2 <- data.frame(paddy_ci2)
paddy_ci2$mean <- (paddy_ci2$conf.low+paddy_ci2$conf.high)/2
paddy_ci2 <- paddy_ci2[2,3:6]

rma.mv(rrCH4,varCH4,data=upland,mods=~CN,random=~1|study/ID)
rma.mv(rrCH4,varCH4,data=paddy,mods=~CN,random=~1|study/ID)


paddy.flooding <- subset(paddy,irrigation2=="flooding")
paddy.intermittent <- subset(paddy,irrigation2=="intermittent")

paddy.flooding.func1 <- function(paddy.flooding, index) {
  paddy.flooding <- rma.mv(rrCH4,varCH4,data=paddy.flooding,subset=index,mods=~CN,random=~1|study/ID)
  c(paddy.flooding$beta, paddy.flooding$se^2)}
paddy.intermittent.func1 <- function(paddy.intermittent, index) {
  paddy.intermittent <- rma.mv(rrCH4,varCH4,data=paddy.intermittent,subset=index,mods=~CN,random=~1|study/ID)
  c(paddy.intermittent$beta, paddy.intermittent$se^2)}

paddy.flooding_boot1 <- boot(paddy.flooding, paddy.flooding.func1, R=49)
paddy.intermittent_boot1 <- boot(paddy.intermittent, paddy.intermittent.func1, R=49)

paddy.flooding_ci <- tidy(paddy.flooding_boot1,conf.int=T,conf.method = "perc")
paddy.flooding_ci <- data.frame(paddy.flooding_ci)
paddy.flooding_ci$mean <- (paddy.flooding_ci$conf.low+paddy.flooding_ci$conf.high)/2
paddy.flooding_ci <- paddy.flooding_ci[2,3:6]
paddy.intermittent_ci <- tidy(paddy.intermittent_boot1,conf.int=T,conf.method = "perc")
paddy.intermittent_ci <- data.frame(paddy.intermittent_ci)
paddy.intermittent_ci$mean <- (paddy.intermittent_ci$conf.low+paddy.intermittent_ci$conf.high)/2
paddy.intermittent_ci <- paddy.intermittent_ci[2,3:6]


###Plot###
data <- read.csv("CH4 and irrigation.csv")
data$varible <- factor(data$varible,levels = c("upland","paddy","intermittent","flooding"),
                       labels = c("Upland","Paddy","Intermittent","Flooding"))
data$type <- c("Cropland type","Cropland type","Irrigation (paddy)","Irrigation (paddy)")
data$p <- c(0.3,0.01,0.01,0.3)

forestplot(df=data,name = varible,estimate = mean,se=std.error,colour=varible,pvalue = p)+
  ggforce::facet_col(~type,scales = "free_y",space="free")+
  scale_color_manual(values = c("steelblue","#e30528","darkgreen","orange"))+
  xlab(expression(paste("Bootstrapped slope of soil C:N to ",CH[4],sep = "")))+font+
  theme(legend.position = "none",axis.title.y = element_blank())##5.4*5.4


