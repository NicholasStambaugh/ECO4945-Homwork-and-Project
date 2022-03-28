#Nick Stambaugh
library(stargazer)
#1
morg20 <- read.csv("C:\\Users\\admin\\downloads\\morg20.csv")

#2
morg20$earnhr <- morg20$earnwke/morg20$uhourse

#3 couldnt figure out, closest i could get#
morg20$married <- ifelse(morg20$marital == '1', 1, 2)

#4
morg20$male <- ifelse(morg20$sex=='1', 1, 0)

#5
morg20$exper <- morg20$age - morg20$ihigrdc - 6

#6 Holding all other variables constant, difference in mean wage for married men compared 
#to non married is $1.32, between married women to non married is $2.48, and $12 
#between men and non married women 
model <- lm(data=morg20, earnhr ~ ihigrdc + exper + I(exper^2) + male + married + married*male)
summary(model)
model

#8 Interaction term between ihigrdc and male

#9 Estimated difference holding all others constant is $0.24, a female with the same 
#education experience as a man will earn $0.24 less. It is significant.
model2 <- lm(data=morg20, earnhr ~ ihigrdc + exper + I(exper^2) + male + married + married*male + male*ihigrdc)
summary(model2)
model2


#10 No idea how to calculate this. 

#I was unaware where to find the resources to be able to complete this the way I wanted too; 
#I gave up trying to fix my code because I can't find any resources for how to do these questions: 
  
#3&4 (dummy term with 'and' statement? Maybe I'm misunderstanding the question)
#5 (how to drop negative experience? No idea how to do this)
#6 (running regression with independent variable having '>=, <='? no idea the syntax to set variable with those and have it still work) 
#10(need a refresher on how to calculate regression results. Seems familiar but sick of digging through blackboard to find resources)


