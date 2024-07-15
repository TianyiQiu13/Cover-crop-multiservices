library(devtools)
library(tidyverse)
library(ggplot2)
library(raster)
library(RColorBrewer)
library(grid)
library(ggplot2)
library(dplyr)
library(rgdal)
library(cowplot)
library(scales)
library(viridis)
library(swatches)
library(ggalt)
library(nord)
library(ggpolypath)
library(Cairo)
library(colorspace)
library(cptcity) # http://soliton.vm.bytemark.co.uk/pub/cpt-city/index.html
library(rgeos)
require(Cairo)
library(ggspatial)
library(rcartocolor)
library(colorspace)
library(tibble)
library(mapproj)
library(ggsignif)
library(doParallel)
library(rworldmap)
library(rnaturalearth)
library(sf)

setwd("D:/Document/Cover crop")
font=theme(axis.title=element_text(size=13),axis.text = element_text(size=12,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12))#11.6inches

worldMap <- fortify(map_data("world"),region="subregion")
worldMap <- worldMap[worldMap$region!="Antarctica",]

# create a blank ggplot theme
theme_opts <- list(theme(panel.grid.minor = element_blank(),
                         panel.grid.major = element_blank(),
                         panel.background = element_blank(),
                         #plot.background = element_rect(fill="#e6e8ed"),
                         panel.border = element_blank(),
                         axis.line = element_blank(),
                         axis.text.x = element_blank(),
                         axis.text.y = element_blank(),
                         axis.ticks = element_blank(),
                         axis.title.y = element_blank(),
                         plot.title = element_text(size=22),
                         plot.margin = unit(c(.5,-.5,.45,-.5), "lines"), 
                         legend.title = element_blank(),
                         axis.title.x = element_text(margin = margin(t = -5.25, r = 0, b = 0, l = 0)),
                         legend.margin=margin(t=-.75, r=0, b=0, l=0, unit="lines"), 
                         legend.position="bottom", 
                         legend.direction = "horizontal",
                         legend.key.width = unit(1.1, "cm"), 
                         legend.key.height = unit(0.1, "cm"),
                         legend.text = element_text(margin = margin(t = -0.25, unit = "lines"))
))

discrete_gradient_pal <- function(colours, bins = 11) {
  ramp <- scales::colour_ramp(colours)
  
  function(x) {
    if (length(x) == 0) return(character())
    
    i <- floor(x * bins)
    i <- ifelse(i > bins-1, bins-1, i)
    ramp(i/(bins-1))
  }
}

scale_fill_discrete_gradient <- function(..., colours, bins = 11, na.value = "transparent", guide = "colourbar", aesthetics = "fill", colors)  {
  colours <- if (missing(colours)) 
    colors
  else colours
  continuous_scale(
    aesthetics,
    "discrete_gradient",
    discrete_gradient_pal(colours, bins),
    na.value = na.value,
    guide = guide,
    ...
  )
}

# ----------------------Current--------------------------------------------
### Upland ###
AMS.upland <- raster("AMS.upland.percMean.tif")
#AMS.upland_robin <- projectRaster(AMS.upland,crs="+proj=robin", method="ngb",over=TRUE)
AMS.upland.df = as.data.frame(AMS.upland,xy=TRUE)
ggplot(AMS.upland.df)+
  geom_density(aes(layer))

cols1 <- c(colorRampPalette(rev(brewer.pal(9, 'YlOrRd')))(6)[c(1,2,6)], 
           colorRampPalette(brewer.pal(9, 'YlGnBu'))(12)[c(4,7,8,9,10,11,12)]) # 

p.AMS.upland <- ggplot()+ 
  #geom_polygon(data=ocean_df, aes(long,lat,group=group),fill= "#e5e9f0", size = 0.1) +
  #geom_polygon(data=bbox, aes(x=long, y=lat), colour="black", fill="transparent", size = 0.3) +
  #geom_polygon(data=wmap, aes(x=long,y=lat,group=group),fill="#ededed", color="black", size = 0.5) +
  geom_polygon(data=worldMap,aes(x=long,y=lat,group=group),fill="#ededed",color="black",size=0.1)+
  geom_raster(data=AMS.upland.df,aes(x,y,fill=layer)) +
  scale_fill_discrete_gradient(
    bins = 10,
    colours = cols1,
    breaks=c(-12,0,12,24,36),
    limits = c(-18, 42),
    guide = guide_colourbar(nbin = 100, raster = FALSE, frame.colour = "black", ticks.colour = NA)) +
  xlab("Agroecosystem multiservices (%)") +
  coord_equal() + 
  theme_classic() + font+
  theme_opts
p.AMS.upland


### paddy ###
AMS.paddy <- raster("AMS.paddy.percMean.tif")
#AMS.paddy_robin <- projectRaster(AMS.paddy,crs="+proj=robin", method="ngb",over=TRUE)
AMS.paddy.df = as.data.frame(AMS.paddy,xy=TRUE)
ggplot(AMS.paddy.df)+
  geom_density(aes(layer))

cols2 <- c(colorRampPalette(rev(brewer.pal(9, 'YlOrRd')))(6)[c(1,2,3,5,6)], 
           colorRampPalette(brewer.pal(9, 'YlGnBu'))(12)[c(4,7,9,10,12)]) # 

p.AMS.paddy <- ggplot()+ 
  #geom_polygon(data=ocean_df, aes(long,lat,group=group),fill= "#e5e9f0", size = 0.1) +
  #geom_polygon(data=bbox, aes(x=long, y=lat), colour="black", fill="transparent", size = 0.3) +
  #geom_polygon(data=wmap, aes(x=long,y=lat,group=group),fill="#ededed", color="black", size = 0.5) +
  geom_polygon(data=worldMap,aes(x=long,y=lat,group=group),fill="#ededed",color="black",size=0.1)+
  geom_raster(data=AMS.paddy.df,aes(x,y,fill=layer)) +
  scale_fill_discrete_gradient(
    bins = 10,
    colours = cols2,
    breaks=c(-16,-8,0,8,16),
    limits = c(-20, 20),
    guide = guide_colourbar(nbin = 100, raster = FALSE, frame.colour = "black", ticks.colour = NA)) +
  xlab("Agroecosystem multiservices (%)") +
  coord_equal() + 
  theme_classic() + font+
  theme_opts
p.AMS.paddy


### Overall Effect ###
AMS.upland.df2 <- data.frame(AMS.upland.df[,3])
AMS.upland.df2$cropland.type <- "upland"
names(AMS.upland.df2) <- c("value","cropland.type")
AMS.paddy.df2 <- data.frame(AMS.paddy.df[,3])
AMS.paddy.df2$cropland.type <- "paddy"
names(AMS.paddy.df2) <- c("value","cropland.type")
AMS.global.df2 <- rbind.data.frame(AMS.upland.df2,AMS.paddy.df2)
AMS.global.df2$cropland.type <- "global"
AMS.global.df <- rbind.data.frame(AMS.upland.df2,AMS.paddy.df2,AMS.global.df2)
AMS.global.df$cropland.type <- factor(AMS.global.df$cropland.type,
                                      levels=c("upland","paddy","global"))
AMS.global.mean <- mean(AMS.global.df$value,na.rm=T)
AMS.upland.mean <- mean(AMS.upland.df2$value,na.rm=T)
AMS.paddy.mean <- mean(AMS.paddy.df2$value,na.rm=T)
AMS.upland.global.mean <- rbind.data.frame(AMS.global.mean,AMS.upland.mean,AMS.paddy.mean)
AMS.upland.global.mean$cropland.type <- c("global","upland","paddy")
AMS.upland.global.mean$cropland.type <- factor(AMS.upland.global.mean$cropland.type,
                                               levels=c("upland","paddy","global"))
names(AMS.upland.global.mean) <- c("mean","cropland.type")


box.AMS.global <- ggplot(data=AMS.global.df,aes(cropland.type, value)) + 
  geom_boxplot(show.legend = F,na.rm=T,outlier.alpha=0.3,aes(fill=cropland.type)) +
  #geom_point(data=AMS.upland.continent.mean,aes(continent,mean),color="red",size=1.6)+
  geom_point(data=AMS.upland.global.mean,aes(cropland.type,mean),color="red",size=1.6)+
  scale_fill_manual(values = c("#efaf1280","#3e773980","#BEBADA")) + 
  ylab("Agroecosystem\nmultiservices (%)") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  geom_vline(xintercept = 2.5,linetype="dashed",color="black")+
  #geom_text(data=AMS.upland.continent.mean,aes(x=continent,y=-50,label=round(mean,2)),
  #          color="red")+
  #theme_classic(base_size = 8) +
  scale_x_discrete(labels=c("Upland","Paddy","Global"))+
  #geom_signif(comparisons=list(c("upland","paddy")),
  #            test = t.test,tip_length = 0,
  #            na.rm=T,map_signif_level = c("***"=0.001,"**"=0.01,"*"=0.05))+
  theme_cowplot()+font+
  theme(axis.text.x = element_text(angle=30,hjust = 1,colour = "black"),
        axis.title.x = element_blank())
box.AMS.global


# ----------------------Trade-offs--------------------------------------------
colors <- list(c(240, 217, 172),c(241, 205, 129),c(241, 194, 84),c(242, 183, 42),
               c(164, 181, 172),c(165, 184, 132),c(166,186,87),c(169,190,55),
               c(98, 150, 172), c(99, 153, 131),c(100, 155, 86),c(103,158,64),
               c(25, 120, 181),c(26,119,129),c(21,118,83),c(27, 119, 59))

colors <- sapply(colors,function(x)
  do.call("rgb",c(as.list(x),maxColorValue=255)))
comb <- outer(1:4,1:4,paste0)%>%c()
coldf <- data.frame(col=colors,comb=comb)%>%
  mutate(col=as.character(col))

pts <- rbind(c(0,0),c(0,4),c(4,4),c(4,0),c(0,0))
sfc <- st_sfc(st_polygon(list(pts)))
grid <- st_make_grid(sfc,n=c(4,4))
Legend <- st_sf(geom=grid,label=coldf$col)
Legend$col <- coldf$col
plot(st_geometry(Legend),col=Legend$col,border="lightgray")


worldMap <- fortify(map_data("world"),region="subregion")
worldMap <- worldMap[worldMap$region!="Antarctica",]


###upland###
yield_upland <- raster("yield_upland_actual_Mg_ha_yr.tif")
yield_upland.df = as.data.frame(yield_upland,xy=TRUE)
NGHGB_upland <- raster("NGHGB_upland_actual_Mg_ha_yr.tif")
NGHGB_upland.df = as.data.frame(NGHGB_upland,xy=TRUE)


upland_data <- cbind.data.frame(yield_upland.df,NGHGB_upland.df$layer)
names(upland_data) <- c("x","y","Yield","NGHGB")
#perc.AES <- rasterFromXYZ(perc.AES.df[,c("x", "y", "yield","SOC")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")


Shp <- upland_data%>%
  mutate(Var01=Yield)%>%
  mutate(Var02=NGHGB)%>%
  mutate(Var03=1)

Shp <- Shp%>%
  mutate(A=as.numeric(cut(Var01,include.lowest=T,
                          breaks=quantile(Var01,na.rm=T,probs=c(0,0.3,0.5,0.75,1)))),
         B=as.numeric(cut(Var02,include.lowest=T,
                          breaks=quantile(Var02,na.rm=T,probs=c(0,0.125,0.5,0.75,1)))),
         comb=paste0(A,B))%>%
  left_join(coldf,by="comb")


#### Plot ####
p1 <- ggplot()+
  geom_polygon(data=worldMap,aes(x=long,y=lat,group=group),fill="#ededed",color="black",size=0.1)+
  geom_raster(data=Shp,aes(x,y,fill=I(col),alpha=Var03))+
  xlab("Trade-offs among agroecosystem services")+
  scale_alpha_continuous(range = c(1,1))+
  guides(alpha=guide_legend(keywidth = 0,keyheight = 0,label = F))+
  coord_equal()+
  theme_classic() + font+
  theme_opts

p2 <- ggplot(Legend)+
  geom_sf(aes(fill=I(col)),col="lightgray")+
  labs(x="Yield",y="NGHGB")+
  theme_void()+
  #scale_x_continuous(breaks = c(0.5,3.5),labels = c("low","high"))+
  #scale_y_continuous(breaks = c(0.5,3.5),labels = c("low","high"))+
  font+
  theme(axis.title = element_text(),axis.title.y = element_text(angle=90),
        axis.text.y = element_text(angle=90),
        axis.line = element_line(colour = "transparent"))+
  theme(axis.title = element_text(size=12),
        axis.text.x = element_blank(),axis.text.y = element_blank())


tradeoff_upland <- ggdraw()+
  draw_plot(p1,0,0.05,1,0.9)+
  draw_plot(p2,0.1,0.25,0.2,0.35)
tradeoff_upland


###paddy###
yield_paddy <- raster("yield_paddy_actual_Mg_ha_yr.tif")
yield_paddy.df = as.data.frame(yield_paddy,xy=TRUE)
NGHGB_paddy <- raster("NGHGB_paddy_actual_Mg_ha_yr.tif")
NGHGB_paddy.df = as.data.frame(NGHGB_paddy,xy=TRUE)


paddy_data <- cbind.data.frame(yield_paddy.df,NGHGB_paddy.df$layer)
names(paddy_data) <- c("x","y","Yield","NGHGB")
#perc.AES <- rasterFromXYZ(perc.AES.df[,c("x", "y", "yield","SOC")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")

Shp2 <- paddy_data%>%
  mutate(Var01=Yield)%>%
  mutate(Var02=NGHGB)%>%
  mutate(Var03=1)

Shp2 <- Shp2%>%
  mutate(A=as.numeric(cut(Var01,include.lowest=T,
                          breaks=quantile(Var01,na.rm=T,probs=c(0,0.3,0.5,0.75,1)))),
         B=as.numeric(cut(Var02,include.lowest=T,
                          breaks=quantile(Var02,na.rm=T,probs=c(0,0.225,0.5,0.75,1)))),
         comb=paste0(A,B))%>%
  left_join(coldf,by="comb")


#### Plot ####
p3 <- ggplot()+
  geom_polygon(data=worldMap,aes(x=long,y=lat,group=group),fill="#ededed",color="black",size=0.1)+
  geom_raster(data=Shp2,aes(x,y,fill=I(col),alpha=Var03))+
  xlab("Trade-offs among agroecosystem services")+
  scale_alpha_continuous(range = c(1,1))+
  guides(alpha=guide_legend(keywidth = 0,keyheight = 0,label = F))+
  coord_equal()+
  theme_classic() + font+
  theme_opts

p4 <- ggplot(Legend)+
  geom_sf(aes(fill=I(col)),col="lightgray")+
  labs(x="Yield",y="NGHGB")+
  theme_void()+
  scale_x_continuous(breaks = c(0.5,3.5),labels = c("low","high"))+
  scale_y_continuous(breaks = c(0.5,3.5),labels = c("low","high"))+
  font+
  theme(axis.title = element_text(),axis.title.y = element_text(angle=90),
        axis.text.y = element_text(angle=90),
        axis.line = element_line(colour = "transparent"))


tradeoff_paddy <- ggdraw()+
  draw_plot(p3,0,0.05,1,0.9)+
  draw_plot(p4,0.1,0.25,0.2,0.35)
tradeoff_paddy


####Change in SSP126 and SPP270####

AMS.SSP126.upland <- raster("AMS.upland.SSP126.2091-2100.percMean.tif")
AMS.SSP126.paddy <- raster("AMS.paddy.SSP126.2091-2100.percMean.tif")
AMS.SSP370.upland <- raster("AMS.upland.SSP370.2091-2100.percMean.tif")
AMS.SSP370.paddy <- raster("AMS.paddy.SSP370.2091-2100.percMean.tif")

AMSchange.126.upland <- AMS.SSP126.upland-AMS.upland
AMSchange.370.upland <- AMS.SSP370.upland-AMS.upland
AMSchange.126.paddy <- AMS.SSP126.paddy-AMS.paddy
AMSchange.370.paddy <- AMS.SSP370.paddy-AMS.paddy


# SSP126 #
### Upland ###
AMSchange.126.upland.df = as.data.frame(AMSchange.126.upland,xy=TRUE)
ggplot(AMSchange.126.upland.df)+
  geom_density(aes(layer))

cols1n <- c(colorRampPalette(brewer.pal(11, 'PuOr'))(11)[c(2:11)]) # 

p.AMSchange.126.upland <- ggplot()+ 
  #geom_polygon(data=ocean_df, aes(long,lat,group=group),fill= "#e5e9f0", size = 0.1) +
  #geom_polygon(data=bbox, aes(x=long, y=lat), colour="black", fill="transparent", size = 0.3) +
  #geom_polygon(data=wmap, aes(x=long,y=lat,group=group),fill="#ededed", color="black", size = 0.5) +
  geom_polygon(data=worldMap,aes(x=long,y=lat,group=group),fill="#ededed",color="black",size=0.1)+
  geom_raster(data=AMSchange.126.upland.df,aes(x,y,fill=layer)) +
  scale_fill_discrete_gradient(
    bins = 10,
    colours = cols1n,
    breaks=c(-14,-7,0,7,14,21),
    limits = c(-14, 21),
    guide = guide_colourbar(nbin = 100, raster = FALSE, frame.colour = "black", ticks.colour = NA)) +
  xlab("Change in multiservices under SSP126 (%)") +
  coord_equal() + 
  theme_classic() + font+
  theme_opts
p.AMSchange.126.upland


### paddy ###
AMSchange.126.paddy.df = as.data.frame(AMSchange.126.paddy,xy=TRUE)
ggplot(AMSchange.126.paddy.df)+
  geom_density(aes(layer))


p.AMSchange.126.paddy <- ggplot()+ 
  #geom_polygon(data=ocean_df, aes(long,lat,group=group),fill= "#e5e9f0", size = 0.1) +
  #geom_polygon(data=bbox, aes(x=long, y=lat), colour="black", fill="transparent", size = 0.3) +
  #geom_polygon(data=wmap, aes(x=long,y=lat,group=group),fill="#ededed", color="black", size = 0.5) +
  geom_polygon(data=worldMap,aes(x=long,y=lat,group=group),fill="#ededed",color="black",size=0.1)+
  geom_raster(data=AMSchange.126.paddy.df,aes(x,y,fill=layer)) +
  scale_fill_discrete_gradient(
    bins = 10,
    colours = cols1n,
    breaks=c(-14,-7,0,7,14,21),
    limits = c(-14, 21),
    guide = guide_colourbar(nbin = 100, raster = FALSE, frame.colour = "black", ticks.colour = NA)) +
  xlab("Change in multiservices under SSP126 (%)") +
  coord_equal() + 
  theme_classic() + font+
  theme_opts
p.AMSchange.126.paddy


### Overall Effect ###
AMSchange.126.upland.df2 <- data.frame(AMSchange.126.upland.df[,3])
AMSchange.126.upland.df2$cropland.type <- "upland"
names(AMSchange.126.upland.df2) <- c("value","cropland.type")
AMSchange.126.paddy.df2 <- data.frame(AMSchange.126.paddy.df[,3])
AMSchange.126.paddy.df2$cropland.type <- "paddy"
names(AMSchange.126.paddy.df2) <- c("value","cropland.type")
AMSchange.126.global.df2 <- rbind.data.frame(AMSchange.126.upland.df2,AMSchange.126.paddy.df2)
AMSchange.126.global.df2$cropland.type <- "global"
AMSchange.126.global.df <- rbind.data.frame(AMSchange.126.upland.df2,AMSchange.126.paddy.df2,AMSchange.126.global.df2)
AMSchange.126.global.df$cropland.type <- factor(AMSchange.126.global.df$cropland.type,
                                                levels=c("upland","paddy","global"))
AMSchange.126.global.mean <- mean(AMSchange.126.global.df$value,na.rm=T)
AMSchange.126.upland.mean <- mean(AMSchange.126.upland.df2$value,na.rm=T)
AMSchange.126.paddy.mean <- mean(AMSchange.126.paddy.df2$value,na.rm=T)
AMSchange.126.upland.global.mean <- rbind.data.frame(AMSchange.126.global.mean,AMSchange.126.upland.mean,AMSchange.126.paddy.mean)
AMSchange.126.upland.global.mean$cropland.type <- c("global","upland","paddy")
AMSchange.126.upland.global.mean$cropland.type <- factor(AMSchange.126.upland.global.mean$cropland.type,
                                                         levels=c("upland","paddy","global"))
names(AMSchange.126.upland.global.mean) <- c("mean","cropland.type")


box.AMSchange.126.global <- ggplot(data=AMSchange.126.global.df,aes(cropland.type, value)) + 
  geom_boxplot(show.legend = F,na.rm=T,outlier.alpha=0.3,aes(fill=cropland.type)) +
  #geom_point(data=AMSchange.126.upland.continent.mean,aes(continent,mean),color="red",size=1.6)+
  geom_point(data=AMSchange.126.upland.global.mean,aes(cropland.type,mean),color="red",size=1.6)+
  scale_fill_manual(values = c("#efaf1280","#3e773980","#BEBADA")) + 
  ylab("Change under\nSSP126 (%)") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  geom_vline(xintercept = 2.5,linetype="dashed",color="black")+
  #geom_text(data=AMSchange.126.upland.continent.mean,aes(x=continent,y=-50,label=round(mean,2)),
  #          color="red")+
  #theme_classic(base_size = 8) +
  scale_x_discrete(labels=c("Upland","Paddy","Global"))+
  #geom_signif(comparisons=list(c("upland","paddy")),
  #            test = t.test,tip_length = 0,
  #            na.rm=T,map_signif_level = c("***"=0.001,"**"=0.01,"*"=0.05))+
  theme_cowplot()+font+
  theme(axis.text.x = element_text(angle=30,hjust = 1,colour = "black"),
        axis.title.x = element_blank())
box.AMSchange.126.global


# SSP370 #
### Upland ###
AMSchange.370.upland.df = as.data.frame(AMSchange.370.upland,xy=TRUE)
ggplot(AMSchange.370.upland.df)+
  geom_density(aes(layer))

cols2n <- c(colorRampPalette(brewer.pal(11, 'BrBG'))(11)[c(2:11)]) # 

p.AMSchange.370.upland <- ggplot()+ 
  #geom_polygon(data=ocean_df, aes(long,lat,group=group),fill= "#e5e9f0", size = 0.1) +
  #geom_polygon(data=bbox, aes(x=long, y=lat), colour="black", fill="transparent", size = 0.3) +
  #geom_polygon(data=wmap, aes(x=long,y=lat,group=group),fill="#ededed", color="black", size = 0.5) +
  geom_polygon(data=worldMap,aes(x=long,y=lat,group=group),fill="#ededed",color="black",size=0.1)+
  geom_raster(data=AMSchange.370.upland.df,aes(x,y,fill=layer)) +
  scale_fill_discrete_gradient(
    bins = 10,
    colours = cols2n,
    breaks=c(-14,-7,0,7,14,21),
    limits = c(-14, 21),
    guide = guide_colourbar(nbin = 100, raster = FALSE, frame.colour = "black", ticks.colour = NA)) +
  xlab("Change in multiservices under SSP370 (%)") +
  coord_equal() + 
  theme_classic() + font+
  theme_opts
p.AMSchange.370.upland


### paddy ###
AMSchange.370.paddy.df = as.data.frame(AMSchange.370.paddy,xy=TRUE)
ggplot(AMSchange.370.paddy.df)+
  geom_density(aes(layer))

cols3n <- c(colorRampPalette(brewer.pal(11, 'BrBG'))(11)[c(2,4,6:11)]) # 

p.AMSchange.370.paddy <- ggplot()+ 
  #geom_polygon(data=ocean_df, aes(long,lat,group=group),fill= "#e5e9f0", size = 0.1) +
  #geom_polygon(data=bbox, aes(x=long, y=lat), colour="black", fill="transparent", size = 0.3) +
  #geom_polygon(data=wmap, aes(x=long,y=lat,group=group),fill="#ededed", color="black", size = 0.5) +
  geom_polygon(data=worldMap,aes(x=long,y=lat,group=group),fill="#ededed",color="black",size=0.1)+
  geom_raster(data=AMSchange.370.paddy.df,aes(x,y,fill=layer)) +
  scale_fill_discrete_gradient(
    bins = 8,
    colours = cols3n,
    breaks=c(-6,0,6,12,18),
    limits = c(-6, 18),
    guide = guide_colourbar(nbin = 100, raster = FALSE, frame.colour = "black", ticks.colour = NA)) +
  xlab("Change in multiservices under SSP370 (%)") +
  coord_equal() + 
  theme_classic() + font+
  theme_opts
p.AMSchange.370.paddy


### Overall Effect ###
AMSchange.370.upland.df2 <- data.frame(AMSchange.370.upland.df[,3])
AMSchange.370.upland.df2$cropland.type <- "upland"
names(AMSchange.370.upland.df2) <- c("value","cropland.type")
AMSchange.370.paddy.df2 <- data.frame(AMSchange.370.paddy.df[,3])
AMSchange.370.paddy.df2$cropland.type <- "paddy"
names(AMSchange.370.paddy.df2) <- c("value","cropland.type")
AMSchange.370.global.df2 <- rbind.data.frame(AMSchange.370.upland.df2,AMSchange.370.paddy.df2)
AMSchange.370.global.df2$cropland.type <- "global"
AMSchange.370.global.df <- rbind.data.frame(AMSchange.370.upland.df2,AMSchange.370.paddy.df2,AMSchange.370.global.df2)
AMSchange.370.global.df$cropland.type <- factor(AMSchange.370.global.df$cropland.type,
                                                levels=c("upland","paddy","global"))
AMSchange.370.global.mean <- mean(AMSchange.370.global.df$value,na.rm=T)
AMSchange.370.upland.mean <- mean(AMSchange.370.upland.df2$value,na.rm=T)
AMSchange.370.paddy.mean <- mean(AMSchange.370.paddy.df2$value,na.rm=T)
AMSchange.370.upland.global.mean <- rbind.data.frame(AMSchange.370.global.mean,AMSchange.370.upland.mean,AMSchange.370.paddy.mean)
AMSchange.370.upland.global.mean$cropland.type <- c("global","upland","paddy")
AMSchange.370.upland.global.mean$cropland.type <- factor(AMSchange.370.upland.global.mean$cropland.type,
                                                         levels=c("upland","paddy","global"))
names(AMSchange.370.upland.global.mean) <- c("mean","cropland.type")


box.AMSchange.370.global <- ggplot(data=AMSchange.370.global.df,aes(cropland.type, value)) + 
  geom_boxplot(show.legend = F,na.rm=T,outlier.alpha=0.3,aes(fill=cropland.type)) +
  #geom_point(data=AMSchange.370.upland.continent.mean,aes(continent,mean),color="red",size=1.6)+
  geom_point(data=AMSchange.370.upland.global.mean,aes(cropland.type,mean),color="red",size=1.6)+
  scale_fill_manual(values = c("#efaf1280","#3e773980","#BEBADA")) + 
  ylab("Change under\nSSP370 (%)") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  geom_vline(xintercept = 2.5,linetype="dashed",color="black")+
  #geom_text(data=AMSchange.370.upland.continent.mean,aes(x=continent,y=-50,label=round(mean,2)),
  #          color="red")+
  #theme_classic(base_size = 8) +
  scale_x_discrete(labels=c("Upland","Paddy","Global"))+
  #geom_signif(comparisons=list(c("upland","paddy")),
  #            test = t.test,tip_length = 0,
  #            na.rm=T,map_signif_level = c("***"=0.001,"**"=0.01,"*"=0.05))+
  theme_cowplot()+font+
  theme(axis.text.x = element_text(angle=30,hjust = 1,colour = "black"),
        axis.title.x = element_blank())
box.AMSchange.370.global


####Trend of AMS####
line.data <- read.csv("Future projection mean.csv")
line.AMS <- line.data[line.data$variable=="AMS",]
line.AMS.upland <- line.AMS[line.AMS$cropland.type=="upland",]
line.AMS.upland$pathway <- factor(line.AMS.upland$pathway,labels = c("SSP126","SSP370"))
line.AMS.upland$period <- factor(line.AMS.upland$period,
                                 levels = c("current","2020s","2040s","2060s","2090s"),
                                 labels = c("Current","2020s","2040s","2060s","2090s"))

line.upland <- ggplot(line.AMS.upland, aes(y=mean, x=period,color=pathway))+ 
  geom_line(aes(group=pathway))+ geom_point(size=3,alpha=0.35)+
  labs(x="Period", y="Agroecosystem\nmultiservices (%)\n")+
  scale_color_manual(values = c("purple","darkgreen"))+
  theme_cowplot()+font+theme(axis.title.x = element_blank(),
                             axis.text.x = element_text(angle=30,hjust = 1))+
  theme(legend.position = "none")

line.AMS.paddy <- line.AMS[line.AMS$cropland.type=="paddy",]
line.AMS.paddy$pathway <- factor(line.AMS.paddy$pathway,labels = c("SSP126","SSP370"))
line.AMS.paddy$period <- factor(line.AMS.paddy$period,
                                levels = c("current","2020s","2040s","2060s","2090s"),
                                labels = c("Current","2020s","2040s","2060s","2090s"))

line.paddy <- ggplot(line.AMS.paddy, aes(y=mean, x=period,color=pathway))+ 
  geom_line(aes(group=pathway))+ geom_point(size=3,alpha=0.35)+
  labs(x="Period", y="Agroecosystem\nmultiservices (%)\n")+
  scale_color_manual(values = c("purple","darkgreen"))+
  theme_cowplot()+font+theme(axis.title.x = element_blank(),
                             axis.text.x = element_text(angle=30,hjust = 1))+
  theme(legend.position = "none")

line.AMS.upland$time <- ifelse(line.AMS.upland$period=="Current",2020,
                               ifelse(line.AMS.upland$period=="2020s",2025,
                                      ifelse(line.AMS.upland$period=="2040s",2045,
                                             ifelse(line.AMS.upland$period=="2060s",2065,2095))))
line.AMS.paddy$time <- ifelse(line.AMS.paddy$period=="Current",2020,
                              ifelse(line.AMS.paddy$period=="2020s",2025,
                                     ifelse(line.AMS.paddy$period=="2040s",2045,
                                            ifelse(line.AMS.paddy$period=="2060s",2065,2095))))
line.AMS$time <- ifelse(line.AMS$period=="current",2020,
                        ifelse(line.AMS$period=="2020s",2025,
                               ifelse(line.AMS$period=="2040s",2045,
                                      ifelse(line.AMS$period=="2060s",2065,2095))))

slope.AMS.upland <- lm(mean~time,line.AMS.upland)
slope.AMS.upland.boot <- confint(slope.AMS.upland,method="boot")
slope.AMS.upland.boot.df <- rbind.data.frame(slope.AMS.upland.boot)[2,]
slope.AMS.upland.boot.df$mean <- (slope.AMS.upland.boot.df$`2.5 %`+slope.AMS.upland.boot.df$`97.5 %`)/2
names(slope.AMS.upland.boot.df) <- c("CI1","CI2","mean")
slope.AMS.upland.boot.df$type <- "Upland"

slope.AMS.paddy <- lm(mean~time,line.AMS.paddy)
slope.AMS.paddy.boot <- confint(slope.AMS.paddy,method="boot")
slope.AMS.paddy.boot.df <- rbind.data.frame(slope.AMS.paddy.boot)[2,]
slope.AMS.paddy.boot.df$mean <- (slope.AMS.paddy.boot.df$`2.5 %`+slope.AMS.paddy.boot.df$`97.5 %`)/2
names(slope.AMS.paddy.boot.df) <- c("CI1","CI2","mean")
slope.AMS.paddy.boot.df$type <- "Paddy"

slope.AMS.global <- lm(mean~time,line.AMS)
slope.AMS.global.boot <- confint(slope.AMS.global,method="boot")
slope.AMS.global.boot.df <- rbind.data.frame(slope.AMS.global.boot)[2,]
slope.AMS.global.boot.df$mean <- (slope.AMS.global.boot.df$`2.5 %`+slope.AMS.global.boot.df$`97.5 %`)/2
names(slope.AMS.global.boot.df) <- c("CI1","CI2","mean")
slope.AMS.global.boot.df$type <- "Global"

slope.AMS.all <- rbind.data.frame(slope.AMS.upland.boot.df,slope.AMS.paddy.boot.df,
                                  slope.AMS.global.boot.df)

slope.global <- ggplot(data=slope.AMS.all,aes(type, mean)) + 
  geom_point(aes(color=type),size=3.6,alpha=1)+
  geom_errorbar(aes(y=mean,ymin=CI1,ymax=CI2,x=type,color=type), width=0, size=0.75)+
  scale_color_manual(values = c("#efaf1280","#3e773980","#BEBADA")) +
  scale_y_continuous(breaks = c(0,0.03,0.06,0.09))+
  ylab("Boostrapped\nslope of time") +
  geom_hline(yintercept = 0,linetype="dashed",color="black")+
  geom_vline(xintercept = 2.5,linetype="dashed",color="black")+
  scale_x_discrete(labels=c("Upland","Paddy","Global"))+
  theme_cowplot()+font+
  theme(axis.text.x = element_text(angle=30,hjust = 1,colour = "black"),
        axis.title.x = element_blank(),legend.position = "none")
slope.global


###Proportion of trade-off###
upland_synergism <- upland_data%>%filter(Yield>=0)%>%filter(NGHGB>=0)
upland_negative<- upland_data%>%filter(Yield<0)%>%filter(NGHGB<0)
upland_tradeoff <- upland_data%>%filter(is.na(Yield)==F)%>%filter(is.na(NGHGB)==F)

paddy_synergism <- paddy_data%>%filter(Yield>=0)%>%filter(NGHGB>=0)
paddy_negative<- paddy_data%>%filter(Yield<0)%>%filter(NGHGB<0)
paddy_tradeoff <- paddy_data%>%filter(is.na(Yield)==F)%>%filter(is.na(NGHGB)==F)

global_data <- rbind.data.frame(upland_data[,-6],paddy_data)
global_synergism <- global_data%>%filter(Yield>=0)%>%filter(NGHGB>=0)
global_negative<- global_data%>%filter(Yield<0)%>%filter(NGHGB<0)
global_tradeoff <- global_data%>%filter(is.na(Yield)==F)%>%filter(is.na(NGHGB)==F)

upland_proportion <- c(233561,120245,15852)
upland_type <- c("Synergism","Trade-off","Negative")  
upland_proportion.df <- cbind.data.frame(upland_proportion,upland_type)
names(upland_proportion.df) <- c("proportion","type")

paddy_proportion <- c(94286,36893,4181)
paddy_type <- c("Synergism","Trade-off","Negative")  
paddy_proportion.df <- cbind.data.frame(paddy_proportion,paddy_type)
names(paddy_proportion.df) <- c("proportion","type")

global_proportion <- c(327847,157138,20033)
global_type <- c("Synergism","Trade-off","Negative")  
global_proportion.df <- cbind.data.frame(global_proportion,global_type)
names(global_proportion.df) <- c("proportion","type")

tradeoff_global <- rbind.data.frame(upland_proportion.df,paddy_proportion.df,global_proportion.df)
tradeoff_global$cropland.type <- c("Upland","Upland","Upland","Paddy","Paddy","Paddy",
                                   "Global","Global","Global")
tradeoff_global$total <- c(369658,369658,369658,135360,135360,135360,505018,505018,505018)
tradeoff_global$perc <- tradeoff_global$proportion/tradeoff_global$total*100


trade.plot <- tradeoff_global %>% 
  mutate(cropland.type=factor(cropland.type,levels = c("Upland","Paddy","Global"))) %>% 
  mutate(type=factor(type,levels = c("Synergism","Trade-off","Negative"))) %>% 
  ggplot(aes(x=cropland.type,y=perc))+
  geom_bar(aes(fill=type),
           stat="identity",
           position = "fill",
           width = 0.4)+
  scale_fill_manual(values = c("#7ec7bd","#f09004","#e30528"))+
  geom_vline(xintercept = 2.5,linetype="dashed",color="black")+
  scale_y_continuous(expand = c(0,0),labels = c(0,25,50,75,100))+
  ylab("Proportion of\ntrade-offs")+
  theme_cowplot()+font+theme(legend.position = "none")+
  #annotate("text",x=1,y=0.7,label="Synergism\n63.18%")+
  #annotate("text",x=2,y=0.7,label="\n69.66%")+
  #annotate("text",x=3,y=0.7,label="\n64.92%")+
  #annotate("text",x=1,y=0.2,label="Trade-off\n32.53%")+
  #annotate("text",x=2,y=0.2,label="\n27.26%")+
  #annotate("text",x=3,y=0.2,label="\n31.12%")+
  #annotate("text",x=1.475,y=0.1,label="Negative\n4.29%")+
  #annotate("text",x=2.475,y=0.1,label="\n3.09%")+
  #annotate("text",x=3.475,y=0.1,label="\n3.97%")+
  #annotate("segment",x=1.275,xend=1,y=0.065,yend = 0.025)+
  #annotate("segment",x=2.275,xend=2,y=0.065,yend = 0.025)+
#annotate("segment",x=3.275,xend=3,y=0.065,yend = 0.025)+
theme(axis.text.x = element_text(angle=30,hjust = 1,colour = "black"),
      axis.title.x = element_blank(),legend.position = "none")
trade.plot



maps.upland <- plot_grid( p.AMS.upland + theme(plot.margin = unit(c(0,-1,-1,-1), "cm")), 
                          p1 + theme(plot.margin = unit(c(0,-1,-1,-1), "cm")),
                          p.AMSchange.126.upland + theme(plot.margin = unit(c(0,-1,-1,-1), "cm")) ,
                          p.AMSchange.370.upland + theme(plot.margin = unit(c(0,-1,-1,-1), "cm")),
                          #line.upland + theme(plot.margin = unit(c(0,-1,-1,-1), "cm")) ,
                          align = 'h', 
                          label_size = 15,
                          labels = c("a","d","g"," j","m"),
                          #hjust = -3, 
                          #vjust= 4,
                          nrow = 5,
                          ncol=1
)

maps.paddy <- plot_grid( p.AMS.paddy + theme(plot.margin = unit(c(0,-1,-1,-1), "cm")), 
                         p3 + theme(plot.margin = unit(c(0,-1,-1,-1), "cm")),
                         p.AMSchange.126.paddy + theme(plot.margin = unit(c(0,-1,-1,-1), "cm")) ,
                         p.AMSchange.370.paddy + theme(plot.margin = unit(c(0,-1,-1,-1), "cm")),
                         #line.paddy + theme(plot.margin = unit(c(0,-1,-1,-1), "cm")) ,
                         align = 'h', 
                         label_size = 15,
                         labels = c("b","e","h","k","n"),
                         #hjust = -3, 
                         #vjust= 4,
                         nrow = 5,
                         ncol=1
)

box.global <- plot_grid( box.AMS.global,
                         trade.plot,
                         box.AMSchange.126.global,
                         box.AMSchange.370.global,
                         slope.global,
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



total <- plot_grid(maps.upland+ theme(plot.margin = unit(c(0,0,0,0), "cm")),
                   maps.paddy + theme(plot.margin = unit(c(0,0,0,0), "cm")),
                   box.global+theme(plot.margin = unit(c(0,0,0,0), "cm")),
                   labels =NULL ,
                   rel_widths = c(1,1,0.5),
                   nrow = 1, ncol=3)
total#11.6*11 inches


line.group <- plot_grid( line.upland  ,
                         line.paddy  ,
                         align = 'h', 
                         label_size = 15,
                         labels = c("m","n"),
                         #hjust = -3, 
                         #vjust= 4,
                         nrow = 1,
                         ncol=2
)
line.group 

ggdraw()+
  draw_plot(total, x=0, y=0, width = 1, height = 1)+
  draw_plot(line.group , x=0, y=0, width = 0.8, height = 0.2)+
  draw_plot(p2, x=0.04, y=0.65, width = 0.055, height = 0.055)+
  draw_plot(p2, x=0.44, y=0.65, width = 0.055, height = 0.055)#11.6*11 inches
