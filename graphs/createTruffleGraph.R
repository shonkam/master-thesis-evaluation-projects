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
truffleResults <- read.csv(here("data/truffleData.csv"))
trufflePoints = truffleResults$Grade

# (points from evaluation / max points)
functionalSuitability = sum(trufflePoints[1:13])/maxFunctionalSuitability
performanceEfficiency = sum(trufflePoints[14:16])/maxPerformanceEfficiency
compatibility = sum(trufflePoints[17:20])/maxCompatibility
usability = sum(trufflePoints[21:30])/maxUsability
reliability = sum(trufflePoints[31:32])/maxReliability
security = sum(trufflePoints[33:34])/maxSecurity
maintainability = sum(trufflePoints[35:37])/maxMaintainability
portability = sum(trufflePoints[38:40])/maxPortability

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
  scale_y_continuous(limits = c(0,105), expand = c(0, 0))+
  geom_bar(stat="identity")+
  ylab("Score % of the max available")+
  theme(plot.title = element_text(hjust = 0.5))+
  geom_text(aes(label=round(Percentage, digits=0)), color="black", vjust = 0, nudge_y = 0.5)+
  scale_fill_grey()
