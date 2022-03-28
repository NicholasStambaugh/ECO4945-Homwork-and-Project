library(readr)
library(dplyr)
library(stargazer)

#1
load(file = "C:\\Users\\admin\\Downloads\\wage1.rda")

#2
women <- subset(wages, female==1)

nonwhite <- subset(wages, nonwhite==0)

#3
wage2 <- wages %>% 
  select(wage, educ, south, west) %>%
  filter((wage>1 & wage<=20) & (south==1 | west==1))


describe(wage2)


