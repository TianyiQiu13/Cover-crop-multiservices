library(Hmisc)
library(pheatmap)
library(ppcor)
library(raster)
library(RColorBrewer)
library(cowplot)
library(ggplotify)
library(lemon)

font=theme(axis.title=element_text(size=13),axis.text = element_text(size=12,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12))#11.6inches



### Upland ###
yield.upland <- raster("yield.upland.percMean.tif")
yield.SSP126.upland <- raster("yield.upland.SSP126.2091-2100.percMean.tif")
yield.SSP370.upland <- raster("yield.upland.SSP370.2091-2100.percMean.tif")
yield.change.126.upland <- yield.SSP126.upland-yield.upland
yield.change.370.upland <- yield.SSP370.upland-yield.upland
SOC.upland <- raster("SOC.upland.percMean.tif")
SOC.SSP126.upland <- raster("SOC.upland.SSP126.2091-2100.percMean.tif")
SOC.SSP370.upland <- raster("SOC.upland.SSP370.2091-2100.percMean.tif")
SOC.change.126.upland <- SOC.SSP126.upland-SOC.upland
SOC.change.370.upland <- SOC.SSP370.upland-SOC.upland
N2O.upland <- raster("N2O.upland.percMean.tif")
N2O.SSP126.upland <- raster("N2O.upland.SSP126.2091-2100.percMean.tif")
N2O.SSP370.upland <- raster("N2O.upland.SSP370.2091-2100.percMean.tif")
N2O.change.126.upland <- N2O.SSP126.upland-N2O.upland
N2O.change.370.upland <- N2O.SSP370.upland-N2O.upland
CH4.upland <- raster("CH4.upland.percMean.tif")
CH4.SSP126.upland <- raster("CH4.upland.SSP126.2091-2100.percMean.tif")
CH4.SSP370.upland <- raster("CH4.upland.SSP370.2091-2100.percMean.tif")
CH4.change.126.upland <- CH4.SSP126.upland-CH4.upland
CH4.change.370.upland <- CH4.SSP370.upland-CH4.upland
MWD.upland <- raster("MWD.upland.percMean.tif")
MWD.SSP126.upland <- raster("MWD.upland.SSP126.2091-2100.percMean.tif")
MWD.SSP370.upland <- raster("MWD.upland.SSP370.2091-2100.percMean.tif")
MWD.change.126.upland <- MWD.SSP126.upland-MWD.upland
MWD.change.370.upland <- MWD.SSP370.upland-MWD.upland
AMS.upland <- raster("AMS.upland.percMean.tif")
AMS.SSP126.upland <- raster("AMS.upaland.SSP126.2091-2100.percMean.tif")
AMS.SSP370.upland <- raster("AMS.upaland.SSP370.2091-2100.percMean.tif")
AMS.change.126.upland <- AMS.SSP126.upland-AMS.upland
AMS.change.370.upland <- AMS.SSP370.upland-AMS.upland
MAT<- raster("E:/Data/Raster/CC-raster/MAT_SSP370_2091-2100-0.1-ok.tif")
MAP<- raster("E:/Data/Raster/CC-raster/MAP_SSP370_2091-2100-0.1-ok.tif")
AI<- raster("E:/Data/Raster/CC-raster/AI_SSP370_2091-2100-0.1-ok.tif")

upland_all <- stack(yield.change.126.upland,yield.change.370.upland,
                    SOC.change.126.upland,SOC.change.370.upland,
                    N2O.change.126.upland,N2O.change.370.upland,
                    CH4.change.126.upland,CH4.change.370.upland,
                    MWD.change.126.upland,MWD.change.370.upland,
                    AMS.change.126.upland,AMS.change.370.upland,
                    MAT,MAP,AI)
upland_all.df <- as.data.frame(upland_all,xy=TRUE)
a <- layerStats(upland_all,"pearson",asSample=TRUE,na.rm=T)

upland_all.df <- upland_all.df[,-c(1,2)]
str(upland_all.df)
names(upland_all.df) <- c("ΔYield 126","ΔYield 370",
              "ΔSOC 126","ΔSOC 370","ΔN2O 126","ΔN2O 370",
              "ΔCH4 126","ΔCH4 370","ΔMWD 126","ΔMWD 370",
              "ΔAgroecosystem\nmultiservices 126","ΔAgroecosystem\nmultiservices 370",
              "MAT","MAP","Aridity index")
data <- rcorr(as.matrix(upland_all.df),type="pearson")
r_value <- data$r
p_value <- data$p
r_related <- r_value[1:12,13:15]
p_related <- p_value[1:12,13:15]
r_related[p_related>0.05]=NA
#r_related[r_related>0]=1
#r_related[r_related<0]=-1

cols <- c(colorRampPalette(brewer.pal(11, 'RdYlBu'))(11)) # 

p1 <- pheatmap(r_related,fontsize_number = 12,fontsize = 12,cluster_cols = F,cluster_rows = F,
         border= "gray2",labels_row = c("ΔYield 126","ΔYield 370",
                                        expression(paste("Δ",SOC[stock]," 126",sep="")),
                                        expression(paste("Δ",SOC[stock]," 370",sep="")),
                                        expression(paste("Δ",N[2],"O 126",sep="")),
                                        expression(paste("Δ",N[2],"O 370",sep="")),
                                        expression(paste("Δ",CH[4]," 126",sep="")),
                                        expression(paste("Δ",CH[4]," 370",sep="")),
                                        "ΔMWD 126","ΔMWD 370",
                                        "ΔMultiservices 126",
                                        "ΔMultiservices 370"),
         color = cols,
         angle_col = 45,na_col = "white")


### Paddy ###
yield.paddy <- raster("yield.paddy.percMean.tif")
yield.SSP126.paddy <- raster("yield.paddy.SSP126.2091-2100.percMean.tif")
yield.SSP370.paddy <- raster("yield.paddy.SSP370.2091-2100.percMean.tif")
yield.change.126.paddy <- yield.SSP126.paddy-yield.paddy
yield.change.370.paddy <- yield.SSP370.paddy-yield.paddy
SOC.paddy <- raster("SOC.paddy.percMean.tif")
SOC.SSP126.paddy <- raster("SOC.paddy.SSP126.2091-2100.percMean.tif")
SOC.SSP370.paddy <- raster("SOC.paddy.SSP370.2091-2100.percMean.tif")
SOC.change.126.paddy <- SOC.SSP126.paddy-SOC.paddy
SOC.change.370.paddy <- SOC.SSP370.paddy-SOC.paddy
N2O.paddy <- raster("N2O.paddy.percMean.tif")
N2O.SSP126.paddy <- raster("N2O.paddy.SSP126.2091-2100.percMean.tif")
N2O.SSP370.paddy <- raster("N2O.paddy.SSP370.2091-2100.percMean.tif")
N2O.change.126.paddy <- N2O.SSP126.paddy-N2O.paddy
N2O.change.370.paddy <- N2O.SSP370.paddy-N2O.paddy
CH4.paddy <- raster("CH4.paddy.percMean.tif")
CH4.SSP126.paddy <- raster("CH4.paddy.SSP126.2091-2100.percMean.tif")
CH4.SSP370.paddy <- raster("CH4.paddy.SSP370.2091-2100.percMean.tif")
CH4.change.126.paddy <- CH4.SSP126.paddy-CH4.paddy
CH4.change.370.paddy <- CH4.SSP370.paddy-CH4.paddy
MWD.paddy <- raster("MWD.paddy.percMean.tif")
MWD.SSP126.paddy <- raster("MWD.paddy.SSP126.2091-2100.percMean.tif")
MWD.SSP370.paddy <- raster("MWD.paddy.SSP370.2091-2100.percMean.tif")
MWD.change.126.paddy <- MWD.SSP126.paddy-MWD.paddy
MWD.change.370.paddy <- MWD.SSP370.paddy-MWD.paddy
AMS.paddy <- raster("AMS.paddy.percMean.tif")
AMS.SSP126.paddy <- raster("AMS.paddy.SSP126.2091-2100.percMean.tif")
AMS.SSP370.paddy <- raster("AMS.paddy.SSP370.2091-2100.percMean.tif")
AMS.change.126.paddy <- AMS.SSP126.paddy-AMS.paddy
AMS.change.370.paddy <- AMS.SSP370.paddy-AMS.paddy
MAT<- raster("E:/Data/Raster/CC-raster/MAT_SSP370_2091-2100-0.1-ok.tif")
MAP<- raster("E:/Data/Raster/CC-raster/MAP_SSP370_2091-2100-0.1-ok.tif")
AI<- raster("E:/Data/Raster/CC-raster/AI_SSP370_2091-2100-0.1-ok.tif")

paddy_all <- stack(yield.change.126.paddy,yield.change.370.paddy,
                    SOC.change.126.paddy,SOC.change.370.paddy,
                    N2O.change.126.paddy,N2O.change.370.paddy,
                    CH4.change.126.paddy,CH4.change.370.paddy,
                    MWD.change.126.paddy,MWD.change.370.paddy,
                    AMS.change.126.paddy,AMS.change.370.paddy,
                    MAT,MAP,AI)
paddy_all.df <- as.data.frame(paddy_all,xy=TRUE)
a <- layerStats(paddy_all,"pearson",asSample=TRUE,na.rm=T)

paddy_all.df <- paddy_all.df[,-c(1,2)]
str(paddy_all.df)
names(paddy_all.df) <- c("ΔYield 126","ΔYield 370",
                          "ΔSOC 126","ΔSOC 370","ΔN2O 126","ΔN2O 370",
                          "ΔCH4 126","ΔCH4 370","ΔMWD 126","ΔMWD 370",
                          "ΔAgroecosystem\nmultiservices 126","ΔAgroecosystem\nmultiservices 370",
                          "MAT","MAP","Aridity index")
data2 <- rcorr(as.matrix(paddy_all.df),type="pearson")
r_value2 <- data2$r
p_value2 <- data2$p
r_related2 <- r_value2[1:12,13:15]
p_related2 <- p_value2[1:12,13:15]
r_related2[p_related2>0.05]=NA
#r_related[r_related>0]=1
#r_related[r_related<0]=-1


p2 <- pheatmap(r_related2,fontsize_number = 12,fontsize = 12,cluster_cols = F,cluster_rows = F,
               border= "gray2",labels_row = c("ΔYield 126","ΔYield 370",
                                              expression(paste("Δ",SOC[stock]," 126",sep="")),
                                              expression(paste("Δ",SOC[stock]," 370",sep="")),
                                              expression(paste("Δ",N[2],"O 126",sep="")),
                                              expression(paste("Δ",N[2],"O 370",sep="")),
                                              expression(paste("Δ",CH[4]," 126",sep="")),
                                              expression(paste("Δ",CH[4]," 370",sep="")),
                                              "ΔMWD 126","ΔMWD 370",
                                              "ΔMultiservices 126",
                                              "ΔMultiservices 370"),
               color = cols,
               angle_col = 45,na_col = "white")

g1 <- as.ggplot(p1)
g2 <- as.ggplot(p2)

g <- plot_grid( g1 + theme(plot.margin = unit(c(0.35,0,0,0.55), "cm")), 
                g2 + theme(plot.margin = unit(c(0.35,0,0,0.55), "cm")),
                align = 'h', 
                label_size = 15,
                labels = c("a","b"),
                nrow = 1,ncol=2
)
g##8.6*7.0 inches
