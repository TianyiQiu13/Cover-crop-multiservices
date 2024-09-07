library(bootnet)
library(MVN)
library(huge)
library(qgraph)
library(dplyr)
library(igraph)
library(ggraph)
library(tidygraph)
library(bayestestR)
library(cowplot)

font=theme(axis.title=element_text(size=13),axis.text = element_text(size=12,colour = 'black'),
           strip.text = element_text(size=12),legend.title = element_text(size = 12),
           legend.text = element_text(size = 12))#11.6inches

#####Network calculation###
a <- read.csv("Prediction-fulldata-new.csv",row.names = 1)

###Upland###
upland <- a%>%filter(cropland.type=="upland")
RRs <- upland[,25:29]

mvn(data = RRs, mvnTest = "hz", scale=TRUE)
RRs.npn <- huge.npn(RRs, npn.func="truncation",verbose=T)
mvn(data = RRs.npn, mvnTest = "hz", scale=TRUE)

network <- estimateNetwork(RRs.npn,default = "EBICglasso",corMethod = "cor_auto",
                           weighted = T, signed=T,directed=F,
                           tuning = 0.5, threshold = T, criterion="ebic", verbose=F)
plot(network)

comm<-c("yield","SOCrr","N2O","CH4","MWD")
boot_network_stability <- bootnet(network, statistics=c("strength","edge","expectedInfluence"),
                                  weighted=T,signed=T, directed=F,computeCentrality=T, nCores=20,nBoots=1000,
                                  communities=comm, type="case")

corStability(boot_network_stability)###strength=0.75,caseMin=0.672,caseMax=1
boot_network<- bootnet(network, statistics=c("strength","edge","expectedInfluence"),
                       weighted=T,signed=T, directed=F,computeCentrality=T,
                       nCores=20,nBoots=1000,communities=comm, 
                       caseMin = 0.672, caseMax = 1)
centrality <- centrality_auto(network,weighted = TRUE, signed = TRUE)
centralityPlot(network)

save(boot_network,boot_network_stability,file="Network_metrics_upland.RData")

###Paddy###
paddy <- a%>%filter(cropland.type=="paddy")
RRs <- paddy[,25:29]

mvn(data = RRs, mvnTest = "hz", scale=TRUE)
RRs.npn <- huge.npn(RRs, npn.func="truncation",verbose=T)
mvn(data = RRs.npn, mvnTest = "hz", scale=TRUE)

network <- estimateNetwork(RRs.npn,default = "EBICglasso",corMethod = "cor_auto",
                           weighted = T, signed=T,directed=F,
                           tuning = 0.5, threshold = T, criterion="ebic", verbose=F)
plot(network)

comm<-c("yield","SOCrr","N2O","CH4","MWD")
boot_network_stability <- bootnet(network, statistics=c("strength","edge","expectedInfluence"),
                                  weighted=T,signed=T, directed=F,computeCentrality=T, nCores=20,nBoots=1000,
                                  communities=comm, type="case")

corStability(boot_network_stability)###strength=0.751,caseMin=0.672,caseMax=1
boot_network<- bootnet(network, statistics=c("strength","edge","expectedInfluence"),
                       weighted=T,signed=T, directed=F,computeCentrality=T,
                       nCores=20,nBoots=1000,communities=comm, 
                       caseMin = 0.672, caseMax = 1)
centrality <- centrality_auto(network,weighted = TRUE, signed = TRUE)
centralityPlot(network)

save(boot_network,boot_network_stability,file="Network_metrics_paddy.RData")


#####Plot#####
###upland###
load(file= "Network_metrics_upland.RData")
###Network###
Overr_upland<-summary(boot_network) %>% filter(., type=="edge") %>% 
  select(., node1, node2, mean, CIlower, CIupper) %>% 
  mutate(node1=ifelse(node1=="yield","Yield",node1),
         node2=ifelse(node2=="yield","Yield",node2),
         node1=ifelse(node1=="SOCrr",paste0("SOC[stock]"),node1),
         node2=ifelse(node2=="SOCrr",paste0("SOC[stock]"),node2),
         node1=ifelse(node1=="N2O",paste0("N[2]*O"),node1),
         node2=ifelse(node2=="N2O",paste0("N[2]*O"),node2),
         node1=ifelse(node1=="CH4",paste0("CH[4]"),node1),
         node2=ifelse(node2=="CH4",paste0("CH[4]"),node2),
         node1=ifelse(node1=="MWD","MWD",node1),
         node2=ifelse(node2=="MWD","MWD",node2)) %>% 
  arrange(.,mean)
Overr_upland$type <- NULL
Overr_upland<-dplyr::select(Overr_upland, node1, node2, mean)
Overr_c_upland<-graph_from_data_frame(Overr_upland, directed = F, vertices =NULL)
E(Overr_c_upland)$width <- Overr_upland$mean
edge.attributes(Overr_c_upland)$weight<-Overr_upland$mean

PartCorr_upland<-cluster_spinglass(Overr_c_upland, weights=E(Overr_c_upland)$width, implementation="neg")

Overr_cc_upland <- as_tbl_graph(Overr_c_upland)
Overr_cc_upland<-Overr_cc_upland %>% 
  activate(edges) %>%
  activate(nodes)
Overr_cc_upland$weight

x_upland<-c(0,1, 0.25,-1,0.35)
y_upland<-c(0,0.1,-0.75,0.25,0.75)
layout_upland<-cbind.data.frame(x=x_upland,y=y_upland)
layout_upland$order<-c(1,2,3,4,5)
layout_upland$node<-c("Yield",paste0("SOC[stock]"),paste0("N[2]*O"),paste0("CH[4]"),"MWD")

Over_c_upland<-ggraph(Overr_cc_upland,layout = layout_upland) + 
  #geom_edge_link(aes(width = abs(weight),label=round(abs(weight),digits=2)), 
  #                angle_calc="along",label_colour = '#2ca25f',label_dodge=unit(0.35,"cm"),
  #                colour="#2ca25f", alpha = 0.8) + 
  geom_edge_link(aes(width = abs(mean),color=weight),alpha = 0.8) + 
  #geom_edge_arc(aes(width = abs(weight), color=weight), strength=0.3)+
  #scale_edge_colour_viridis()+
  scale_edge_colour_gradient2(low="darkred",mid="lightgray",high="steelblue",midpoint = 0)+
  scale_edge_width(range = c(1, 3)) +
  geom_node_point(size = 16, colour = c("#e4615d","#fdc58f","#99d9d0","#95b2d6","#ea9c9d")) +
  theme_graph()+ theme(legend.position="none",
                       panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                       plot.margin= unit(c(20,20,20,20),'points'))+
  coord_cartesian(clip = "off")
Over_c_upland

###paddy###
load(file= "Network_metrics_paddy.RData")
###Network###
Overr_paddy<-summary(boot_network) %>% filter(., type=="edge") %>% 
  select(., node1, node2, mean, CIlower, CIupper) %>% 
  mutate(node1=ifelse(node1=="yield","Yield",node1),
         node2=ifelse(node2=="yield","Yield",node2),
         node1=ifelse(node1=="SOCrr",paste0("SOC[stock]"),node1),
         node2=ifelse(node2=="SOCrr",paste0("SOC[stock]"),node2),
         node1=ifelse(node1=="N2O",paste0("N[2]*O"),node1),
         node2=ifelse(node2=="N2O",paste0("N[2]*O"),node2),
         node1=ifelse(node1=="CH4",paste0("CH[4]"),node1),
         node2=ifelse(node2=="CH4",paste0("CH[4]"),node2),
         node1=ifelse(node1=="MWD","MWD",node1),
         node2=ifelse(node2=="MWD","MWD",node2)) %>% 
  arrange(.,mean)
Overr_paddy$type <- NULL
Overr_paddy<-dplyr::select(Overr_paddy, node1, node2, mean)
Overr_c_paddy<-graph_from_data_frame(Overr_paddy, directed = F, vertices =NULL)
E(Overr_c_paddy)$width <- Overr_paddy$mean
edge.attributes(Overr_c_paddy)$weight<-Overr_paddy$mean

PartCorr_paddy<-cluster_spinglass(Overr_c_paddy, weights=E(Overr_c_paddy)$width, implementation="neg")

Overr_cc_paddy <- as_tbl_graph(Overr_c_paddy)
Overr_cc_paddy<-Overr_cc_paddy %>% 
  activate(edges) %>%
  activate(nodes)

x_paddy<-c(0,1, 0.25,-1,0.35)
y_paddy<-c(0,0.1,-0.75,0.25,0.75)
layout_paddy<-cbind.data.frame(x=x_paddy,y=y_paddy)
layout_paddy$order<-c(1,2,3,4,5)
layout_paddy$node<-c("Yield",paste0("SOC[stock]"),paste0("N[2]*O"),paste0("CH[4]"),"MWD")

Over_c_paddy<-ggraph(Overr_cc_paddy,layout = layout_paddy) + 
  #geom_edge_link(aes(width = abs(weight),label=round(abs(weight),digits=2)), 
  #                angle_calc="along",label_colour = '#2ca25f',label_dodge=unit(0.35,"cm"),
  #                colour="#2ca25f", alpha = 0.8) + 
  geom_edge_link(aes(width = abs(mean), colour =weight),alpha = 0.8) + 
  #geom_edge_arc(aes(width = abs(weight), color=weight), strength=0.3)+
  #scale_edge_colour_viridis()+
  scale_edge_colour_gradient2(low="darkred",mid="lightgray",high="steelblue",midpoint = 0)+
  #scale_edge_width(range = c(2, 4)) +
  geom_node_point(size = 16, colour = c("#fdc58f","#e4615d","#95b2d6","#99d9d0","#ea9c9d")) +
  theme_graph()+ theme(legend.position="none",
                       panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                       plot.margin= unit(c(20,20,20,20),'points'))+
  coord_cartesian(clip = "off")
Over_c_paddy

###Metrics###
#upland#
load(file= "Network_metrics_upland.RData")
metrics_upland<-data.frame(boot_network$bootTable) %>% filter(., type=="strength") %>% 
  select(., node1, type,value) %>% 
  group_by(node1,type) %>% 
  summarize(lowerCI=ci(value, method="BCI", ci=0.95)$CI_low,
            upperCI=ci(value, method="BCI", ci=0.95)$CI_high,
            mean=(lowerCI+upperCI)/2)%>% 
  mutate(group=ifelse(node1=="yield","Yield",NA),
         group=ifelse(node1=="SOCrr",paste0("SOC[stock]"),group),
         group=ifelse(node1=="N2O",paste0("N[2]*O"),group),
         group=ifelse(node1=="CH4",paste0("CH[4]"),group),
         group=ifelse(node1=="MWD","MWD",group))%>%
  mutate(node1=ifelse(node1=="yield","Yield",node1),
         node1=ifelse(node1=="SOCrr",paste0("SOC[stock]"),node1),
         node1=ifelse(node1=="N2O",paste0("N[2]*O"),node1),
         node1=ifelse(node1=="CH4",paste0("CH[4]"),node1),
         node1=ifelse(node1=="MWD","MWD",node1))

metrics_upland$group <- factor(metrics_upland$group,levels = c("Yield","SOC[stock]","N[2]*O","CH[4]","MWD"))
node_g_upland<-ggplot(metrics_upland, aes(x=mean,y=node1,group=group,colour=group))+
  #geom_point(size=2)+
  geom_pointrange(aes(xmin=lowerCI, xmax=upperCI), size=0.5,fatten=5) +
  #geom_bar(stat="identity")+
  scale_x_continuous(breaks = c(0.35,0.7))+
  scale_y_discrete(limits=c("N[2]*O","CH[4]","SOC[stock]","MWD","Yield"),
                   labels=c(expression(N[2]*O),expression(CH[4]),expression(SOC[stock]),"MWD","Yield"))+
  scale_color_manual(values = c("#e4615d","#fdc58f","#99d9d0","#95b2d6","#ea9c9d"))+
  labs(x="Strength")+
  theme_cowplot()+theme(legend.position = "none")+font+
  theme(axis.title.y = element_blank())
node_g_upland

#paddy#
load(file= "Network_metrics_paddy.RData")
metrics_paddy<-data.frame(boot_network$bootTable) %>% filter(., type=="strength") %>% 
  select(., node1, type,value) %>% 
  group_by(node1,type) %>% 
  summarize(lowerCI=ci(value, method="BCI", ci=0.95)$CI_low,
            upperCI=ci(value, method="BCI", ci=0.95)$CI_high,
            mean=(lowerCI+upperCI)/2)%>% 
  mutate(group=ifelse(node1=="yield","Yield",NA),
         group=ifelse(node1=="SOCrr",paste0("SOC[stock]"),group),
         group=ifelse(node1=="N2O",paste0("N[2]*O"),group),
         group=ifelse(node1=="CH4",paste0("CH[4]"),group),
         group=ifelse(node1=="MWD","MWD",group))%>%
  mutate(node1=ifelse(node1=="yield","Yield",node1),
         node1=ifelse(node1=="SOCrr",paste0("SOC[stock]"),node1),
         node1=ifelse(node1=="N2O",paste0("N[2]*O"),node1),
         node1=ifelse(node1=="CH4",paste0("CH[4]"),node1),
         node1=ifelse(node1=="MWD","MWD",node1))

metrics_paddy$group <- factor(metrics_paddy$group,levels = c("Yield","SOC[stock]","N[2]*O","CH[4]","MWD"))
node_g_paddy<-ggplot(metrics_paddy, aes(x=mean,y=node1,group=group,colour=group))+
  #geom_point(size=2)+
  geom_pointrange(aes(xmin=lowerCI, xmax=upperCI), size=0.5,fatten=5) +
  #geom_bar(stat="identity")+
  scale_y_discrete(limits=c("MWD","N[2]*O","Yield","CH[4]","SOC[stock]"),
                   labels=c("MWD",expression(N[2]*O),"Yield",expression(CH[4]),expression(SOC[stock])))+
  scale_color_manual(values = c("#e4615d","#fdc58f","#99d9d0","#95b2d6","#ea9c9d"))+
  labs(x="Strength")+
  theme_cowplot()+theme(legend.position = "none")+font+
  theme(axis.title.y = element_blank())
node_g_paddy
