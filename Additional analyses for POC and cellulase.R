library(ggplot2)
library(metafor)
library(grid)
library(patchwork)
library(cowplot)
library(boot)
library(agricolae)
library(readxl)
library(broom)
library(ggpmisc)
library(rstatix)
library(dplyr)

setwd("D:/Document/Cover crop")
font=theme(axis.title=element_text(size=13),axis.text = element_text(size=12,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12),plot.subtitle = element_text(size=13))#11.6inches

a <- read.csv("RR-POC.csv")
b <- read.csv("RR-MAOC.csv")
c <- read.csv("RR-cellulase.csv")

POC <- escalc(measure="ROM",data=a,m1i=POC.t,sd1i=POC.tsd,n1i=POC.tn,m2i=POC.ck,sd2i=POC.csd,n2i=POC.cn)
write.csv(POC, file="POC-RR.csv")
MAOC <- escalc(measure="ROM",data=b,m1i=MAOC.t,sd1i=MAOC.tsd,n1i=MAOC.tn,m2i=MAOC.ck,sd2i=MAOC.csd,n2i=MAOC.cn)
write.csv(MAOC, file="MAOC-RR.csv")
cellulase <- escalc(measure="ROM",data=c,m1i=cellulase.t,sd1i=cellulase.tsd,n1i=cellulase.tn,m2i=cellulase.ck,sd2i=cellulase.csd,n2i=cellulase.cn)
write.csv(cellulase, file="cellulase-RR.csv")


make_pct <- function(x) (exp(x) - 1) * 100

a <- read.csv("POC and MAOC.csv")
a$ID <- as.factor(a$ID)
a$study <- as.factor(a$study)
a$rrPOC.MAOC <- a$rrPOC-a$rrMAOC
a$varPOC.MAOC <- a$varPOC+a$varMAOC
aPOC <- na.omit(a[,1:28])
aMAOC <- na.omit(a[,c(1:20,29:36)])
aPOC.MAOC <- na.omit(a[,c(1:20,37:38)]) 
b <- read.csv("enzyme.csv")
b$ID <- as.factor(b$ID)
b$study <- as.factor(b$study)

##Overall##
cellulase.func1 <- function(b, index) {
  cellulase <- rma.mv(rrcellulase,varcellulase,data=b,subset=index,random=~1|study/ID)
  c(cellulase$beta, cellulase$se^2)}
POC.func1 <- function(aPOC, index) {
  POC <- rma.mv(rrPOC,varPOC,data=aPOC,subset=index,random=~1|study/ID,)
  c(POC$beta, POC$se^2)}
MAOC.func1 <- function(aMAOC, index) {
  MAOC <- rma.mv(rrMAOC,varMAOC,data=aMAOC,subset=index,random=~1|study/ID)
  c(MAOC$beta, MAOC$se^2)}
POC.MAOC.func1 <- function(aPOC.MAOC, index) {
  POC.MAOC <- rma.mv(rrPOC.MAOC,varPOC.MAOC,data=aPOC.MAOC,subset=index,random=~1|study/ID)
  c(POC.MAOC$beta, POC.MAOC$se^2)}

cellulase_boot <- boot(b, cellulase.func1, R=499)
POC_boot <- boot(aPOC, POC.func1, R=499)
MAOC_boot <- boot(aMAOC, MAOC.func1, R=499)
POC.MAOC_boot <- boot(aPOC.MAOC, POC.MAOC.func1, R=499)

cellulase_ci <- boot.ci(cellulase_boot, type = "perc")
cellulase_ci <- data.frame(cellulase_ci$percent)
cellulase_ci$mean <- (cellulase_ci$V4+cellulase_ci$V5)/2
cellulase_ci <- cellulase_ci[,4:6]
cellulase_output <- make_pct(cellulase_ci)
POC_ci <- boot.ci(POC_boot, type = "perc")
POC_ci <- data.frame(POC_ci$percent)
POC_ci$mean <- (POC_ci$V4+POC_ci$V5)/2
POC_ci <- POC_ci[,4:6]
POC_output <- make_pct(POC_ci)
MAOC_ci <- boot.ci(MAOC_boot, type = "perc")
MAOC_ci <- data.frame(MAOC_ci$percent)
MAOC_ci$mean <- (MAOC_ci$V4+MAOC_ci$V5)/2
MAOC_ci <- MAOC_ci[,4:6]
MAOC_output <- make_pct(MAOC_ci)
POC.MAOC_ci <- boot.ci(POC.MAOC_boot, type = "perc")
POC.MAOC_ci <- data.frame(POC.MAOC_ci$percent)
POC.MAOC_ci$mean <- (POC.MAOC_ci$V4+POC.MAOC_ci$V5)/2
POC.MAOC_ci <- POC.MAOC_ci[,4:6]

c <- rbind.data.frame(cellulase_output,POC_output,MAOC_output,POC.MAOC_output)
write.csv(c,"POC and enzyme-overall.csv")


##climate.zone##
cellulase.func3 <- function(b, index) {
  cellulase <- rma.mv(rrcellulase,varcellulase,data=b,subset=index, mods=~climate.zone-1,random=~1|study/ID)
  c(cellulase$beta, cellulase$se^2)}
POC.func3 <- function(aPOC, index) {
  POC <- rma.mv(rrPOC,varPOC,data=aPOC,subset=index, mods=~climate.zone-1,random=~1|study/ID,)
  c(POC$beta, POC$se^2)}
MAOC.func3 <- function(aMAOC, index) {
  MAOC <- rma.mv(rrMAOC,varMAOC,data=aMAOC,subset=index, mods=~climate.zone-1,random=~1|study/ID)
  c(MAOC$beta, MAOC$se^2)}
POC.MAOC.func3 <- function(aPOC.MAOC, index) {
  POC.MAOC <- rma.mv(rrPOC.MAOC,varPOC.MAOC,data=aPOC.MAOC,subset=index, mods=~climate.zone-1,random=~1|study/ID)
  c(POC.MAOC$beta, POC.MAOC$se^2)}

cellulase_boot <- boot(dplyr::filter(b,climate.zone!="tropical"), cellulase.func3, R=49)
POC_boot <- boot(dplyr::filter(aPOC,climate.zone!="tropical"), POC.func3, R=49)
MAOC_boot <- boot(dplyr::filter(aMAOC,climate.zone!="tropical"), MAOC.func3, R=49)
POC.MAOC_boot <- boot(dplyr::filter(aPOC.MAOC,climate.zone!="tropical"), POC.MAOC.func3, R=49)

cellulase_ci <- tidy(cellulase_boot,conf.int=T,conf.method = "perc")
cellulase_ci <- data.frame(cellulase_ci)
cellulase_ci$mean <- (cellulase_ci$conf.low+cellulase_ci$conf.high)/2
cellulase_ci <- cellulase_ci[1:3,4:6]
cellulase_output <- make_pct(cellulase_ci)
POC_ci <- tidy(POC_boot,conf.int=T,conf.method = "perc")
POC_ci <- data.frame(POC_ci)
POC_ci$mean <- (POC_ci$conf.low+POC_ci$conf.high)/2
POC_ci <- POC_ci[1:3,4:6]
POC_output <- make_pct(POC_ci)
MAOC_ci <- tidy(MAOC_boot,conf.int=T,conf.method = "perc")
MAOC_ci <- data.frame(MAOC_ci)
MAOC_ci$mean <- (MAOC_ci$conf.low+MAOC_ci$conf.high)/2
MAOC_ci <- MAOC_ci[1:3,4:6]
MAOC_output <- make_pct(MAOC_ci)
POC.MAOC_ci <- tidy(POC.MAOC_boot,conf.int=T,conf.method = "perc")
POC.MAOC_ci <- data.frame(POC.MAOC_ci)
POC.MAOC_ci$mean <- (POC.MAOC_ci$conf.low+POC.MAOC_ci$conf.high)/2
POC.MAOC_ci <- POC.MAOC_ci[1:3,4:6]
POC.MAOC_output <- make_pct(POC.MAOC_ci)

c <- rbind.data.frame(cellulase_output,POC_output,MAOC_output,POC.MAOC_output)
write.csv(c,"POC and enzyme-climate.zone.csv")

##soil.texture##
cellulase.func3 <- function(b, index) {
  cellulase <- rma.mv(rrcellulase,varcellulase,data=b,subset=index, mods=~soil.texture-1,random=~1|study/ID)
  c(cellulase$beta, cellulase$se^2)}
POC.func3 <- function(aPOC, index) {
  POC <- rma.mv(rrPOC,varPOC,data=aPOC,subset=index, mods=~soil.texture-1,random=~1|study/ID,)
  c(POC$beta, POC$se^2)}
MAOC.func3 <- function(aMAOC, index) {
  MAOC <- rma.mv(rrMAOC,varMAOC,data=aMAOC,subset=index, mods=~soil.texture-1,random=~1|study/ID)
  c(MAOC$beta, MAOC$se^2)}
POC.MAOC.func3 <- function(aPOC.MAOC, index) {
  POC.MAOC <- rma.mv(rrPOC.MAOC,varPOC.MAOC,data=aPOC.MAOC,subset=index, mods=~soil.texture-1,random=~1|study/ID)
  c(POC.MAOC$beta, POC.MAOC$se^2)}

cellulase_boot <- boot(dplyr::filter(b,soil.texture!="sandy"), cellulase.func3, R=49)
POC_boot <- boot(dplyr::filter(aPOC,soil.texture!="sandy"), POC.func3, R=49)
MAOC_boot <- boot(dplyr::filter(aMAOC,soil.texture!="sandy"), MAOC.func3, R=49)
POC.MAOC_boot <- boot(dplyr::filter(aPOC.MAOC,soil.texture!="sandy"), POC.MAOC.func3, R=49)

cellulase_ci <- tidy(cellulase_boot,conf.int=T,conf.method = "perc")
cellulase_ci <- data.frame(cellulase_ci)
cellulase_ci$mean <- (cellulase_ci$conf.low+cellulase_ci$conf.high)/2
cellulase_ci <- cellulase_ci[1:3,4:6]
cellulase_output <- make_pct(cellulase_ci)
POC_ci <- tidy(POC_boot,conf.int=T,conf.method = "perc")
POC_ci <- data.frame(POC_ci)
POC_ci$mean <- (POC_ci$conf.low+POC_ci$conf.high)/2
POC_ci <- POC_ci[1:3,4:6]
POC_output <- make_pct(POC_ci)
MAOC_ci <- tidy(MAOC_boot,conf.int=T,conf.method = "perc")
MAOC_ci <- data.frame(MAOC_ci)
MAOC_ci$mean <- (MAOC_ci$conf.low+MAOC_ci$conf.high)/2
MAOC_ci <- MAOC_ci[1:3,4:6]
MAOC_output <- make_pct(MAOC_ci)
POC.MAOC_ci <- tidy(POC.MAOC_boot,conf.int=T,conf.method = "perc")
POC.MAOC_ci <- data.frame(POC.MAOC_ci)
POC.MAOC_ci$mean <- (POC.MAOC_ci$conf.low+POC.MAOC_ci$conf.high)/2
POC.MAOC_ci <- POC.MAOC_ci[1:3,4:6]
POC.MAOC_output <- make_pct(POC.MAOC_ci)

c <- rbind.data.frame(cellulase_output,POC_output,MAOC_output,POC.MAOC_output)
write.csv(c,"POC and enzyme-soil.texture.csv")

##CC.type##
cellulase.func5 <- function(b, index) {
  cellulase <- rma.mv(rrcellulase,varcellulase,data=b,subset=index, mods=~CC.type-1,random=~1|study/ID)
  c(cellulase$beta, cellulase$se^2)}
POC.func5 <- function(aPOC, index) {
  POC <- rma.mv(rrPOC,varPOC,data=aPOC,subset=index, mods=~CC.type-1,random=~1|study/ID,)
  c(POC$beta, POC$se^2)}
MAOC.func5 <- function(aMAOC, index) {
  MAOC <- rma.mv(rrMAOC,varMAOC,data=aMAOC,subset=index, mods=~CC.type-1,random=~1|study/ID)
  c(MAOC$beta, MAOC$se^2)}
POC.MAOC.func5 <- function(aPOC.MAOC, index) {
  POC.MAOC <- rma.mv(rrPOC.MAOC,varPOC.MAOC,data=aPOC.MAOC,subset=index, mods=~CC.type-1,random=~1|study/ID)
  c(POC.MAOC$beta, POC.MAOC$se^2)}

cellulase_boot <- boot(b, cellulase.func5, R=49)
POC_boot <- boot(aPOC, POC.func5, R=49)
MAOC_boot <- boot(aMAOC, MAOC.func5, R=49)
POC.MAOC_boot <- boot(aPOC.MAOC, POC.MAOC.func5, R=49)

cellulase_ci <- tidy(cellulase_boot,conf.int=T,conf.method = "perc")
cellulase_ci <- data.frame(cellulase_ci)
cellulase_ci$mean <- (cellulase_ci$conf.low+cellulase_ci$conf.high)/2
cellulase_ci <- cellulase_ci[1:3,4:6]
cellulase_output <- make_pct(cellulase_ci)
POC_ci <- tidy(POC_boot,conf.int=T,conf.method = "perc")
POC_ci <- data.frame(POC_ci)
POC_ci$mean <- (POC_ci$conf.low+POC_ci$conf.high)/2
POC_ci <- POC_ci[1:3,4:6]
POC_output <- make_pct(POC_ci)
MAOC_ci <- tidy(MAOC_boot,conf.int=T,conf.method = "perc")
MAOC_ci <- data.frame(MAOC_ci)
MAOC_ci$mean <- (MAOC_ci$conf.low+MAOC_ci$conf.high)/2
MAOC_ci <- MAOC_ci[1:3,4:6]
MAOC_output <- make_pct(MAOC_ci)
POC.MAOC_ci <- tidy(POC.MAOC_boot,conf.int=T,conf.method = "perc")
POC.MAOC_ci <- data.frame(POC.MAOC_ci)
POC.MAOC_ci$mean <- (POC.MAOC_ci$conf.low+POC.MAOC_ci$conf.high)/2
POC.MAOC_ci <- POC.MAOC_ci[1:3,4:6]
POC.MAOC_output <- make_pct(POC.MAOC_ci)

c <- rbind.data.frame(cellulase_output,POC_output,MAOC_output,POC.MAOC_output)
write.csv(c,"POC and enzyme-CC.type.csv")

##residue.management##
cellulase.func6 <- function(b, index) {
  cellulase <- rma.mv(rrcellulase,varcellulase,data=b,subset=index, mods=~residue.management-1,random=~1|study/ID)
  c(cellulase$beta, cellulase$se^2)}
POC.func6 <- function(aPOC, index) {
  POC <- rma.mv(rrPOC,varPOC,data=aPOC,subset=index, mods=~residue.management-1,random=~1|study/ID)
  c(POC$beta, POC$se^2)}
MAOC.func6 <- function(aMAOC, index) {
  MAOC <- rma.mv(rrMAOC,varMAOC,data=aMAOC,subset=index, mods=~residue.management-1,random=~1|study/ID)
  c(MAOC$beta, MAOC$se^2)}
POC.MAOC.func6 <- function(aPOC.MAOC, index) {
  POC.MAOC <- rma.mv(rrPOC.MAOC,varPOC.MAOC,data=aPOC.MAOC,subset=index, mods=~residue.management-1,random=~1|study/ID)
  c(POC.MAOC$beta, POC.MAOC$se^2)}

cellulase_boot <- boot(b, cellulase.func6, R=49)
POC_boot <- boot(aPOC, POC.func6, R=49)
MAOC_boot <- boot(aMAOC, MAOC.func6, R=49)
POC.MAOC_boot <- boot(aPOC.MAOC, POC.MAOC.func6, R=49)

cellulase_ci <- tidy(cellulase_boot,conf.int=T,conf.method = "perc")
cellulase_ci <- data.frame(cellulase_ci)
cellulase_ci$mean <- (cellulase_ci$conf.low+cellulase_ci$conf.high)/2
cellulase_ci <- cellulase_ci[1:2,4:6]
cellulase_output <- make_pct(cellulase_ci)
POC_ci <- tidy(POC_boot,conf.int=T,conf.method = "perc")
POC_ci <- data.frame(POC_ci)
POC_ci$mean <- (POC_ci$conf.low+POC_ci$conf.high)/2
POC_ci <- POC_ci[1:2,4:6]
POC_output <- make_pct(POC_ci)
MAOC_ci <- tidy(MAOC_boot,conf.int=T,conf.method = "perc")
MAOC_ci <- data.frame(MAOC_ci)
MAOC_ci$mean <- (MAOC_ci$conf.low+MAOC_ci$conf.high)/2
MAOC_ci <- MAOC_ci[1:2,4:6]
MAOC_output <- make_pct(MAOC_ci)
POC.MAOC_ci <- tidy(POC.MAOC_boot,conf.int=T,conf.method = "perc")
POC.MAOC_ci <- data.frame(POC.MAOC_ci)
POC.MAOC_ci$mean <- (POC.MAOC_ci$conf.low+POC.MAOC_ci$conf.high)/2
POC.MAOC_ci <- POC.MAOC_ci[1:2,4:6]
POC.MAOC_output <- make_pct(POC.MAOC_ci)

c <- rbind.data.frame(cellulase_output,POC_output,MAOC_output,POC.MAOC_output)
write.csv(c,"POC and enzyme-residue.management.csv")

##soil.layer for enzyme##
cellulase.func7 <- function(b, index) {
  cellulase <- rma.mv(rrcellulase,varcellulase,data=b, subset=index, mods=~soil.layer-1,random=~1|study/ID)
  c(cellulase$beta, cellulase$se^2)}

cellulase_boot <- boot(b, cellulase.func7, R=499)

cellulase_ci <- tidy(cellulase_boot,conf.int=T,conf.method = "perc")
cellulase_ci <- data.frame(cellulase_ci)
cellulase_ci$mean <- (cellulase_ci$conf.low+cellulase_ci$conf.high)/2
cellulase_ci <- cellulase_ci[1:3,4:6]
cellulase_output <- make_pct(cellulase_ci)

c <- rbind.data.frame(cellulase_output)
write.csv(c,"enzyme-soil.layer.csv")


##N.rate for cellulase##
p1 <- ggplot(b, aes(x=Nrate..kg.N.ha., y=rrcellulase,color=factor(cropland.type,
                                                                  levels=c("upland","paddy"),labels = c("Upland","Paddy"))))+
  geom_point(position=position_jitter(0.17),size=3.6,alpha=0.65)+
  geom_smooth(method = "lm", 
              formula = y ~ poly(x, 1, raw = TRUE),se=F)+
  geom_hline(yintercept = 0, color = "gray50", linetype = "dashed") + 
  scale_color_manual(values = c("orange","darkgreen"))+
  stat_poly_eq(aes(label = paste(..rr.label..,..p.value.label..,sep="*\", \"*")),
               formula = y ~ poly(x, 1, raw = TRUE), parse = T,label.x = "right",label.y = "top")+
  theme_cowplot()+
  labs(x="N rate (kg/ha)",y=expression(paste(Ln,italic(RR)," of cellulase",sep="")),color="Cropland type")+font+
  theme(legend.position="top",legend.title = element_text(size=13))
p1


###Plot for enzyme###
dat1 <- read.csv("Plot-enzyme.csv")
dat1.1 <- dplyr::filter(dat1,type=="Overall")
dat1.2 <- dat1[2:4,]
dat1.3 <- dat1[5:6,]

p2 <- ggplot(dat1.1)+ 
  geom_point(aes(x=type, y=mean),color="steelblue",stat="identity",size=3.6)+ ##画数据点
  geom_errorbar(aes(x=type,ymin=CI1, ymax=CI2),color="steelblue", width=0.1, size=0.5)+ ##画95%CI
  geom_text(aes(label=n, x=type, y=CI2+1,vjust=0), col="black", size=3.6)+  ##添加数据量
  theme_cowplot()+
  theme(legend.position="none")+  ##格式
  #scale_colour_manual(values=c("#e47b79","#a9c3e0"))   ##格式
  geom_hline(aes(yintercept=0),linetype="dashed",colour="black")+ ##在0画虚线
  theme(strip.background = element_rect(fill = "lightgray"),panel.grid = element_blank())+
  labs(y="CC effect on cellulase (%)",subtitle = " ")+
  theme(axis.title.x = element_blank())+font
p2

p3 <- ggplot(dat1.2)+ 
  geom_point(aes(x=type, y=mean),color="steelblue",stat="identity",size=3.6)+ ##画数据点
  geom_errorbar(aes(x=type,ymin=CI1, ymax=CI2),color="steelblue", width=0.2, size=0.5)+ ##画95%CI
  geom_text(aes(label=n, x=type, y=CI2+1,vjust=0), col="black", size=3.6)+  ##添加数据量
  theme_cowplot()+
  theme(legend.position="none")+  ##格式
  #scale_colour_manual(values=c("#e47b79","#a9c3e0"))   ##格式
  geom_hline(aes(yintercept=0),linetype="dashed",colour="black")+ ##在0画虚线
  theme(strip.background = element_rect(fill = "lightgray"),panel.grid = element_blank())+
  labs(y="CC effect on cellulase (%)",subtitle = "Soil depth")+
  theme(axis.title.x = element_blank())+font
p3

p4 <- ggplot(dat1.3)+ 
  geom_point(aes(x=type, y=mean),color="steelblue",stat="identity",size=3.6)+ ##画数据点
  geom_errorbar(aes(x=type,ymin=CI1, ymax=CI2),color="steelblue", width=0.2, size=0.5)+ ##画95%CI
  geom_text(aes(label=n, x=type, y=CI2+1,vjust=0), col="black", size=3.6)+  ##添加数据量
  scale_x_discrete(limits = c("Incorporated","Surface"),
                                 labels=c("Conventional/\nIncorporated","No-tillage/\nSurface"))+  ##转换x-y，变量排序
  theme_cowplot()+
  theme(legend.position="none")+  ##格式
  #scale_colour_manual(values=c("#e47b79","#a9c3e0"))   ##格式
  geom_hline(aes(yintercept=0),linetype="dashed",colour="black")+ ##在0画虚线
  theme(strip.background = element_rect(fill = "lightgray"),panel.grid = element_blank())+
  labs(y="CC effect on cellulase (%)",subtitle = "Tillage and residue management")+
  theme(axis.title.x = element_blank())+font
p4

ggdraw()+ 
  draw_plot(p2, x=0, y=0.525, width = 0.5, height = 0.475)+
  draw_plot(p4, x=0, y=0, width = 0.5, height = 0.525)+
  draw_plot(p3, x=0.5, y=0.525, width = 0.5, height = 0.475)+
  draw_plot(p1, x=0.5, y=0, width = 0.5, height = 0.525)+
  draw_plot_label(label = c("a","c","b","d"), size = 15,
                  x=c(0,0,0.5,0.5),
                  y=c(1,0.525,1,0.525))##8.6*7.8


###Plot for POC###
dat2 <- read.csv("Plot-POC.csv")
dat2$variable <- factor(dat2$variable,levels = c("POC","MAOC","POC.MAOC"),labels=c("POC","MAOC","POC:MAOC"))
dat2.1 <- dplyr::filter(dat2,type=="Overall")
dat2.2 <- dat2[4:12,]
dat2.3 <- dat2[13:30,]

p5 <- ggplot(dat2.1)+ 
  geom_point(aes(x=variable, y=mean,color=variable),stat="identity",size=3.6,alpha=0.75)+ ##画数据点
  geom_errorbar(aes(x=variable,ymin=CI1, ymax=CI2,color=variable), width=0.1, size=0.5)+ ##画95%CI
  geom_text(aes(label=n, x=variable, y=CI2+1,vjust=0), col="black", size=3.6)+  ##添加数据量
  theme_cowplot()+
  theme(legend.position="none")+  ##格式
  scale_color_manual(values = c("purple","darkgreen","#ea443e"))+
  #scale_colour_manual(values=c("#e47b79","#a9c3e0"))   ##格式
  geom_hline(aes(yintercept=0),linetype="dashed",colour="black")+ ##在0画虚线
  theme(strip.background = element_rect(fill = "lightgray"),panel.grid = element_blank())+
  labs(y="CC effect on SOC fractions (%)",subtitle = "Overall")+
  theme(axis.title.x = element_blank())+font
p5

p6 <- ggplot(dat2.2)+ 
  geom_point(aes(x=type, y=mean,color=variable,shape=shape),stat="identity",size=3.6,
             position=position_dodge(width = 0.75),alpha=0.75)+ ##画数据点
  geom_errorbar(aes(x=type,ymin=CI1, ymax=CI2,color=variable), width=0.2, size=0.5,
                position=position_dodge(width = 0.75))+ ##画95%CI
  geom_text(aes(label=n, x=type, y=CI2+1,vjust=0,color=variable), size=3.6,
            position=position_dodge(width = 0.75))+  ##添加数据量
  scale_x_discrete(limits = c("Legume","Non-legume","Mixture"))+  ##转换x-y，变量排序
  scale_y_continuous(position = "right")+
  scale_shape_manual(values = c(16,21))+
  theme_cowplot()+
  scale_color_manual(values = c("purple","darkgreen","#ea443e"))+
  theme(legend.position="none")+  ##格式
  #scale_colour_manual(values=c("#e47b79","#a9c3e0"))   ##格式
  geom_hline(aes(yintercept=0),linetype="dashed",colour="black")+ ##在0画虚线
  theme(strip.background = element_rect(fill = "lightgray"),panel.grid = element_blank())+
  labs(y="CC effect on SOC fractions (%)",subtitle = "CC type")+
  theme(axis.title.x = element_blank())+font
p6

p7 <- ggplot(dat2.3)+ 
  geom_vline(aes(xintercept=3.5),colour="black")+ 
  geom_point(aes(x=type, y=mean,color=variable,shape=shape),stat="identity",size=3.6,
             position=position_dodge(width = 0.75),alpha=0.75)+ ##画数据点
  geom_errorbar(aes(x=type,ymin=CI1, ymax=CI2,color=variable), width=0.2, size=0.5,
                position=position_dodge(width = 0.75))+ ##画95%CI
  geom_text(aes(label=n, x=type, y=CI2+1,vjust=0,color=variable), size=3.6,
            position=position_dodge(width = 0.75))+  ##添加数据量
  scale_x_discrete(limits = c("Arid","Temperate","Cold","Clay","Clay loam","Loam"))+  ##转换x-y，变量排序
  scale_y_continuous(breaks = c(0,25,50,75),sec.axis = sec_axis(~.*0.02, name = " "))+
  scale_shape_manual(values = c(16,21))+
  theme_cowplot()+
  scale_color_manual(values = c("purple","darkgreen","#ea443e"))+
  theme(legend.position="none")+  ##格式
  #scale_colour_manual(values=c("#e47b79","#a9c3e0"))   ##格式
  geom_hline(aes(yintercept=0),linetype="dashed",colour="black")+ ##在0画虚线
  theme(strip.background = element_rect(fill = "lightgray"),panel.grid = element_blank())+
  labs(y="CC effect on SOC fractions (%)")+
  theme(axis.title.x = element_blank())+font
p7

dat3 <- read.csv("Absolute value-POC.csv")
dat3$variable <- factor(dat3$variable,levels=c("POC","MAOC","POC:MAOC"))
dat3$value2 <- ifelse(dat3$variable=="POC:MAOC",dat3$value*50,dat3$value)
dat3.1 <- dat3[1:178,]
dat3.2 <- dat3[179:356,]%>%dplyr::filter(type!="sandy")

kruskal.test(value ~ type,data=filter(dat3.2,variable=="POC.MAOC"))
pairwise_wilcox_test (filter(dat3.2,variable=="POC.MAOC"), value ~ type, p.adjust.method = "bonf")

p8 <- ggplot(dat3, aes(x=type, y=value2,color=variable,fill=variable)) + 
  geom_vline(aes(xintercept=3.5),colour="black")+ 
  geom_bar(position = position_dodge(width = 0.75), stat = "summary",width = 0.75,alpha=0.5) + 
  geom_errorbar(stat="summary", width=0.25,position=position_dodge(width=0.75))+
  scale_x_discrete(limits = c("arid","temperate","cold","clay","clay loam","loam"),
                   labels = c("Arid","Temperate","Cold","Clay","Clay loam","Loam"))+  ##转换x-y，变量排序
  scale_color_manual(values = c("purple","darkgreen","#ea443e"))+
  scale_fill_manual(values = c("purple","darkgreen","#ea443e"))+
  scale_y_continuous(sec.axis = sec_axis(~.*0.02, name = "POC:MAOC"))+
  theme_cowplot() +
  labs(y="SOC fractions (kg/ha)",subtitle = "Climate zone and soil texture")+
  theme(axis.line = element_line(), axis.title.x = element_blank(),legend.position = "none")+font
p8


ggdraw()+ 
  draw_plot(p5, x=0.01, y=2/3, width = 0.49, height = 1/3)+
  draw_plot(p6, x=0.505, y=2/3, width = 0.49, height = 1/3)+
  draw_plot(p8, x=0.01, y=1/3, width = 0.99, height = 1/3)+
  draw_plot(p7, x=0.01, y=0, width = 0.99, height = 1/3)+
  draw_plot_label(label = c("a","b","c"), size = 15,
                  x=c(0,0.49,0),
                  y=c(1,1,2/3))##9.4*9.4
