rm(list=ls())

getwd()

library(ggplot2)
library(here)
library(reshape2)
library(Rcpp)

#results <- read.csv(here("data/hardhatData.csv"))
results <- read.csv(here("data/truffleData.csv"))
#results <- read.csv(here("data/brownieData.csv"))

points = results$Grade
maxPoints = results$Max.score

# first patch
ReceivedScore <- points[1:13]
MaxScore <- maxPoints[1:13]
id <- c(1:13)

set <- data.frame(ReceivedScore, MaxScore, id)
(set)
df <- melt(set, id.vars="id", value.name="value")
(df)
ggplot(df, aes(x=id, y=value, fill=variable))+
  geom_bar(stat="identity", position="dodge", width=0.7)+
  scale_x_continuous(limits = c(0.5,13.5), expand = c(0, 0), breaks=0:13) +
  scale_y_continuous(limits = c(0,5), expand = c(0, 0))+
  xlab("Feature id")+
  ylab("Score")+
  theme(legend.title=element_blank())

# second patch
ReceivedScore <- points[14:26]
MaxScore <- maxPoints[14:26]
id <- c(14:26)

set <- data.frame(ReceivedScore, MaxScore, id)
(set)
df <- melt(set, id.vars="id", value.name="value")
(df)
ggplot(df, aes(x=id, y=value, fill=variable))+
  geom_bar(stat="identity", position="dodge", width=0.7)+
  scale_x_continuous(limits = c(13.5,26.5), expand = c(0, 0), breaks=14:26) +
  scale_y_continuous(limits = c(0,5), expand = c(0, 0))+
  xlab("Feature id")+
  ylab("Score")+
  theme(legend.title=element_blank())


# third and last patch
ReceivedScore <- points[27:40]
MaxScore <- maxPoints[27:40]
id <- c(27:40)

set <- data.frame(ReceivedScore, MaxScore, id)
(set)
df <- melt(set, id.vars="id", value.name="value")
(df)
ggplot(df, aes(x=id, y=value, fill=variable))+
  geom_bar(stat="identity", position="dodge", width=0.7)+
  scale_x_continuous(limits = c(26.5,40.5), expand = c(0, 0), breaks=27:40) +
  scale_y_continuous(limits = c(0,5), expand = c(0, 0))+
  xlab("Feature id")+
  ylab("Score")+
  theme(legend.title=element_blank())

