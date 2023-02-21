library(readr)
library(dplyr)

CollegeScorecard <- read_csv("~/exploratory-analysis-tersaii-main/CollegeScorecard.csv")
universityList <- CollegeScorecard[c(3847, 741, 2328, 2997, 772, 763, 1068, 84, 925
                          , 3849), ]

uni <- subset(universityList,select = c('TUITIONFEE_IN', "TUITIONFEE_OUT", "INSTNM", "PAR_ED_PCT_1STGEN", "GRAD_DEBT_MDN", "RET_FT4", "RET_PT4", "TUITFTE"))

orderedUni <- uni[,c(3, 1, 2, 5, 8, 6, 7, 4)]

orderedUni <- rapply(object = orderedUni, f = round, classes = "numeric", how = "replace", digits = 1)

colnames(orderedUni)[colnames(orderedUni) == "TUITIONFEE_IN"] = "In-State Tuition"
colnames(orderedUni)[colnames(orderedUni) == "TUITIONFEE_OUT"] = "Out-Of-State Tuition"
colnames(orderedUni)[colnames(orderedUni) == "INSTNM"] = "University"
colnames(orderedUni)[colnames(orderedUni) == "PAR_ED_PCT_1STGEN"] = "First Generation"
colnames(orderedUni)[colnames(orderedUni) == "GRAD_DEBT_MDN"] = "Graduate Student's Debt"
colnames(orderedUni)[colnames(orderedUni) == "RET_FT4"] = "Full-Time Retention"
colnames(orderedUni)[colnames(orderedUni) == "RET_PT4"] = "Part-Time Retention"
colnames(orderedUni)[colnames(orderedUni) == "TUITFTE"] = "Net Tuition Revenue"
