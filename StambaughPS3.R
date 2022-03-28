#Nicholas Stambaugh
library(readr)
options(scipen=999)


#1)

load(file = "C:\\Users\\admin\\Downloads\\ak21.rda")

#2)

ak21$age <- 2021 - ak21$year_built

#3)

summary(ak21)

#RANGES:
#range of age: 121 years to 0 years
#range of price: $875,000 to $50,000

#AVERAGES:
#average age: 20.5 years
#average price: $282,447

#4)

m1 <- lm(price~size, data=ak21)

summary(m1)

#5)

#The coeff. of size is 158.220, this is significant because
#we see three stars next to the p-value, signalling a strong enough
#correlation between size & fireplace to be significant.

#6)

m2 <- lm(price~size+age+fireplace, data=ak21)

summary(m2)

#7)

#The coeff. of fireplace is 27,131.662 and age is -678.910

#8)

#The fireplace is skewed too greatly due to omitted variable bias. 
#The fireplace does not explain well enough why there is such big 
#differences in prices. The Fireplace variable is also potentially 
#too closely related to another variable such as age: 
#(i.e. old/small homes don't have any fireplaces)