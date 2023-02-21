library("tidyr")
library("dplyr")
library("ggplot2")
library("readr")

CollegeScorecard <- read_csv("CollegeScorecard.csv")
uni <- CollegeScorecard[c(3846, 740, 2327, 2996, 771, 762, 1067, 83, 924,3848), ] 

uni <- uni %>% 
  mutate("TUITION_DIFF" = TUITIONFEE_OUT - TUITIONFEE_IN)

tuition_type <- uni %>%
  select(INSTNM, TUITIONFEE_IN, TUITIONFEE_OUT, TUITION_DIFF, TUITIONFEE_PROG, TUITFTE) %>% 
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