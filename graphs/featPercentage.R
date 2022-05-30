rm(list=ls())

getwd()

library(ggplot2)
library(here)

# fetch data
results <- read.csv(here("data/hardhatData.csv"))
# results <- read.csv(here("data/truffleData.csv"))
# results <- read.csv(here("data/brownieData.csv"))

points = results$Grade
maxPoints = results$Max.score

# (points from evaluation / max points)
scores <- (points[1:40] / maxPoints[1:40] * 100)
id <- 1:40


(sum(scores < 25))
(sum(scores >= 25 & scores < 50))
(sum(scores >= 50 & scores < 75))
(sum(scores > 75))

data <- data.frame(id, scores)
(data)


  
ggplot(data, aes(x=id, y=scores))+
  geom_bar(stat="identity", width=0.7)+
  scale_x_continuous(limits = c(0.5,40.5), expand = c(0, 0), breaks=0:40) +
  scale_y_continuous(limits = c(0,100), expand = c(0, 0))+
  xlab("Feature id")+
  ylab("Score % of the max available")+
  theme(legend.title=element_blank())
