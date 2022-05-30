rm(list=ls())

getwd()

library(ggplot2)
library(here)
library(reshape2)
library(Rcpp)

# max scores for each characteristic
maxFunctionalSuitability = 56
maxPerformanceEfficiency = 13
maxCompatibility = 14
maxUsability = 33
maxReliability = 10
maxSecurity = 10
maxMaintainability = 13
maxPortability = 15

# fetch data
truffleResults <- read.csv(here("data/truffleData.csv"))
trufflePoints = truffleResults$Grade

brownieResults <- read.csv(here("data/brownieData.csv"))
browniePoints = brownieResults$Grade

hardhatResults <- read.csv(here("data/hardhatData.csv"))
hardhatPoints = hardhatResults$Grade

# (points from evaluation / max points)
Hardhat <- c(
  hardhatFunctionalSuitability = sum(hardhatPoints[1:13])/maxFunctionalSuitability * 100,
  hardhatPerformanceEfficiency = sum(hardhatPoints[14:16])/maxPerformanceEfficiency * 100,
  hardhatCompatibility = sum(hardhatPoints[17:20])/maxCompatibility * 100,
  hardhatUsability = sum(hardhatPoints[21:30])/maxUsability * 100,
  hardhatReliability = sum(hardhatPoints[31:32])/maxReliability * 100,
  hardhatSecurity = sum(hardhatPoints[33:34])/maxSecurity * 100,
  hardhatMaintainability = sum(hardhatPoints[35:37])/maxMaintainability * 100,
  hardhatPortability = sum(hardhatPoints[38:40])/maxPortability * 100
)

# (points from evaluation / max points)
Brownie <- c(
  brownieFunctionalSuitability = sum(browniePoints[1:13])/maxFunctionalSuitability * 100,
  browniePerformanceEfficiency = sum(browniePoints[14:16])/maxPerformanceEfficiency * 100,
  brownieCompatibility = sum(browniePoints[17:20])/maxCompatibility * 100,
  brownieUsability = sum(browniePoints[21:30])/maxUsability * 100,
  brownieReliability = sum(browniePoints[31:32])/maxReliability * 100,
  brownieSecurity = sum(browniePoints[33:34])/maxSecurity * 100,
  brownieMaintainability = sum(browniePoints[35:37])/maxMaintainability * 100,
  browniePortability = sum(browniePoints[38:40])/maxPortability * 100
)

# (points from evaluation / max points)
Truffle <- c(
  truffleFunctionalSuitability = sum(trufflePoints[1:13])/maxFunctionalSuitability * 100,
  trufflePerformanceEfficiency = sum(trufflePoints[14:16])/maxPerformanceEfficiency * 100,
  truffleCompatibility = sum(trufflePoints[17:20])/maxCompatibility * 100,
  truffleUsability = sum(trufflePoints[21:30])/maxUsability * 100,
  truffleReliability = sum(trufflePoints[31:32])/maxReliability * 100,
  truffleSecurity = sum(trufflePoints[33:34])/maxSecurity * 100,
  truffleMaintainability = sum(trufflePoints[35:37])/maxMaintainability * 100,
  trufflePortability = sum(trufflePoints[38:40])/maxPortability * 100
)

data <- data.frame(
  Characteristic = c(
    "Func",
    "Perf",
    "Comp",
    "Usab",
    "Reli",
    "Secu",
    "Main",
    "Port"
  ),
  Hardhat, 
  Brownie, 
  Truffle
)

df <- melt(data, id.vars="Characteristic", value.name="value")
(df)

# print graph
ggplot(df, aes(x=Characteristic, y=value, fill = variable)) +
  ylab("Score % of the max available")+
  scale_x_discrete(limits=data$Characteristic)+
  scale_y_continuous(limits = c(0,105), expand = c(0, 0))+
  geom_bar(stat="identity", position="dodge", width=0.7)+
  scale_fill_manual(values=c('yellow', 'brown', 'orange'))+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(legend.title=element_blank())

