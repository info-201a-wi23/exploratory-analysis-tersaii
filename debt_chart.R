library("tidyr")
library("dplyr")
library("ggplot2")
library("readr")
library("RColorBrewer")

CollegeScorecard <- read_csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-tersaii/main/CollegeScorecard.csv")


universityList <- CollegeScorecard[c(3847, 741, 2328, 2997, 772, 763, 1068, 84, 925
                                     , 3849), ]

grad_debt <- universityList %>% 
  select("INSTNM", "GRAD_DEBT_MDN")

ggplot(grad_debt, aes(x=INSTNM, y=GRAD_DEBT_MDN)) +
  geom_point(size=5) +
  geom_segment(aes(x=INSTNM, xend=INSTNM, y=0, yend=GRAD_DEBT_MDN)) +
  labs(title = "Student Debt from each College",
       x = "College",
       y = "Median Debt in U.S. Dollars"
    
  ) +
  coord_flip()