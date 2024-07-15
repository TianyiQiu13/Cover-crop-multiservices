library(raster)
library(tidyverse)
library(dplyr)
library(mapproj)
library(ggspatial)
library(ggalt)
library(rgdal)
library(rworldmap)
library(doParallel)
doParallel::registerDoParallel(20)

worldMap <- fortify(map_data("world"),region="group")
worldMap <- worldMap[worldMap$region!="Antarctica",]
worldcoordinate <- worldMap[,1:2]
country <- SpatialPoints(worldcoordinate,proj4string = CRS("+proj=longlat +datum=WGS84"))


#######upland######
#### Yield ####
yield_upland <- raster("yield.upland.percMean.tif")
yield_actural_upland <- raster("yield_upland_actual_Mg_ha_yr.tif")

yield_upland.country <- raster::extract(yield_upland,country)
yield_upland.country.df <- cbind.data.frame(worldMap,yield_upland.country)
yield_actural_upland.country <- raster::extract(yield_actural_upland,country)
yield_actural_upland.country.df <- cbind.data.frame(worldMap,yield_actural_upland.country)

yield_upland.country.df_output <- yield_upland.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
yield.upland.perc <- na.omit(yield_upland.country.df_output[,c(5,7)])

yield.upland.perc.agg <- aggregate(yield.upland.perc$yield_upland.country,
                                     list(yield.upland.perc$region),mean)

yield_actural_upland.country.df_output <- yield_actural_upland.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
yield_actural_upland.output <- na.omit(yield_actural_upland.country.df_output[,c(5,7)])

yield_actural_upland.output.agg <- aggregate(yield_actural_upland.output$yield_actural_upland.country,
                                   list(yield_actural_upland.output$region),mean)

write.csv(yield.upland.perc.agg,"yield.upland.perc.country.csv")
write.csv(yield_actural_upland.output.agg,"yield.upland.benefit.country.csv")

#### SOC ####
SOC_upland <- raster("SOC.upland.percMean.tif")

SOC_upland.country <- raster::extract(SOC_upland,country)
SOC_upland.country.df <- cbind.data.frame(worldMap,SOC_upland.country)

SOC_upland.country.df_output <- SOC_upland.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
SOC.upland.perc <- na.omit(SOC_upland.country.df_output[,c(5,7)])

SOC.upland.perc.agg <- aggregate(SOC.upland.perc$SOC_upland.country,
                                   list(SOC.upland.perc$region),mean)

write.csv(SOC.upland.perc.agg,"SOC.upland.perc.country.csv")

#### N2O ####
N2O_upland <- raster("N2O.upland.percMean.tif")

N2O_upland.country <- raster::extract(N2O_upland,country)
N2O_upland.country.df <- cbind.data.frame(worldMap,N2O_upland.country)

N2O_upland.country.df_output <- N2O_upland.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
N2O.upland.perc <- na.omit(N2O_upland.country.df_output[,c(5,7)])

N2O.upland.perc.agg <- aggregate(N2O.upland.perc$N2O_upland.country,
                                 list(N2O.upland.perc$region),mean)

write.csv(N2O.upland.perc.agg,"N2O.upland.perc.country.csv")

#### CH4 ####
CH4_upland <- raster("CH4.upland.percMean.tif")

CH4_upland.country <- raster::extract(CH4_upland,country)
CH4_upland.country.df <- cbind.data.frame(worldMap,CH4_upland.country)

CH4_upland.country.df_output <- CH4_upland.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
CH4.upland.perc <- na.omit(CH4_upland.country.df_output[,c(5,7)])

CH4.upland.perc.agg <- aggregate(CH4.upland.perc$CH4_upland.country,
                                 list(CH4.upland.perc$region),mean)

write.csv(CH4.upland.perc.agg,"CH4.upland.perc.country.csv")
#### MWD ####
MWD_upland <- raster("MWD.upland.percMean.tif")

MWD_upland.country <- raster::extract(MWD_upland,country)
MWD_upland.country.df <- cbind.data.frame(worldMap,MWD_upland.country)

MWD_upland.country.df_output <- MWD_upland.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
MWD.upland.perc <- na.omit(MWD_upland.country.df_output[,c(5,7)])

MWD.upland.perc.agg <- aggregate(MWD.upland.perc$MWD_upland.country,
                                 list(MWD.upland.perc$region),mean)

write.csv(MWD.upland.perc.agg,"MWD.upland.perc.country.csv")


#### NGHGB ####
NGHGB_upland <- raster("NGHGB_upland_actual_Mg_ha_yr.tif")

NGHGB_upland.country <- raster::extract(NGHGB_upland,country)
NGHGB_upland.country.df <- cbind.data.frame(worldMap,NGHGB_upland.country)

NGHGB_upland.country.df_output <- NGHGB_upland.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
NGHGB.upland.perc <- na.omit(NGHGB_upland.country.df_output[,c(5,7)])

NGHGB.upland.perc.agg <- aggregate(NGHGB.upland.perc$NGHGB_upland.country,
                                 list(NGHGB.upland.perc$region),mean)

write.csv(NGHGB.upland.perc.agg,"NGHGB.upland.perc.country.csv")

#### Erosion ####
Erosion_upland <- raster("MWD_upland_actual_Mg_ha_yr.tif")

Erosion_upland.country <- raster::extract(Erosion_upland,country)
Erosion_upland.country.df <- cbind.data.frame(worldMap,Erosion_upland.country)

Erosion_upland.country.df_output <- Erosion_upland.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
Erosion.upland.perc <- na.omit(Erosion_upland.country.df_output[,c(5,7)])

Erosion.upland.perc.agg <- aggregate(Erosion.upland.perc$Erosion_upland.country,
                                 list(Erosion.upland.perc$region),mean)

write.csv(Erosion.upland.perc.agg,"Erosion.upland.perc.country.csv")


#######paddy######
#### Yield ####
yield_paddy <- raster("yield.paddy.percMean.tif")
yield_actural_paddy <- raster("yield_paddy_actual_Mg_ha_yr.tif")

yield_paddy.country <- raster::extract(yield_paddy,country)
yield_paddy.country.df <- cbind.data.frame(worldMap,yield_paddy.country)
yield_actural_paddy.country <- raster::extract(yield_actural_paddy,country)
yield_actural_paddy.country.df <- cbind.data.frame(worldMap,yield_actural_paddy.country)

yield_paddy.country.df_output <- yield_paddy.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
yield.paddy.perc <- na.omit(yield_paddy.country.df_output[,c(5,7)])

yield_actural_paddy.country.df_output <- yield_actural_paddy.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
yield_actural_paddy.output <- na.omit(yield_actural_paddy.country.df_output[,c(5,7)])

yield.paddy.perc.agg <- aggregate(yield.paddy.perc$yield_paddy.country,
                                   list(yield.paddy.perc$region),mean)
yield_actural_paddy.output.agg <- aggregate(yield_actural_paddy.output$yield_actural_paddy.country,
                                             list(yield_actural_paddy.output$region),mean)

write.csv(yield.paddy.perc.agg,"yield.paddy.perc.country.csv")
write.csv(yield_actural_paddy.output.agg,"yield.paddy.benefit.country.csv")

#### SOC ####
SOC_paddy <- raster("SOC.paddy.percMean.tif")

SOC_paddy.country <- raster::extract(SOC_paddy,country)
SOC_paddy.country.df <- cbind.data.frame(worldMap,SOC_paddy.country)

SOC_paddy.country.df_output <- SOC_paddy.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
SOC.paddy.perc <- na.omit(SOC_paddy.country.df_output[,c(5,7)])

SOC.paddy.perc.agg <- aggregate(SOC.paddy.perc$SOC_paddy.country,
                                 list(SOC.paddy.perc$region),mean)

write.csv(SOC.paddy.perc.agg,"SOC.paddy.perc.country.csv")

#### N2O ####
N2O_paddy <- raster("N2O.paddy.percMean.tif")

N2O_paddy.country <- raster::extract(N2O_paddy,country)
N2O_paddy.country.df <- cbind.data.frame(worldMap,N2O_paddy.country)

N2O_paddy.country.df_output <- N2O_paddy.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
N2O.paddy.perc <- na.omit(N2O_paddy.country.df_output[,c(5,7)])

N2O.paddy.perc.agg <- aggregate(N2O.paddy.perc$N2O_paddy.country,
                                 list(N2O.paddy.perc$region),mean)

write.csv(N2O.paddy.perc.agg,"N2O.paddy.perc.country.csv")

#### CH4 ####
CH4_paddy <- raster("CH4.paddy.percMean.tif")

CH4_paddy.country <- raster::extract(CH4_paddy,country)
CH4_paddy.country.df <- cbind.data.frame(worldMap,CH4_paddy.country)

CH4_paddy.country.df_output <- CH4_paddy.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
CH4.paddy.perc <- na.omit(CH4_paddy.country.df_output[,c(5,7)])

CH4.paddy.perc.agg <- aggregate(CH4.paddy.perc$CH4_paddy.country,
                                 list(CH4.paddy.perc$region),mean)

write.csv(CH4.paddy.perc.agg,"CH4.paddy.perc.country.csv")

#### MWD ####
MWD_paddy <- raster("MWD.paddy.percMean.tif")

MWD_paddy.country <- raster::extract(MWD_paddy,country)
MWD_paddy.country.df <- cbind.data.frame(worldMap,MWD_paddy.country)

MWD_paddy.country.df_output <- MWD_paddy.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
MWD.paddy.perc <- na.omit(MWD_paddy.country.df_output[,c(5,7)])

MWD.paddy.perc.agg <- aggregate(MWD.paddy.perc$MWD_paddy.country,
                                 list(MWD.paddy.perc$region),mean)

write.csv(MWD.paddy.perc.agg,"MWD.paddy.perc.country.csv")

#### NGHGB ####
NGHGB_paddy <- raster("NGHGB_paddy_actual_Mg_ha_yr.tif")

NGHGB_paddy.country <- raster::extract(NGHGB_paddy,country)
NGHGB_paddy.country.df <- cbind.data.frame(worldMap,NGHGB_paddy.country)

NGHGB_paddy.country.df_output <- NGHGB_paddy.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
NGHGB.paddy.perc <- na.omit(NGHGB_paddy.country.df_output[,c(5,7)])

NGHGB.paddy.perc.agg <- aggregate(NGHGB.paddy.perc$NGHGB_paddy.country,
                                   list(NGHGB.paddy.perc$region),mean)

write.csv(NGHGB.paddy.perc.agg,"NGHGB.paddy.perc.country.csv")

#### Erosion ####
Erosion_paddy <- raster("MWD_paddy_actual_Mg_ha_yr.tif")

Erosion_paddy.country <- raster::extract(Erosion_paddy,country)
Erosion_paddy.country.df <- cbind.data.frame(worldMap,Erosion_paddy.country)

Erosion_paddy.country.df_output <- Erosion_paddy.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
Erosion.paddy.perc <- na.omit(Erosion_paddy.country.df_output[,c(5,7)])

Erosion.paddy.perc.agg <- aggregate(Erosion.paddy.perc$Erosion_paddy.country,
                                     list(Erosion.paddy.perc$region),mean)

write.csv(Erosion.paddy.perc.agg,"Erosion.paddy.perc.country.csv")



##########AMS##########
#### upland ####
AMS_upland <- raster("AMS.upland.percMean.tif")

AMS_upland.country <- raster::extract(AMS_upland,country)
AMS_upland.country.df <- cbind.data.frame(worldMap,AMS_upland.country)

AMS_upland.country.df_output <- AMS_upland.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
AMS.upland.perc <- na.omit(AMS_upland.country.df_output[,c(5,7)])

AMS.upland.perc.agg <- aggregate(AMS.upland.perc$AMS_upland.country,
                                     list(AMS.upland.perc$region),mean)

write.csv(AMS.upland.perc.agg,"AMS.upland.perc.country.csv")

#### paddy ####
AMS_paddy <- raster("AMS.paddy.percMean.tif")

AMS_paddy.country <- raster::extract(AMS_paddy,country)
AMS_paddy.country.df <- cbind.data.frame(worldMap,AMS_paddy.country)

AMS_paddy.country.df_output <- AMS_paddy.country.df%>%
  filter(region==c("Argentina","Australia","Austria","Belgium","Bolivia","Brazil","Bulgaria",
                   "Canada","Chile","China","Colombia","Czech Republic","Ecuador","Finland",
                   "France","Germany","Greece","Hungary","India","Indonesia","Iran","Ireland","Italy",
                   "Japan","South Korea","Mexico","Mongolia","Nepal","Netherlands","Nigeria","Norway",
                   "Pakistan","Paraguay","Peru","Philippines","Poland","Portugal","Romania",
                   "Saudi Arabia","Slovakia","South Africa","Spain","Sri Lanka","Sweden","Thailand",
                   "Turkey","United Kingdom","United States","Uruguay","Venezuela","Vietnam"))
AMS.paddy.perc <- na.omit(AMS_paddy.country.df_output[,c(5,7)])

AMS.paddy.perc.agg <- aggregate(AMS.paddy.perc$AMS_paddy.country,
                                 list(AMS.paddy.perc$region),mean)

write.csv(AMS.paddy.perc.agg,"AMS.paddy.perc.country.csv")
