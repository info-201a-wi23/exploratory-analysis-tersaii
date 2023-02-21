library(readr)
library(dplyr)

CollegeScorecard <- read_csv("~/exploratory-analysis-tersaii-main/CollegeScorecard.csv")
universityList <- CollegeScorecard[c(3847, 741, 2328, 2997, 772, 763, 1068, 84, 925
                                     , 3849), ]

uni <- subset(universityList,select = c('TUITIONFEE_IN', "TUITIONFEE_OUT", "INSTNM", "GRAD_DEBT_MDN", "RET_FT4", "RET_PT4", "TUITFTE"))

uni <- uni %>% 
  mutate("TUITION_DIFF" = TUITIONFEE_OUT - TUITIONFEE_IN)

tuition_type <- uni %>%
  select(INSTNM, TUITIONFEE_IN, TUITIONFEE_OUT, TUITION_DIFF, TUITFTE) %>% 
  gather(key = "t_type", value = "cost", -INSTNM)

ggplot(tuition_type) +
  geom_col(mapping = aes(x = INSTNM, y = cost, fill = t_type),
           position = "dodge") +
  scale_y_continuous(breaks = seq(0, 38000, 2000)) +
  labs(title ="Average Tuition" , x = "School",
       y = "Average Price of Tuition/Year in U.S. Dollars") +
  scale_fill_discrete(name = "Tution Type", labels = c("Revenue Made/Student", "In/Out-of-State Difference",
                                                       "In-State", "Out-of-State", "Program")) +
  guides(x = guide_axis(n.dodge = 5))
