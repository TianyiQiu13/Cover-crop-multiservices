library(metafor)
library(pbkrtest)
library(car)
library(piecewiseSEM)
library(ggplot2)
library(gridExtra)
library(reshape)
library(doSNOW)
library(parallel)
library(gam)
library(jsonlite)
library(MASS)
library(boot)
library(dplyr)
library(segmented)
library(chngpt)
library(snow)
library(ggpubr)
library(piecewiseSEM)
library(optimParallel)
library(rlang)
library(DMwR)
library(cowplot)

font=theme(axis.title=element_text(size=13),axis.text = element_text(size=12,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12))#11.6inches
bootari<-function (DF,model,var){
  
  DF<-DF[order(DF[var]),]
  #detectCores()
  cl<-makeCluster(detectCores()-2)
  registerDoSNOW(cl)
  NsimB<-500
  varNote<-double()
  vectorVAR<-as.matrix(unique(DF[var]))
  
  for(i in 1:(nrow(unique(DF[var]))-29)){
    try({
      #subset data
      dfi<-DF[as.matrix(DF[var]) %in% vectorVAR[i:(i+29)],]
      #scale all
      dfi$AMS<-scale(dfi$AMS,center = TRUE,scale = TRUE)
      dfi$climate<-scale(dfi$climate,center = TRUE,scale = TRUE)
      dfi$soil<-scale(dfi$soil,center = TRUE,scale = TRUE)
      dfi$microbe<-scale(dfi$microbe,center = TRUE,scale = TRUE)
      #modelfit
      fit<-lmer(model,data=dfi)
      #bootstrap model
      boot<-bootMer(fit,fixef,nsim = NsimB,parallel = "snow")
      results<-boot$t
      #mergedataset
      if(i==1){bt=results}else{bt=rbind(bt,results)}
      
      varNote<-c(varNote,rep(mean(vectorVAR[i:(i+29)]),NsimB))
      
    })
    
  }
  bt<-as.data.frame(bt)
  bt$variable<-varNote
  
  stopCluster(cl)
  
  return(bt)
}


AMS1 <- read.csv("AMS-upland.csv",row.names = 1) 
AMS2 <- read.csv("AMS-paddy.csv",row.names = 1) 
AMS <- rbind.data.frame(AMS1,AMS2)
AMS <- AMS[,c(1,25,34:37)]
AMS <- AMS%>%filter(terminate.time>-21)%>%filter(terminate.time<90)
AMS$terminate.time <- scale(AMS$terminate.time,scale=T,center=T)
AMS$study <- as.factor(AMS$study)

model1 <- lme4::lmer(AMS~terminate.time+climate+soil+microbe+(1|study),data=AMS)
model2 <- lme4::lmer(AMS~terminate.time+climate+soil+microbe+
                       terminate.time*climate+terminate.time*soil+
                       terminate.time*microbe+(1|study),data=AMS)
model3 <- lme4::lmer(AMS~terminate.time+climate+soil+microbe+
                       terminate.time*climate+terminate.time*soil+
                       terminate.time*microbe+terminate.time*climate*soil+
                       terminate.time*climate*microbe+terminate.time*soil*microbe+
                       (1|study),data=AMS)
model4 <- lme4::lmer(AMS~terminate.time+climate+soil+microbe+
                       terminate.time*climate+terminate.time*soil+
                       terminate.time*microbe+terminate.time*climate*soil+
                       terminate.time*climate*microbe+terminate.time*soil*microbe+
                       terminate.time*climate*soil*microbe+
                       (1|study),data=AMS)

AIC(model1,model2,model3,model4)#model4 has lowest AIC

model_MW<-"AMS~terminate.time+climate+soil+microbe+
                       terminate.time*climate+terminate.time*soil+
                       terminate.time*microbe+terminate.time*climate*soil+
                       terminate.time*climate*microbe+terminate.time*soil*microbe+
                       terminate.time*climate*soil*microbe+
                       (1|study)"
var <- "terminate.time"
bt<-bootari(AMS,model_MW,var)
colnames(bt)<-c("Intcp","terminate.time","climate","soil","microbe",
                "terminate.time:climate","terminate.time:soil","terminate.time:microbe",
                "climate:soil","climate:microbe","soil:microbe",
                "terminate.time:climate:soil","terminate.time:climate:microbe",
                "terminate.time:soil:microbe","climate:soil:microbe",
                "terminate.time:climate:soil:microbe","var")


data.pred=data.frame(climate=predict(gam(data = bt,formula = `terminate.time:climate`~s(var)),
                                     data.frame(var=bt$var)),
                     soil=predict(gam(data = bt,formula = `terminate.time:soil`~s(var)),
                                 data.frame(var=bt$var)),
                     microbe=predict(gam(data = bt,formula = `terminate.time:microbe`~s(var)),
                                  data.frame(var=bt$var)),
                     terminate.time=predict(gam(data = bt,formula = terminate.time~s(var)),
                                            data.frame(var=bt$var)),
                     var=bt$var)


p30 <- ggplot(bt)+
  theme_cowplot()+
  geom_point(data=bt,aes(x=var,y=terminate.time,color=terminate.time),size=2,alpha=0.75)+
  geom_hline(yintercept=0)+
  geom_line(data=data.pred,aes(x=var,y=terminate.time),colour="black",size=1,linetype=1)+
  geom_vline(xintercept = 0.46,linetype=2,color="black",size=0.6)+
  scale_y_continuous(limits = c(-1.1,1.1))+
  scale_color_gradient2(low="#c40000",mid="white",high="#4682d9",midpoint = 0)+
  labs(x="Z-score CC termination time (d)",y="Standardized effects on agroecosystem multiservices")+
  theme(plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank() )+font+
  theme(legend.position = "none")+
  annotate("text",label="x = 0.46, 25 days",x=-0.05,y=-0.75,size=4.2,color="black")###7.0*6.2inches
p30
0.46*17.11847+17.59908

btf <- bt
btf$var <- factor(round(btf$var,2))

btf0.49 <- btf%>%filter(var==0.49)
t.test(btf0.49$`climate`,mu=0)

btclimate <- cbind.data.frame(btf$climate,bt$var)
btsoil <- cbind.data.frame(btf$`terminate.time:soil`,bt$var)
btmicrobe <- cbind.data.frame(btf$`terminate.time:microbe`,bt$var)

btclimate$type <- "Climate"
btsoil$type <- "CC termination time x soil"
btmicrobe$type <- "CC termination time x microbe"
names(btclimate) <- c("slope","var","type")
names(btsoil) <- c("slope","var","type")
names(btmicrobe) <- c("slope","var","type")

btinter <- rbind.data.frame(btclimate,btsoil,btmicrobe)
btinter$type <- factor(btinter$type,levels = c("Climate","CC termination time x soil",
                                               "CC termination time x microbe"))

ggplot(btinter,aes(x=factor(round(var,2)),y=slope,color=type))+
  geom_boxplot(size=0.5,outlier.shape = NA,color="black")+
  theme_cowplot()+
  facet_wrap(~type,nrow = 3)+
  geom_vline(xintercept = 20,linetype=2,color="black",size=0.6)+
  labs(x="Z-score Termination time (d)",y="Standardized effects on agroecosystem multiservices")+
  theme(panel.grid=element_blank())+theme(legend.position="none")+
  geom_jitter(aes(),width=0.2,shape=21,size=1,alpha=0.05)+
  scale_color_manual(name="",values = c("#197ec099","#f4772099","#b643df99"))+
  geom_hline(yintercept=0,colour="black")+font+
  theme(axis.text.x = element_text(angle=45,vjust=0.65))+
  annotate("label",label=paste("italic(P) < 0.001"),x=20,y=2.75,size=4.2,color="black",parse=T)+
  theme(strip.background = element_blank(),strip.text = element_text(hjust = 0.01))
