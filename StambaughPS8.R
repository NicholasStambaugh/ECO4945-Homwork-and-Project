library(ggpubr)
library(scales)
#Nick Stambaugh

load(file = "C:\\Users\\admin\\Downloads\\emsi.rda")

#rename
colnames(emsi)[colnames(emsi) == 'Avg..of.Avg..Wage'] <- 'Earnings'

#1
emsi1 <- subset(emsi, Level == "Baccaureate" & Gender!="N")

#2
emsi2 <- subset(emsi1, FTIAC == "Yes")

ggbarplot(emsi2,x="Gender", y="Time.to.Degree", fill="Gender", color="blue", add='mean',
          label=TRUE, lab.nb.digits = 2, lab.size=3,
          position= position_dodge(.75))+ 
  labs(title="Average Time to Obtain Degree in Years by Gender", x="", y="Years",caption = "Source:EMSI.rda")

#3
emsi1$PExp <- 2020 - emsi1$Grad.Year

#4
ggbarplot(emsi1,x="PExp", y="Earnings", fill="Gender", add='mean',
          label=TRUE, lab.nb.digits = 0, lab.size=2,
          position= position_dodge(.75))+ 
  labs(title="Wage by Gender and Experience", x="Experience", y="Wage",caption = "Source:EMSI.rda")+theme(legend.position = c(.1, .8))
#5
emsi3 <- subset(emsi1, Major == "ACC" | Major== "BECO" | Major== 'MGT' 
                | Major== 'MKT' | Major=='FIN')

#6
ggboxplot(emsi3, x="Major", y='Earnings', fill="Major", add='mean',legend='none',
          font.ytickslab=c(10))+labs(title="Mean Earning by Major",caption = "Source:EMSI.rda")
+ scale_y_continuous(labels = scales::comma)

#7
ggplot(emsi1,aes(PExp,Earnings)) +
  geom_point(color="darkred", alpha=.1, size =2)  +
  geom_smooth(method=lm, formula=y~x, se=FALSE, color='black')+
  ggtitle("Estimated Earnings by Potential Experience", subtitle = "Source:EMSI.rda")+
  labs(x="Potential Experience", y="Wage")+
  theme_classic()+ scale_y_continuous(labels = scales::comma)
