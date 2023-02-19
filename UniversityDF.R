library(readr)
library(ggplot2)

CollegeScorecard <- read_csv("~/exploratory-analysis-tersaii-main/CollegeScorecard.csv")

ggplot(uni, aes(x=TUITIONFEE_IN, y=TUITIONFEE_OUT)) + geom_point() #Example scatterplot with variables


uni <- CollegeScorecard[c(3846, 740, 2327, 2996, 771, 762, 1067, 83, 924              #Uni will be the databse for our 10 universities
     , 3848), ] 

View(uni)
View(CollegeScorecard) 