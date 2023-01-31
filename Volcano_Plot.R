library(dplyr)
library(ggplot2)
library(tidyr)
data <- read.csv("All gene-drug corrs.csv")

#creating a plot for a specific drug from data
drug_example <- subset(data, Drug == "CGP-60474")

class(drug_example$Corr) #factor

data_test <- drug_example %>% separate(Corr, into = c("Corr", "sym"), sep = "\\*")

data_test$Corr <- as.numeric(data_test$Corr)

p <- ggplot(data_test, aes(x = data_test$Corr , y = -log10(data_test$FDR))) + geom_point() + theme_minimal() 

p + geom_vline(xintercept=c(0), col="red") + ggtitle("Drug GCP-60474")
