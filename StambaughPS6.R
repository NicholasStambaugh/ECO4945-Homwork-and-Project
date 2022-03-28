library(dplyr)
library(tidyverse)
library(jrvFinance)


#1
cps78 <- read.csv(file = "C:\\Users\\admin\\downloads\\cps78.csv")

#2
df <- filter(cps78, educ==73| educ==72 | educ==110)

#3
df$Education <- factor(df$educ,
                       levels = c(72,73,110),
                       labels = c('Highschool', 'Highschool','College'))

#4
df$incearn <- df$incwage + df$incfarm + df$incbus

#5
df <- filter(df, incearn!=0)

#6
df1 <- df %>% group_by(age,Education) %>% 
  summarise(Earnings=weighted.mean(incearn,asecwt))

#7
df2 <- pivot_wider(df1,names_from = Education, values_from = Earnings)

#8, website you provided was down so i used another estimate
df2[1,3] <- -20770
df2[2,3] <- -20770
df2[3,3] <- -20770
df2[4,3] <- -20770

#9
df2$Difference <- df2$College - df2$Highschool

#10
irr <-100*irr(df2$College)

#11
npvtbond <- df2$College %>% npv(.0775)

npvcbond <- df2$College %>% npv(.082)



