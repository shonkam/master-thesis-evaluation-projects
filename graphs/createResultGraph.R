rm(list=ls())

getwd()

library(ggplot2)
library(here)

# max scores for each characteristic
maxFunctionalSuitability = 63
maxPerformanceEfficiency = 12
maxCompatibility = 5
maxUsability = 31
maxReliability = 10
maxSecurity = 10
maxMaintainability = 13
maxPortability = 15

# fetch data
hardhatResults <- read.csv(here("data/hardhatData.csv"))
hardhatPoints = hardhatResults$Grade

# (points from evaluation / max points)
functionalSuitability = sum(hardhatPoints[1:15])/maxFunctionalSuitability
performanceEfficiency = sum(hardhatPoints[16:18])/maxPerformanceEfficiency
compatibility = sum(hardhatPoints[19])/maxCompatibility
usability = sum(hardhatPoints[20:29])/maxUsability
reliability = sum(hardhatPoints[30:31])/maxReliability
security = sum(hardhatPoints[32:33])/maxSecurity
maintainability = sum(hardhatPoints[34:36])/maxMaintainability
portability = sum(hardhatPoints[37:39])/maxPortability
(portability)

# data for the graph
data <- data.frame(
  Characteristic = c(
    "Funct", 
    "Perf",
    "Comp",
    "Usa",
    "Rel",
    "Sec",
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
  )
)

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


# print graph
ggplot(data, aes(x=Characteristic, y=Percentage, fill = Characteristics)) +
  geom_bar(stat="identity")+
  ggtitle("Hardhat evaluation")+
  theme(plot.title = element_text(hjust = 0.5))+
  geom_text(aes(label=round(Percentage, digits=0)), color="black", vjust = 0, nudge_y = 0.5)+
  scale_fill_grey()
