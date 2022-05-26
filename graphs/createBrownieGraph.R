rm(list=ls())

getwd()

library(ggplot2)
library(here)

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
brownieResults <- read.csv(here("data/brownieData.csv"))
browniePoints = brownieResults$Grade

# (points from evaluation / max points)
functionalSuitability = sum(browniePoints[1:13])/maxFunctionalSuitability
performanceEfficiency = sum(browniePoints[14:16])/maxPerformanceEfficiency
compatibility = sum(browniePoints[17:20])/maxCompatibility
usability = sum(browniePoints[21:30])/maxUsability
reliability = sum(browniePoints[31:32])/maxReliability
security = sum(browniePoints[33:34])/maxSecurity
maintainability = sum(browniePoints[35:37])/maxMaintainability
portability = sum(browniePoints[38:40])/maxPortability

# data for the graph
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
  Percentage = c(
    # converts to percentages
    functionalSuitability * 100,
    performanceEfficiency * 100,
    compatibility * 100,
    usability * 100,
    reliability * 100,
    security * 100,
    maintainability * 100,
    portability * 100
  ),
  Characteristics = c(
    "Functional suitability",
    "Performance efficiency",
    "Compatibility",
    "Usability",
    "Reliability",
    "Security",
    "Maintainability",
    "Portability"
  )
)




# print graph
ggplot(data, aes(x=Characteristic, y=Percentage, fill = Characteristics)) +
  scale_x_discrete(limits=data$Characteristic)+
  geom_bar(stat="identity")+
  ggtitle("Brownie evaluation")+
  theme(plot.title = element_text(hjust = 0.5))+
  geom_text(aes(label=round(Percentage, digits=0)), color="black", vjust = 0, nudge_y = 0.5)+
  scale_fill_grey()
