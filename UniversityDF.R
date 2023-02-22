library(readr)
library(dplyr)

CollegeScorecard <- read_csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-tersaii/main/CollegeScorecard.csv")
universityList <- CollegeScorecard[c(3847, 741, 2328, 2997, 772, 763, 1068, 84, 925
                          , 3849), ]

uni <- universityList %>% select("INSTNM", 'TUITIONFEE_IN', "TUITIONFEE_OUT",  "PAR_ED_PCT_1STGEN", "GRAD_DEBT_MDN", "RET_FT4", "TUITFTE") %>% 
                          group_by(INSTNM)

orderedUni <- uni[c(1, 2, 3, 4, 5, 6, 7)]

orderedUni <- rapply(object = orderedUni, f = round, classes = "numeric", how = "replace", digits = 1)

colnames(orderedUni)[colnames(orderedUni) == "TUITIONFEE_IN"] = "In-State Tuition"
colnames(orderedUni)[colnames(orderedUni) == "TUITIONFEE_OUT"] = "Out-Of-State Tuition"
colnames(orderedUni)[colnames(orderedUni) == "INSTNM"] = "University"
colnames(orderedUni)[colnames(orderedUni) == "PAR_ED_PCT_1STGEN"] = "First Generation"
colnames(orderedUni)[colnames(orderedUni) == "GRAD_DEBT_MDN"] = "Graduate Student's Debt"
colnames(orderedUni)[colnames(orderedUni) == "RET_FT4"] = "Full-Time Retention"
colnames(orderedUni)[colnames(orderedUni) == "RET_PT4"] = "Part-Time Retention"
colnames(orderedUni)[colnames(orderedUni) == "TUITFTE"] = "Net Tuition Revenue"
