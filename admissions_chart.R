library("tidyr")
library("dplyr")
library("ggplot2")
library("readr")
library("RColorBrewer")

CollegeScorecard <- read_csv("Final_Project/exploratory-analysis-tersaii/CollegeScorecard.csv")

universityList <- CollegeScorecard[c(3847, 741, 2328, 2997, 772, 763, 1068, 84, 925
                                     , 3849), ]

admissions_ret <- universityList %>% 
  select("INSTNM", "ADM_RATE", "RET_FT4")
   
data_type <- admissions_ret[c(2,3)]

ggplot(admissions_ret, aes(x = ADM_RATE, y = RET_FT4, color = INSTNM)) +
  geom_point(size=6) +
  scale_color_brewer(palette = "Paired") +
  labs(title = "Admission Rates vs. Retention Rates at each college",
       x = "Admission Rate",
       y = "Retention Rate",
       color = "Colleges"
  ) +
  scale_x_continuous(breaks = seq(0, 1, 0.1))

  