# A function that takes in a dataset and returns a list of info about it:

# 1 - Dataset: orderedUni, Value: Max Full-Time Retention Rate = 1
summary1_info <- list()
summary1_info$num_observations <- nrow(orderedUni)
summary1_info$fulltime_rentention_max_value <- orderedUni %>%
  filter(`Full-Time Retention` == max(`Full-Time Retention`, na.rm = T)) %>%
  select(`Full-Time Retention`)

# 2 - Dataset: orderedUni, Value: Max Full-Time Retention Rate University = University of Florida
summary2_info <- list()
summary2_info$num_observations <- nrow(orderedUni)
summary2_info$fulltime_rentention_max_value <- orderedUni %>%
  filter(`Full-Time Retention` == max(`Full-Time Retention`, na.rm = T)) %>%
  select(University)

# 3 - Dataset: orderedUni, Value: Min Full-Time Retention Rate = 0.8
summary3_info <- list()
summary3_info$num_observations <- nrow(orderedUni)
summary3_info$fulltime_rentention_min_value <- orderedUni %>%
  filter(`Full-Time Retention` == min(`Full-Time Retention`, na.rm = T)) %>%
  select(`Full-Time Retention`)

# 4 - Dataset: orderedUni, Value: Min Full-Time Retention Rate University = Florida International University, Arizona State University - Temple, Georgia State University 
summary4_info <- list()
summary4_info$num_observations <- nrow(orderedUni)
summary4_info$fulltime_rentention_min_value <- orderedUni %>%
  filter(`Full-Time Retention` == min(`Full-Time Retention`, na.rm = T)) %>%
  select(University)

# 5 - Dataset: orderedUni, Value: Max First Gen University = Florida International University
summary5_info <- list()
summary5_info$num_observations <- nrow(orderedUni)
summary5_info$first_gen_max_value <- orderedUni %>%
  filter(`First Generation` == max(`First Generation`, na.rm = T)) %>%
  select(University)

# 6 - Dataset: orderedUni, Value: Min First Gen University = University of Illinois at Urbana-Champaign
summary6_info <- list()
summary6_info$num_observations <- nrow(orderedUni)
summary6_info$first_gen_min_value <- orderedUni %>%
  filter(`First Generation` == min(`First Generation`, na.rm = T)) %>%
  select(University)