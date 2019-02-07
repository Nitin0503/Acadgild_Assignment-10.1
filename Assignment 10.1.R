getwd()
x<-read.table(unzip("AirQualityUCI.zip", "AirQualityUCI.csv"), nrows=58, header=T, quote="\"", sep=";")
View(x)
y=sum(is.na(x$X))
y
z=sum(is.na(x$X.1))
z
library(purrr)
library(tidyr)
library(ggplot2)
x%>%keep(is.numeric) %>%gather() %>% ggplot(aes(value)) +facet_wrap(~ key, scales = "free") +geom_histogram()
library(lattice)
library(mice)
p=mice(x,m=5,maxit=58,method = 'pmm', seed = 500)