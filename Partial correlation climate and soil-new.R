library(Hmisc)
library(pheatmap)
library(ppcor)
library(corrplot)
library(RColorBrewer)
library(ggpubr)
library(lemon)
library(cowplot)

setwd("D:/Document/Cover crop")
font=theme(axis.title=element_text(size=13),axis.text = element_text(size=12,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12))#11.6inches

######Calculation######
###Zero order
a <- read.csv("Drivers-climate and soil.csv")
names(a) <- c("MAT","MAP","Aridity index","BD","Sand","Clay",
              expression(SOC[i]),"Soil C:N","pH","Soil biodiversity","Microbial biomass","F/B ratio",
              "RR-Yield","RR-SOC","RR-N2O","RR-CH4","RR-MWD")
data <- rcorr(as.matrix(a),type="pearson")
r_value <- data$r
p_value <- data$P
r_related <- r_value[1:12,13:17]
p_related <- p_value[1:12,13:17]
r_related[p_related>0.05]=NA
#r_related[r_related>0]=1
#r_related[r_related<0]=-1
#write.csv(r_related,"Zero order-r.csv")
#write.csv(p_related,"Zero order-p.csv")
###Yield
a <- read.csv("Drivers-climate and soil.csv")
a <- na.omit(a[,c(1:13)])
names(a) <- c("MAT","MAP","Aridity index","BD","Sand","Clay",
              "SOC","Soil C:N","pH","Soil biodiversity","Microbial biomass","F/B ratio",
              "RR-Yield")

MAT.Yield <- pcor.test(x=a$MAT,y=a$`RR-Yield`,
                       z=a[,c("BD","Sand","Clay","SOC","Soil C:N","pH",
                              "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
MAP.Yield <- pcor.test(x=a$MAP,y=a$`RR-Yield`,
                       z=a[,c("BD","Sand","Clay","SOC","Soil C:N","pH",
                              "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
AI.Yield <- pcor.test(x=a$`Aridity index`,y=a$`RR-Yield`,
                      z=a[,c("BD","Sand","Clay","SOC","Soil C:N","pH",
                             "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
BD.Yield <- pcor.test(x=a$BD,y=a$`RR-Yield`,
                      z=a[,c("MAT","MAP","Aridity index",
                             "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
Sand.Yield <- pcor.test(x=a$Sand,y=a$`RR-Yield`,
                        z=a[,c("MAT","MAP","Aridity index",
                               "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
Clay.Yield <- pcor.test(x=a$Clay,y=a$`RR-Yield`,
                        z=a[,c("MAT","MAP","Aridity index",
                               "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
SOC.Yield <- pcor.test(x=a$SOC,y=a$`RR-Yield`,
                       z=a[,c("MAT","MAP","Aridity index",
                              "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
CN.Yield <- pcor.test(x=a$`Soil C:N`,y=a$`RR-Yield`,
                      z=a[,c("MAT","MAP","Aridity index",
                             "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
pH.Yield <- pcor.test(x=a$pH,y=a$`RR-Yield`,
                      z=a[,c("MAT","MAP","Aridity index",
                             "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
Biodiversity.Yield <- pcor.test(x=a$`Soil biodiversity`,y=a$`RR-Yield`,
                                z=a[,c("MAT","MAP","Aridity index",
                                       "BD","Sand","Clay","SOC","Soil C:N","pH")],method="pearson")
MBC.Yield <- pcor.test(x=a$`Microbial biomass`,y=a$`RR-Yield`,
                       z=a[,c("MAT","MAP","Aridity index",
                              "BD","Sand","Clay","SOC","Soil C:N","pH")],method="pearson")
FB.Yield <- pcor.test(x=a$`F/B ratio`,y=a$`RR-Yield`,
                      z=a[,c("MAT","MAP","Aridity index",
                             "BD","Sand","Clay","SOC","Soil C:N","pH")],method="pearson")

Yield <- rbind.data.frame(MAT.Yield,MAP.Yield,AI.Yield,BD.Yield,Sand.Yield,Clay.Yield,SOC.Yield,
                          CN.Yield,pH.Yield,Biodiversity.Yield,MBC.Yield,FB.Yield)
#write.csv(Yield,"Partial correlation-Yield.csv")

###SOC
a <- read.csv("Drivers-climate and soil.csv")
a <- na.omit(a[,c(1:12,14)])
names(a) <- c("MAT","MAP","Aridity index","BD","Sand","Clay",
              "SOC","Soil C:N","pH","Soil biodiversity","Microbial biomass","F/B ratio",
              "RR-SOC")

MAT.SOC <- pcor.test(x=a$MAT,y=a$`RR-SOC`,
                     z=a[,c("BD","Sand","Clay","SOC","Soil C:N","pH",
                            "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
MAP.SOC <- pcor.test(x=a$MAP,y=a$`RR-SOC`,
                     z=a[,c("BD","Sand","Clay","SOC","Soil C:N","pH",
                            "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
AI.SOC <- pcor.test(x=a$`Aridity index`,y=a$`RR-SOC`,
                    z=a[,c("BD","Sand","Clay","SOC","Soil C:N","pH",
                           "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
BD.SOC <- pcor.test(x=a$BD,y=a$`RR-SOC`,
                    z=a[,c("MAT","MAP","Aridity index",
                           "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
Sand.SOC <- pcor.test(x=a$Sand,y=a$`RR-SOC`,
                      z=a[,c("MAT","MAP","Aridity index",
                             "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
Clay.SOC <- pcor.test(x=a$Clay,y=a$`RR-SOC`,
                      z=a[,c("MAT","MAP","Aridity index",
                             "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
SOC.SOC <- pcor.test(x=a$SOC,y=a$`RR-SOC`,
                     z=a[,c("MAT","MAP","Aridity index",
                            "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
CN.SOC <- pcor.test(x=a$`Soil C:N`,y=a$`RR-SOC`,
                    z=a[,c("MAT","MAP","Aridity index",
                           "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
pH.SOC <- pcor.test(x=a$pH,y=a$`RR-SOC`,
                    z=a[,c("MAT","MAP","Aridity index",
                           "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
Biodiversity.SOC <- pcor.test(x=a$`Soil biodiversity`,y=a$`RR-SOC`,
                              z=a[,c("MAT","MAP","Aridity index",
                                     "BD","Sand","Clay","SOC","Soil C:N","pH")],method="pearson")
MBC.SOC <- pcor.test(x=a$`Microbial biomass`,y=a$`RR-SOC`,
                     z=a[,c("MAT","MAP","Aridity index",
                            "BD","Sand","Clay","SOC","Soil C:N","pH")],method="pearson")
FB.SOC <- pcor.test(x=a$`F/B ratio`,y=a$`RR-SOC`,
                    z=a[,c("MAT","MAP","Aridity index",
                           "BD","Sand","Clay","SOC","Soil C:N","pH")],method="pearson")

SOC <- rbind.data.frame(MAT.SOC,MAP.SOC,AI.SOC,BD.SOC,Sand.SOC,Clay.SOC,SOC.SOC,
                        CN.SOC,pH.SOC,Biodiversity.SOC,MBC.SOC,FB.SOC)
#write.csv(SOC,"Partial correlation-SOC.csv")

###N2O
a <- read.csv("Drivers-climate and soil.csv")
a <- na.omit(a[,c(1:12,15)])
names(a) <- c("MAT","MAP","Aridity index","BD","Sand","Clay",
              "SOC","Soil C:N","pH","Soil biodiversity","Microbial biomass","F/B ratio",
              "RR-N2O")

MAT.N2O <- pcor.test(x=a$MAT,y=a$`RR-N2O`,
                     z=a[,c("BD","Sand","Clay","SOC","Soil C:N","pH",
                            "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
MAP.N2O <- pcor.test(x=a$MAP,y=a$`RR-N2O`,
                     z=a[,c("BD","Sand","Clay","SOC","Soil C:N","pH",
                            "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
AI.N2O <- pcor.test(x=a$`Aridity index`,y=a$`RR-N2O`,
                    z=a[,c("BD","Sand","Clay","SOC","Soil C:N","pH",
                           "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
BD.N2O <- pcor.test(x=a$BD,y=a$`RR-N2O`,
                    z=a[,c("MAT","MAP","Aridity index",
                           "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
Sand.N2O <- pcor.test(x=a$Sand,y=a$`RR-N2O`,
                      z=a[,c("MAT","MAP","Aridity index",
                             "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
Clay.N2O <- pcor.test(x=a$Clay,y=a$`RR-N2O`,
                      z=a[,c("MAT","MAP","Aridity index",
                             "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
SOC.N2O <- pcor.test(x=a$SOC,y=a$`RR-N2O`,
                     z=a[,c("MAT","MAP","Aridity index",
                            "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
CN.N2O <- pcor.test(x=a$`Soil C:N`,y=a$`RR-N2O`,
                    z=a[,c("MAT","MAP","Aridity index",
                           "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
pH.N2O <- pcor.test(x=a$pH,y=a$`RR-N2O`,
                    z=a[,c("MAT","MAP","Aridity index",
                           "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
Biodiversity.N2O <- pcor.test(x=a$`Soil biodiversity`,y=a$`RR-N2O`,
                              z=a[,c("MAT","MAP","Aridity index",
                                     "BD","Sand","Clay","SOC","Soil C:N","pH")],method="pearson")
MBC.N2O <- pcor.test(x=a$`Microbial biomass`,y=a$`RR-N2O`,
                     z=a[,c("MAT","MAP","Aridity index",
                            "BD","Sand","Clay","SOC","Soil C:N","pH")],method="pearson")
FB.N2O <- pcor.test(x=a$`F/B ratio`,y=a$`RR-N2O`,
                    z=a[,c("MAT","MAP","Aridity index",
                           "BD","Sand","Clay","SOC","Soil C:N","pH")],method="pearson")

N2O <- rbind.data.frame(MAT.N2O,MAP.N2O,AI.N2O,BD.N2O,Sand.N2O,Clay.N2O,SOC.N2O,
                        CN.N2O,pH.N2O,Biodiversity.N2O,MBC.N2O,FB.N2O)
#write.csv(N2O,"Partial correlation-N2O.csv")

###CH4
a <- read.csv("Drivers-climate and soil.csv")
a <- na.omit(a[,c(1:12,16)])
names(a) <- c("MAT","MAP","Aridity index","BD","Sand","Clay",
              "SOC","Soil C:N","pH","Soil biodiversity","Microbial biomass","F/B ratio",
              "RR-CH4")

MAT.CH4 <- pcor.test(x=a$MAT,y=a$`RR-CH4`,
                     z=a[,c("BD","Sand","Clay","SOC","Soil C:N","pH",
                            "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
MAP.CH4 <- pcor.test(x=a$MAP,y=a$`RR-CH4`,
                     z=a[,c("BD","Sand","Clay","SOC","Soil C:N","pH",
                            "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
AI.CH4 <- pcor.test(x=a$`Aridity index`,y=a$`RR-CH4`,
                    z=a[,c("BD","Sand","Clay","SOC","Soil C:N","pH",
                           "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
BD.CH4 <- pcor.test(x=a$BD,y=a$`RR-CH4`,
                    z=a[,c("MAT","MAP","Aridity index",
                           "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
Sand.CH4 <- pcor.test(x=a$Sand,y=a$`RR-CH4`,
                      z=a[,c("MAT","MAP","Aridity index",
                             "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
Clay.CH4 <- pcor.test(x=a$Clay,y=a$`RR-CH4`,
                      z=a[,c("MAT","MAP","Aridity index",
                             "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
SOC.CH4 <- pcor.test(x=a$SOC,y=a$`RR-CH4`,
                     z=a[,c("MAT","MAP","Aridity index",
                            "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
CN.CH4 <- pcor.test(x=a$`Soil C:N`,y=a$`RR-CH4`,
                    z=a[,c("MAT","MAP","Aridity index",
                           "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
pH.CH4 <- pcor.test(x=a$pH,y=a$`RR-CH4`,
                    z=a[,c("MAT","MAP","Aridity index",
                           "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
Biodiversity.CH4 <- pcor.test(x=a$`Soil biodiversity`,y=a$`RR-CH4`,
                              z=a[,c("MAT","MAP","Aridity index",
                                     "BD","Sand","Clay","SOC","Soil C:N","pH")],method="pearson")
MBC.CH4 <- pcor.test(x=a$`Microbial biomass`,y=a$`RR-CH4`,
                     z=a[,c("MAT","MAP","Aridity index",
                            "BD","Sand","Clay","SOC","Soil C:N","pH")],method="pearson")
FB.CH4 <- pcor.test(x=a$`F/B ratio`,y=a$`RR-CH4`,
                    z=a[,c("MAT","MAP","Aridity index",
                           "BD","Sand","Clay","SOC","Soil C:N","pH")],method="pearson")

CH4 <- rbind.data.frame(MAT.CH4,MAP.CH4,AI.CH4,BD.CH4,Sand.CH4,Clay.CH4,SOC.CH4,
                        CN.CH4,pH.CH4,Biodiversity.CH4,MBC.CH4,FB.CH4)
#write.csv(CH4,"Partial correlation-CH4.csv")
###MWD
a <- read.csv("Drivers-climate and soil.csv")
a <- na.omit(a[,c(1:12,17)])
names(a) <- c("MAT","MAP","Aridity index","BD","Sand","Clay",
              "SOC","Soil C:N","pH","Soil biodiversity","Microbial biomass","F/B ratio",
              "RR-MWD")

MAT.MWD <- pcor.test(x=a$MAT,y=a$`RR-MWD`,
                     z=a[,c("BD","Sand","Clay","SOC","Soil C:N","pH",
                            "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
MAP.MWD <- pcor.test(x=a$MAP,y=a$`RR-MWD`,
                     z=a[,c("BD","Sand","Clay","SOC","Soil C:N","pH",
                            "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
AI.MWD <- pcor.test(x=a$`Aridity index`,y=a$`RR-MWD`,
                    z=a[,c("BD","Sand","Clay","SOC","Soil C:N","pH",
                           "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
BD.MWD <- pcor.test(x=a$BD,y=a$`RR-MWD`,
                    z=a[,c("MAT","MAP","Aridity index",
                           "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
Sand.MWD <- pcor.test(x=a$Sand,y=a$`RR-MWD`,
                      z=a[,c("MAT","MAP","Aridity index",
                             "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
Clay.MWD <- pcor.test(x=a$Clay,y=a$`RR-MWD`,
                      z=a[,c("MAT","MAP","Aridity index",
                             "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
SOC.MWD <- pcor.test(x=a$SOC,y=a$`RR-MWD`,
                     z=a[,c("MAT","MAP","Aridity index",
                            "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
CN.MWD <- pcor.test(x=a$`Soil C:N`,y=a$`RR-MWD`,
                    z=a[,c("MAT","MAP","Aridity index",
                           "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
pH.MWD <- pcor.test(x=a$pH,y=a$`RR-MWD`,
                    z=a[,c("MAT","MAP","Aridity index",
                           "Soil biodiversity","Microbial biomass","F/B ratio")],method="pearson")
Biodiversity.MWD <- pcor.test(x=a$`Soil biodiversity`,y=a$`RR-MWD`,
                              z=a[,c("MAT","MAP","Aridity index",
                                     "BD","Sand","Clay","SOC","Soil C:N","pH")],method="pearson")
MBC.MWD <- pcor.test(x=a$`Microbial biomass`,y=a$`RR-MWD`,
                     z=a[,c("MAT","MAP","Aridity index",
                            "BD","Sand","Clay","SOC","Soil C:N","pH")],method="pearson")
FB.MWD <- pcor.test(x=a$`F/B ratio`,y=a$`RR-MWD`,
                    z=a[,c("MAT","MAP","Aridity index",
                           "BD","Sand","Clay","SOC","Soil C:N","pH")],method="pearson")

MWD <- rbind.data.frame(MAT.MWD,MAP.MWD,AI.MWD,BD.MWD,Sand.MWD,Clay.MWD,SOC.MWD,
                        CN.MWD,pH.MWD,Biodiversity.MWD,MBC.MWD,FB.MWD)
#write.csv(MWD,"Partial correlation-MWD.csv")


######Plot#####
a <- read.csv("Partial correlation.csv")
zero <- a[a$control=="Zero order",]
zero$type <- factor(zero$type,levels = c("Yield","SOC","N2O","CH4","MWD"))
zero$driver <- factor(zero$driver,levels = c("MAT","MAP","AI","BD","sand","clay",
                                             "SOC","CN","pH",
                                             "biodiversity","MBC","FB"))
p1 <- ggballoonplot(zero,y="type",x="driver",fill="estimate",size="value",color="estimate")+
  facet_wrap(~control,strip.position = "top")+
  scale_color_gradient2(low = "darkred",mid = "white",high = "steelblue",midpoint = 0)+
  scale_fill_gradient2(low = "darkred",mid = "white",high = "steelblue",midpoint = 0)+
  scale_x_discrete(expand = c(0,0.5))+
  scale_y_discrete(limits = rev(levels(zero$type)),
                   labels = rev(c("Yield",expression(SOC[stock]),expression(paste(N[2],"O",sep = "")),
                                  expression(CH[4]),"MWD")))+
  geom_text(aes(label=sig,vjust=0.6))+
  theme_cowplot()+font+
  labs(fill="Partial\npearson's r",color="Partial\npearson's r",size="")+
  theme(axis.title = element_blank(),axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),legend.box.spacing = unit(0.05,"cm"))+
  theme(plot.margin = margin(0,0,0,0),panel.grid.major = element_line(colour = "#d9d9d9"),
        panel.spacing = unit(0,"cm"))
p1

partial <- a[a$control!="Zero order",]
partial$control <- factor(partial$control,levels = c("Control factor: Soil+Microbe",
                                                     "Control factor: Climate+Microbe",
                                                     "Control factor: Climate+Soil"),
                          labels = c("Control soil and microbe","Control climate and microbe",
                                     "Control climate and soil"))
partial$type <- factor(partial$type,levels = c("Yield","SOC","N2O","CH4","MWD"))
partial$driver <- factor(partial$driver,levels = c("MAT","MAP","AI","BD","sand","clay",
                                             "SOC","CN","pH",
                                             "biodiversity","MBC","FB"),
                         labels = c("MAT","MAP","Aridity\nindex","BD","Sand","Clay",
                                    "Initial\nSOC","Soil\nC:N","pH","Soil\nbiodiversity",
                                    "Microbial\nbiomass","F/B\nratio"))

p5 <- ggballoonplot(partial,y="type",x="driver",fill="estimate",size="value",color="estimate")+
  ggforce::facet_row(~control,strip.position = "top",scales = "free_x",space="free")+
  scale_color_gradient2(low = "darkred",mid = "white",high = "steelblue",midpoint = 0)+
  scale_fill_gradient2(low = "darkred",mid = "white",high = "steelblue",midpoint = 0)+
  scale_y_discrete(limits = rev(levels(partial$type)),
                   labels = rev(c("Yield",expression(SOC[stock]),expression(paste(N[2],"O",sep = "")),
                                  expression(CH[4]),"MWD")))+
  scale_x_discrete(expand = c(0,0.5))+
  geom_text(aes(label=sig,vjust=0.6))+
  theme_cowplot()+font+
  labs(fill="Partial\npearson's r",color="Partial\npearson's r",size="")+
  theme(axis.title = element_blank(),axis.ticks.y = element_blank()
        ,legend.position = "right")+
  theme(plot.margin = margin(0,0,0,0),panel.grid.major = element_line(colour = "#d9d9d9"),
        panel.spacing = unit(0,"cm"))+
  annotation_custom2(data=partial%>%filter(control=="Control soil and microbe"),
                     grob = grid::linesGrob(gp=grid::gpar(col="black",lwd=1.5)),
                     ymin = 0,ymax = 6,xmin = 3.5,xmax = 3.5)+
  annotation_custom2(data=partial%>%filter(control=="Control climate and microbe"),
                     grob = grid::linesGrob(gp=grid::gpar(col="black",lwd=1.5)),
                     ymin = 0,ymax = 6,xmin = 6.5,xmax = 6.5)+
  annotation_custom2(data=partial%>%filter(control=="Control soil and microbe"),
                     grob = grid::rectGrob(gp=grid::gpar(fill="#197ec099",
                                                         col="#197ec099")),
                     ymin = -1.15,ymax = 0.35,xmin = 0.5,xmax = 3.5)+
  annotation_custom2(data=partial%>%filter(control=="Control climate and microbe"),
                     grob = grid::rectGrob(gp=grid::gpar(fill="#f4772099",
                                                         col="#f4772099")),
                     ymin = -1.15,ymax = 0.35,xmin = 0.5,xmax = 6.5)+
  annotation_custom2(data=partial%>%filter(control=="Control climate and soil"),
                     grob = grid::rectGrob(gp=grid::gpar(fill="#b643df99",
                                                         col="#b643df99")),
                     ymin = -1.15,ymax = 0.35,xmin = 0.5,xmax = 3.5)+
  coord_cartesian(clip = "off")
p5

  
p7 <- grid_arrange_shared_legend(p1,p5,
                                 ncol=1,nrow=2,position = "right")
p8 <- plot_grid(p7)+
  theme(plot.margin = unit(c(0.1,0.1,0.1,0.225),'inch'))

ggdraw()+ 
  draw_plot(p6, x=0, y=0.45, width =1, height = 0.55)+
  draw_plot(p8, x=0, y=0, width =1, height = 0.45)+
  draw_label("Cropland type",color = "black",size=13,x=0.945,y=0.95,fontface = "italic")+
  draw_label("Climate zone",color = "black",size=13,x=0.945,y=0.875,fontface = "italic")+
  draw_label("Soil texture",color = "black",size=13,x=0.945,y=0.75,fontface = "italic")+
  draw_label("Soil fertility",color = "black",size=13,x=0.945,y=0.65,fontface = "italic")+
  draw_label("Soil pH",color = "black",size=13,x=0.945,y=0.55,fontface = "italic")+
  draw_plot_label(label = c("a","b"), size = 15,
                  x=c(0,0), y=c(1, 0.45))##11.6*10.2inches
