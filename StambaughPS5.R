#Nick Stambaugh#
library(dplyr)

#1
load(file= "C:\\Users\\admin\\Downloads\\emsi.rda")

#2
emsiBA <-  filter(emsi, Level=="Baccaureate" & (Gender=='F' | Gender=='M'))

#3
emsiBA$male <- ifelse(emsiBA$Gender=="M", 1, 0)

#4
names(emsiBA)[names(emsiBA) == "Avg..of.Avg..Wage"] <- "Earnings"

#5
emsiBA$FTIAC <- ifelse(emsiBA$FTIAC=="Yes", 1, 0)

#6
emsiBA$exper <- 2020-emsiBA$Grad.Year

#7
emsiBA$MI <- ifelse(emsiBA$Location.Status=="Resides in Region", 1, 0)

#8
reg1 <- lm(Earnings ~ exper + I(exper^2) + male + MI, data = emsiBA)

#A. Holding all other variables constant, we can expect an individual who resides in MI to earn
#$15109.07 LESS on average than an individual who risdes out of the region

#B. Holding all other variables constant, we can expect an individual with one more year of experience 
#to earn $3842.36 MORE on average than an individual who only has 1 year experience


#9
reg2 <- lm(Earnings~exper + male + (exper*male) + MI, data = emsiBA)
stargazer(reg1, reg2, type = "text")

#A. Holding all other variables constant, we can expect a male with one more year of experience to earn $439.02 
#more on average. ## We can expect a female to earn $439.02 Less than a man with one more year of experience

#B. At a .01 p-value we can assume that there is a statistically significant difference in the slope
#of earnings for men and women. When we combined the exper * male variables, this shows there is correlation
#between men and earning more on average from 1 year experience since it is statistically significant.

