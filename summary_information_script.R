# A function that takes in a dataset and returns a list of info about it:
sum_uni <- universityList %>% select("INSTNM", 'TUITIONFEE_IN', "TUITIONFEE_OUT",  "PAR_ED_PCT_1STGEN", "GRAD_DEBT_MDN", "RET_FT4", "TUITFTE")
  
sum_uni <- rapply(object = sum_uni, f = round, classes = "numeric", how = "replace", digits = 1)
# 1 - Dataset: orderedUni, Value: Max Full-Time Retention Rate = 1
summary_info <- list()
summary_info$fulltime_rentention_max_value <- sum_uni %>%
  filter(`RET_FT4` == max(`RET_FT4`, na.rm = T)) %>%
  select(`RET_FT4`)

# 2 - Dataset: orderedUni, Value: Max Full-Time Retention Rate University = University of Florida
summary_info$fulltime_rentention_max_uni <- sum_uni %>%
  filter(`RET_FT4` == max(`RET_FT4`, na.rm = T)) %>%
  select(`INSTNM`)

# 3 - Dataset: orderedUni, Value: Min Full-Time Retention Rate = 0.8
summary_info_mins_vector <-
  sum_uni %>%
  filter(`RET_FT4` == min(`RET_FT4`, na.rm = T)) %>%
  pull(`RET_FT4`)
summary_info$fulltime_rentention_min_value <- summary_info_mins_vector[1]
    
# 4 - Dataset: orderedUni, Value: Min Full-Time Retention Rate University = Florida International University, Arizona State University - Temple, Georgia State University 
fulltime_rentention_min_unis <- paste(sum_uni %>%
  filter(`RET_FT4` == min(`RET_FT4`, na.rm = T)) %>%
  select(`INSTNM`))
summary_info$fulltime_rentention_min_unis <- fulltime_rentention_min_unis

# 5 - Dataset: orderedUni, Value: Max First Gen University = Florida International University
summary_info$first_gen_max_value <- sum_uni %>%
  filter(`PAR_ED_PCT_1STGEN` == max(`PAR_ED_PCT_1STGEN`, na.rm = T)) %>%
  pull(`INSTNM`)

# 6 - Dataset: orderedUni, Value: Min First Gen University = University of Illinois at Urbana-Champaign
summary_info$first_gen_min_value <- sum_uni %>%
  filter(`PAR_ED_PCT_1STGEN` == min(`PAR_ED_PCT_1STGEN`, na.rm = T)) %>%
  select(`INSTNM`)