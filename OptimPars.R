library(apsimx)
library(dplyr)
library(BayesianTools)
library(rstantools)
library(doParallel)

RunApsim=function(Simsfile,models_exe){
  cmd <- paste0('"', models_exe, '" "', Simsfile)
  r <- system(cmd, intern = FALSE,ignore.stdout=F,show.output.on.console=F) 
}

models_exe="C:/Program Files (x86)/APSIM710-r4221/Model/ApsimModel.exe"


RRMSEFun=function(simvalue,obsvalue) {
  valid_indices <- complete.cases(simvalue, obsvalue)
  simvalue <- simvalue[valid_indices]
  obsvalue <- obsvalue[valid_indices]
  sqrt(mean((simvalue-obsvalue)^2))/mean(obsvalue)}
R2Fun=function(simvalue,obsvalue){
  valid_indices <- complete.cases(simvalue, obsvalue)
  simvalue <- simvalue[valid_indices]
  obsvalue <- obsvalue[valid_indices]
  summary(lm(simvalue~1+obsvalue))$r.squared}

Obs_Wheat <- read.csv("E:/Data/APSIM/Apsim Training/New/Obs4.csv")%>%filter(primary.crop=="wheat")
Obs_Wheat_Mixture <- Obs_Wheat%>%filter(type=="mixture")%>%dplyr::select(ID,gridcell,depth..cm.,yield.t,Cstock.t,
                                                                         layer1,layer2,layer3,layer4,
                                                                         layer5,layer6,layer7,layer8)
output_Mixture_yield <- vector()
output_Mixture_Cstock <- vector()
Obs_Wheat_Legume <- Obs_Wheat%>%filter(type=="legume")%>%dplyr::select(ID,gridcell,depth..cm.,yield.t,Cstock.t,
                                                                       layer1,layer2,layer3,layer4,
                                                                       layer5,layer6,layer7,layer8)
output_Legume_yield <- vector()
output_Legume_Cstock <- vector()
Obs_Wheat_Nonlegume <- Obs_Wheat%>%filter(type=="non-legume")%>%dplyr::select(ID,gridcell,depth..cm.,yield.t,Cstock.t,
                                                                              layer1,layer2,layer3,layer4,
                                                                              layer5,layer6,layer7,layer8)
output_Nonlegume_yield <- vector()
output_Nonlegume_Cstock <- vector()
Obs_Wheat_NoCC <- Obs_Wheat%>%dplyr::select(ID,gridcell,depth..cm.,yield.ck,Cstock.ck,
                                            layer1,layer2,layer3,layer4,
                                            layer5,layer6,layer7,layer8)
output_NoCC_yield <- vector()
output_NoCC_Cstock <- vector()

data_for_optim <- function(wheat){
  ##Mixture##
  setwd('E:/Data/APSIM/Apsim Training/New/Wheat/OptimPars/Mixture')
  ID <- Obs_Wheat_Mixture$ID
  for (i in 1:length(ID)) {
    df_Mixture <- read.table(paste0(ID[i],".out"), header = TRUE, skip = 3, stringsAsFactors = FALSE)
    output_Mixture_yield[i] <- df_Mixture$paddock.wheat.yield%>%tail(180)%>%as.numeric()%>%max(na.rm = T)
    df_Mixture_Cstock <- df_Mixture[,5:12]%>%as.data.frame()%>%tail(1)%>%
      mutate(Cstock=as.numeric(carbon_tot.1.)*Obs_Wheat_Mixture[i,]$layer1+as.numeric(carbon_tot.2.)*Obs_Wheat_Mixture[i,]$layer2+
               as.numeric(carbon_tot.3.)*Obs_Wheat_Mixture[i,]$layer3+as.numeric(carbon_tot.4.)*Obs_Wheat_Mixture[i,]$layer4+
               as.numeric(carbon_tot.5.)*Obs_Wheat_Mixture[i,]$layer5+as.numeric(carbon_tot.6.)*Obs_Wheat_Mixture[i,]$layer6+
               as.numeric(carbon_tot.7.)*Obs_Wheat_Mixture[i,]$layer7+as.numeric(carbon_tot.8.)*Obs_Wheat_Mixture[i,]$layer8)
    output_Mixture_Cstock[i] <- df_Mixture_Cstock$Cstock
  }
  
  Obs_Wheat_Mixture <- Obs_Wheat_Mixture%>%mutate(yield.sims=output_Mixture_yield,Cstock.sims=output_Mixture_Cstock/1000)%>%
    dplyr::select(-c("layer1","layer2","layer3","layer4","layer5","layer6", "layer7","layer8"))
  
  ##Legume##
  setwd('E:/Data/APSIM/Apsim Training/New/Wheat/OptimPars/Legume')
  ID <- Obs_Wheat_Legume$ID
  for (i in 1:length(ID)) {
    df_Legume <- read.table(paste0(ID[i],".out"), header = TRUE, skip = 3, stringsAsFactors = FALSE)
    output_Legume_yield[i] <- df_Legume$paddock.wheat.yield%>%tail(180)%>%as.numeric()%>%max(na.rm = T)
    df_Legume_Cstock <- df_Legume[,4:11]%>%as.data.frame()%>%tail(1)%>%
      mutate(Cstock=as.numeric(carbon_tot.1.)*Obs_Wheat_Legume[i,]$layer1+as.numeric(carbon_tot.2.)*Obs_Wheat_Legume[i,]$layer2+
               as.numeric(carbon_tot.3.)*Obs_Wheat_Legume[i,]$layer3+as.numeric(carbon_tot.4.)*Obs_Wheat_Legume[i,]$layer4+
               as.numeric(carbon_tot.5.)*Obs_Wheat_Legume[i,]$layer5+as.numeric(carbon_tot.6.)*Obs_Wheat_Legume[i,]$layer6+
               as.numeric(carbon_tot.7.)*Obs_Wheat_Legume[i,]$layer7+as.numeric(carbon_tot.8.)*Obs_Wheat_Legume[i,]$layer8)
    output_Legume_Cstock[i] <- df_Legume_Cstock$Cstock
  }
  
  Obs_Wheat_Legume <- Obs_Wheat_Legume%>%mutate(yield.sims=output_Legume_yield,Cstock.sims=output_Legume_Cstock/1000)%>%
    dplyr::select(-c("layer1","layer2","layer3","layer4","layer5","layer6", "layer7","layer8"))  
  
  ##Nonlegume##
  setwd('E:/Data/APSIM/Apsim Training/New/Wheat/OptimPars/Nonlegume')
  ID <- Obs_Wheat_Nonlegume$ID
  for (i in 1:length(ID)) {
    df_Nonlegume <- read.table(paste0(ID[i],".out"), header = TRUE, skip = 3, stringsAsFactors = FALSE)
    output_Nonlegume_yield[i] <- df_Nonlegume$paddock.wheat.yield%>%tail(180)%>%as.numeric()%>%max(na.rm = T)
    df_Nonlegume_Cstock <- df_Nonlegume[,4:11]%>%as.data.frame()%>%tail(1)%>%
      mutate(Cstock=as.numeric(carbon_tot.1.)*Obs_Wheat_Nonlegume[i,]$layer1+as.numeric(carbon_tot.2.)*Obs_Wheat_Nonlegume[i,]$layer2+
               as.numeric(carbon_tot.3.)*Obs_Wheat_Nonlegume[i,]$layer3+as.numeric(carbon_tot.4.)*Obs_Wheat_Nonlegume[i,]$layer4+
               as.numeric(carbon_tot.5.)*Obs_Wheat_Nonlegume[i,]$layer5+as.numeric(carbon_tot.6.)*Obs_Wheat_Nonlegume[i,]$layer6+
               as.numeric(carbon_tot.7.)*Obs_Wheat_Nonlegume[i,]$layer7+as.numeric(carbon_tot.8.)*Obs_Wheat_Nonlegume[i,]$layer8)
    output_Nonlegume_Cstock[i] <- df_Nonlegume_Cstock$Cstock
  }
  
  Obs_Wheat_Nonlegume <- Obs_Wheat_Nonlegume%>%mutate(yield.sims=output_Nonlegume_yield,Cstock.sims=output_Nonlegume_Cstock/1000)%>%
    dplyr::select(-c("layer1","layer2","layer3","layer4", "layer5","layer6","layer7","layer8"))
  
  ##NoCC##
  setwd('E:/Data/APSIM/Apsim Training/New/Wheat/OptimPars/NoCC')
  ID <- Obs_Wheat_NoCC$ID
  for (i in 1:length(ID)) {
    df_NoCC <- read.table(paste0(ID[i],".out"), header = TRUE, skip = 3, stringsAsFactors = FALSE)
    output_NoCC_yield[i] <- df_NoCC$yield%>%tail(180)%>%as.numeric()%>%max(na.rm = T)
    df_NoCC_Cstock <- df_NoCC[,3:10]%>%as.data.frame()%>%tail(1)%>%
      mutate(Cstock=as.numeric(carbon_tot.1.)*Obs_Wheat_NoCC[i,]$layer1+as.numeric(carbon_tot.2.)*Obs_Wheat_NoCC[i,]$layer2+
               as.numeric(carbon_tot.3.)*Obs_Wheat_NoCC[i,]$layer3+as.numeric(carbon_tot.4.)*Obs_Wheat_NoCC[i,]$layer4+
               as.numeric(carbon_tot.5.)*Obs_Wheat_NoCC[i,]$layer5+as.numeric(carbon_tot.6.)*Obs_Wheat_NoCC[i,]$layer6+
               as.numeric(carbon_tot.7.)*Obs_Wheat_NoCC[i,]$layer7+as.numeric(carbon_tot.8.)*Obs_Wheat_NoCC[i,]$layer8)
    output_NoCC_Cstock[i] <- df_NoCC_Cstock$Cstock
  }
  
  Obs_Wheat_NoCC <- Obs_Wheat_NoCC%>%mutate(yield.sims=output_NoCC_yield,Cstock.sims=output_NoCC_Cstock/1000)%>%
    dplyr::select(-c("layer1","layer2","layer3","layer4","layer5","layer6", "layer7","layer8"))
  
  ###Merge###
  Obs_Wheat_NoCC <- Obs_Wheat_NoCC%>%
    mutate(type="NoCC")%>%`colnames<-`(c("ID","gridcell","depth","yield.obs","Cstock.obs",
                                         "yield.sims","Cstock.sims","type"))
  Obs_Wheat_Legume <- Obs_Wheat_Legume%>%
    mutate(type="Legume")%>%`colnames<-`(c("ID","gridcell","depth","yield.obs","Cstock.obs",
                                           "yield.sims","Cstock.sims","type"))
  Obs_Wheat_Nonlegume <- Obs_Wheat_Nonlegume%>%
    mutate(type="Nonlegume")%>%`colnames<-`(c("ID","gridcell","depth","yield.obs","Cstock.obs",
                                              "yield.sims","Cstock.sims","type"))
  Obs_Wheat_Mixture <- Obs_Wheat_Mixture%>%
    mutate(type="Mixture")%>%`colnames<-`(c("ID","gridcell","depth","yield.obs","Cstock.obs",
                                            "yield.sims","Cstock.sims","type"))
  
  results_wheat <- rbind.data.frame(Obs_Wheat_NoCC,Obs_Wheat_Legume,Obs_Wheat_Nonlegume,Obs_Wheat_Mixture)
  
  results_wheat_summarise <- results_wheat%>%dplyr::summarise(
    RRMSE.yield=RRMSEFun(yield.obs,yield.sims),
    R2.yield=R2Fun(yield.obs,yield.sims),
    RRMSE.Cstock=RRMSEFun(Cstock.obs,Cstock.sims),
    R2.Cstock=R2Fun(Cstock.obs,Cstock.sims)
  )
  
  results <- list(results_wheat,results_wheat_summarise)
  return(results)
}


ObjectFun=function(pars){ 
  setwd('E:/Data/APSIM/Apsim Training/New/Wheat')
  ##NoCC
  Sims=list.files("OptimPars/NoCC/",pattern = ".apsim$",full.names = T)
  cl <- makeCluster(20)
  tictoc::tic()
  parLapply(cl,Sims,RunApsim,models_exe)
  
  ##Legume
  Sims=list.files("OptimPars/Legume/",pattern = ".apsim$",full.names = T)
  parLapply(cl,Sims,RunApsim,models_exe)
  
  ##Nonlegume
  Sims=list.files("OptimPars/Nonlegume/",pattern = ".apsim$",full.names = T)
  parLapply(cl,Sims,RunApsim,models_exe)
  
  ##Mixture
  Sims=list.files("OptimPars/Mixture/",pattern = ".apsim$",full.names = T)
  parLapply(cl,Sims,RunApsim,models_exe)
  tictoc::toc()
  stopCluster(cl)
  
  data_for_optim("wheat")
}

results_2 <- ObjectFun()
View(results_2[[1]])
results_2[[2]]

