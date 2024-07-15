library(metaforest)
library(caret)
library(ggplot2)
library(cowplot)
library(ggrepel)
library(rcartocolor)
library(ggpmisc)

setwd("D:/Document/Cover crop")
font=theme(axis.title=element_text(size=11),axis.text = element_text(size=10,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12))#11.6inches

####yield####
mf_cv <- readRDS("yield_mf-new.RData")
importance.export.rel <- varImp(mf_cv)$importance
importance.export.rel$variable <- c("MAT","MAP","Aridity index", 
                                    "BD",  "Sand","Clay", "SOCi", "Soil C:N", "pH",
                                     "Soil biodiversity","Microbial biomass","F/B ratio",
                                    "Cropland type","N rate", "Organic fertilizer", 
                                     "Tillage", "Irrigation","CC type","CC diversity",
                                    "Residue management","Duration",
                                     "CC growth days","CC terminate time")
yield <- importance.export.rel
label2 <- c(paste0("italic(R^2) == 0.65"),paste0("italic(n) == 1149"))
yield$total <- "Yield"

p1 <- ggplot(yield, aes(y = reorder(variable, Overall), x = Overall)) +
  geom_bar(stat='identity',width=0.75,color="black",aes(fill=Overall)) +
  theme_cowplot()+
  facet_wrap(~total,strip.position = "right")+
  scale_fill_gradient(low="white",high="#e4615d")+
  theme(panel.grid=element_blank())+
  scale_y_discrete(labels=c("Organic fertilizer","Cropland type","Residue management","Irrigation",
                            "Tillage","CC diversity","CC type","Duration","Clay",
                            "N rate","Sand","pH","BD","Initial SOC","CC terminate time",
                            "CC growth days","F/B ratio","Aridity index","Microbial biomass",
                            "Soil C:N","MAT","MAP","Soil biodiversity"))+
  xlab('Relative importance of predictors (%)')+font+
  annotate("text",label=label2,parse=T,x=c(85,85),y=c(3,2),size=3.4)+
  theme(axis.title.y = element_blank(),panel.spacing = unit(0,"lines"),
        strip.text = element_blank(),strip.background = element_blank(),legend.position = "none")
p1

####SOC####
mf_cv <- readRDS("SOC_mf-new.RData")
importance.export.rel <- varImp(mf_cv)$importance
importance.export.rel$variable <- c("MAT","MAP","Aridity index", 
                                    "BD",  "Sand","Clay", "SOCi", "Soil C:N", "pH",
                                    "Soil biodiversity","Microbial biomass","F/B ratio",
                                    "Cropland type","N rate", "Organic fertilizer", 
                                    "Tillage", "Irrigation","CC type","CC diversity",
                                    "Residue management","Duration",
                                    "CC growth days","CC terminate time")
SOC <- importance.export.rel
label2 <- c(paste0("italic(R^2) == 0.33"),paste0("n == 1105"))
SOC$total <- "SOC"
SOC$total <- factor(SOC$total,labels = expression(SOC[stock]))

p2 <- ggplot(SOC, aes(y = reorder(variable, Overall), x = Overall)) +
  geom_bar(stat='identity',width=0.75,color="black",aes(fill=Overall)) +
  theme_cowplot()+
  facet_wrap(~total,labeller =label_parsed,strip.position = "right")+
  scale_fill_gradient(low="white",high="#fdc58f")+
  theme(panel.grid=element_blank())+
  scale_y_discrete(labels=c("Organic fertilizer","CC type","Residue management","Tillage",
                            "CC diversity","Cropland type","N rate","Irrigation","F/B ratio",
                            "MAT","Duration","BD","CC terminate time","Soil C:N","CC growth days",
                            "Clay","Soil biodiversity","Microbial biomass","Aridity index",
                            "Sand","MAP","pH","Initial SOC"))+
  xlab('Relative importance of predictors (%)')+font+
  annotate("text",label=label2,parse=T,x=c(85,85),y=c(3,2),size=3.4)+
  theme(axis.title.y = element_blank(),panel.spacing = unit(0,"lines"),
        strip.text = element_blank(),strip.background = element_blank(),legend.position = "none")
p2

####N2O####
mf_cv <- readRDS("N2O_mf-new.RData")
importance.export.rel <- varImp(mf_cv)$importance
importance.export.rel$variable <- c("MAT","MAP","Aridity index", 
                                    "BD",  "Sand","Clay", "SOCi", "Soil C:N", "pH",
                                    "Soil biodiversity","Microbial biomass","F/B ratio",
                                    "Cropland type","N rate", "Organic fertilizer", 
                                    "Tillage", "Irrigation","CC type","CC diversity",
                                    "Residue management","Duration",
                                    "CC growth days","CC terminate time")
N2O <- importance.export.rel
label2 <- c(paste0("italic(R^2) == 0.36"),paste0("n == 363"))
N2O$total <- "N2O"
N2O$total <- factor(N2O$total,labels = expression(N[2]*O))

p3 <- ggplot(N2O, aes(y = reorder(variable, Overall), x = Overall)) +
  geom_bar(stat='identity',width=0.75,color="black",aes(fill=Overall)) +
  theme_cowplot()+
  facet_wrap(~total,labeller = label_parsed,strip.position = "right")+
  scale_fill_gradient(low="white",high="#99d9d0")+
  theme(panel.grid=element_blank())+
  scale_y_discrete(labels=c("Organic fertilizer","Cropland type","Irrigation","Tillage",
                            "CC diversity","Residue management","Microbial biomass",
                            "Duration","CC terminate time","MAT","Initial SOC","BD",
                            "Sand","N rate","pH","Soil C:N","Clay","F/B ratio",
                            "Aridity index","Soil biodiversity","CC growth days","MAP","CC type"))+
  xlab('Relative importance of predictors (%)')+font+
  annotate("text",label=label2,parse=T,x=c(85,85),y=c(3,2),size=3.4)+
  theme(axis.title.y = element_blank(),panel.spacing = unit(0,"lines"),
        strip.text = element_blank(),strip.background =element_blank(),legend.position = "none")
p3

####CH4####
mf_cv <- readRDS("CH4_mf-new.RData")
importance.export.rel <- varImp(mf_cv)$importance
importance.export.rel$variable <- c("MAT","MAP","Aridity index", 
                                    "BD",  "Sand","Clay", "SOCi", "Soil C:N", "pH",
                                    "Soil biodiversity","Microbial biomass","F/B ratio",
                                    "Cropland type","N rate", "Organic fertilizer", 
                                    "Tillage", "Irrigation","CC type","CC diversity",
                                    "Residue management","Duration",
                                    "CC growth days","CC terminate time")
CH4 <- importance.export.rel
label2 <- c(paste0("italic(R^2) == 0.29"),paste0("n == 162"))
CH4$total <- "CH4"
CH4$total <- factor(CH4$total,labels = expression(CH[4]))

p4 <- ggplot(CH4, aes(y = reorder(variable, Overall), x = Overall)) +
  geom_bar(stat='identity',width=0.75,color="black",aes(fill=Overall)) +
  theme_cowplot()+
  facet_wrap(~total,labeller = label_parsed,strip.position = "right")+
  scale_fill_gradient(low="white",high="#95b2d6")+
  theme(panel.grid=element_blank())+
  scale_y_discrete(labels=c("CC diversity","Organic fertilizer","Tillage","Duration",
                            "Residue management","CC type","Clay","pH","CC growth days",
                            "N rate","Sand","MAT","MAP","Soil biodiversity","CC terminate time",
                            "Aridity index","F/B ratio","Initial SOC","Microbial biomass",
                            "BD","Irrigation","Cropland type","Soil C:N"))+
  xlab('Relative importance of predictors (%)')+font+
  annotate("text",label=label2,parse=T,x=c(85,85),y=c(3,2),size=3.4)+
  theme(axis.title.y = element_blank(),panel.spacing = unit(0,"lines"),
        strip.text = element_blank(),strip.background = element_blank(),legend.position = "none")
p4

####MWD####
mf_cv <- readRDS("MWD_mf-new.RData")
importance.export.rel <- varImp(mf_cv)$importance
importance.export.rel$variable <- c("MAT","MAP","Aridity index", 
                                    "BD",  "Sand","Clay", "SOCi", "Soil C:N", "pH",
                                    "Soil biodiversity","Microbial biomass","F/B ratio",
                                    "Cropland type","N rate", "Organic fertilizer", 
                                    "Tillage", "Irrigation","CC type","CC diversity",
                                    "Residue management","Duration",
                                    "CC growth days","CC terminate time")
MWD <- importance.export.rel
label2 <- c(paste0("italic(R^2) == 0.48"),paste0("n == 376"))
MWD$total <- "MWD"

p5 <- ggplot(MWD, aes(y = reorder(variable, Overall), x = Overall)) +
  geom_bar(stat='identity',width=0.75,color="black",aes(fill=Overall)) +
  theme_cowplot()+
  facet_wrap(~total,strip.position = "right")+
  scale_fill_gradient(low="white",high="#ea9c9d")+
  theme(panel.grid=element_blank())+
  scale_y_discrete(labels=c("Cropland type","Organic fertilizer","Irrigation","CC type",
                            "Residue management","Tillage","CC diversity","N rate","Microbial biomass",
                            "MAT","Sand","BD","pH","Clay","Soil C:N","CC growth days",
                            "Initial SOC","Soil biodiversity","CC terminate time","MAP",
                            "Aridity index","F/B ratio","Duration"))+
  xlab('Relative importance of predictors (%)')+font+
  annotate("text",label=label2,parse=T,x=c(85,85),y=c(3,2),size=3.4)+
  theme(axis.title.y = element_blank(),panel.spacing = unit(0,"lines"),
        strip.text = element_blank(),strip.background =element_blank(),legend.position = "none")
p5

p6 <- ggdraw()+ 
  draw_plot(p3, x=2/3, y=0.5, width = 1/3, height = 0.5)+
  draw_plot(p2, x=1/3, y=0.5, width = 1/3, height = 0.5)+
  draw_plot(p1, x=0, y=0.5, width = 1/3, height = 0.5)+
  draw_plot(p5, x=1/3, y=0, width = 1/3, height = 0.5)+
  draw_plot(p4, x=0, y=0, width = 1/3, height = 0.5)+
  draw_label("Yield",color = "#cd5754",size=12,x=1/3-0.04,y=0.75,fontface = "italic")+
  draw_label(expression(italic(SOC[stock])),color = "#9b6e41",size=12,x=2/3-0.04,y=0.75)+
  draw_label(expression(italic(N[2]*O)),color = "#54928b",size=12,x=1-0.04,y=0.75)+
  draw_label(expression(italic(CH[4])),color = "#5f7895",size=12,x=1/3-0.04,y=0.25)+
  draw_label("MWD",color = "#a86768",size=12,x=2/3-0.04,y=0.25,fontface = "italic")+
  draw_plot_label(label = c("a","b","c","d","e"), size = 15,
                  x=c(0, 1/3,2/3,0,1/3), y=c(1, 1,1,0.5,0.5))

plot_grid(p6)+
  theme(plot.margin = unit(c(0.02,0.1,0.02,0.02),'inch'))#11.6*9.4inches
