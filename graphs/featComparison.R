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
Truffle = truffleResults$Grade
Max = truffleResults$Max.score

brownieResults <- read.csv(here("data/brownieData.csv"))
Brownie = brownieResults$Grade

hardhatResults <- read.csv(here("data/hardhatData.csv"))
Hardhat = hardhatResults$Grade

id <- c(1:40)

set <- data.frame(id, Max, Hardhat, Brownie, Truffle)
(set)
df <- melt(set, id.vars="id", value.name="value")
(df)

# features 1 - 10
ggplot(df, aes(x=id, y=value, fill=variable))+
  geom_bar(stat="identity", position="dodge", width=0.7)+
  scale_x_continuous(limits = c(0.5,10.5), expand = c(0, 0), breaks=0:10) +
  scale_y_continuous(limits = c(0,5), expand = c(0, 0))+
  xlab("Feature id")+
  ylab("Score")+
  scale_fill_manual(values=c('black', 'yellow', 'brown', 'orange'))+
  theme(legend.title=element_blank())


# features 11 - 20
ggplot(df, aes(x=id, y=value, fill=variable))+
  geom_bar(stat="identity", position="dodge", width=0.7)+
  scale_x_continuous(limits = c(10.5,20.5), expand = c(0, 0), breaks=11:20) +
  scale_y_continuous(limits = c(0,5), expand = c(0, 0))+
  xlab("Feature id")+
  ylab("Score")+
  scale_fill_manual(values=c('black', 'yellow', 'brown', 'orange'))+
  theme(legend.title=element_blank())

# features 21 - 30
ggplot(df, aes(x=id, y=value, fill=variable))+
  geom_bar(stat="identity", position="dodge", width=0.7)+
  scale_x_continuous(limits = c(20.5,30.5), expand = c(0, 0), breaks=21:30) +
  scale_y_continuous(limits = c(0,5), expand = c(0, 0))+
  xlab("Feature id")+
  ylab("Score")+
  scale_fill_manual(values=c('black', 'yellow', 'brown', 'orange'))+
  theme(legend.title=element_blank())

# features 31 - 40
ggplot(df, aes(x=id, y=value, fill=variable))+
  geom_bar(stat="identity", position="dodge", width=0.7)+
  scale_x_continuous(limits = c(31.5,40.5), expand = c(0, 0), breaks=31:40) +
  scale_y_continuous(limits = c(0,5), expand = c(0, 0))+
  xlab("Feature id")+
  ylab("Score")+
  scale_fill_manual(values=c('black', 'yellow', 'brown', 'orange'))+
  theme(legend.title=element_blank())