rm(list=ls())

getwd()
library(here)

hardhatData <- read.csv(here("data/hardhatData.csv"))
hardhatPoints = hardhatData$Grade

truffleData <- read.csv(here("data/truffleData.csv"))
trufflePoints = truffleData$Grade

brownieData <- read.csv(here("data/brownieData.csv"))
browniePoints = brownieData$Grade

maxTotalScore = 164

hardhatScore = round(((sum(hardhatPoints)) / maxTotalScore), digits=2)
truffleScore = round(((sum(trufflePoints)) / maxTotalScore), digits=2)
brownieScore = round(((sum(browniePoints)) / maxTotalScore), digits=2)

