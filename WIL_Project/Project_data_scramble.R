library(readr)
library(dplyr)
library(magrittr)
#break up the project data to make life hard for students

project_data <- read_csv('./WIL_Project/data/LoanStats3a.csv')

CUSTOMER_LOAN <- project_data %>% select(id:dti)
CUSTOMER_LOAN_HISTORY <- project_data %>% select(id, member_id, delinq_2yrs:total_il_high_credit_limit)

#Create some duplicates

CUSTOMER_LOAN_SCRAMBLE <- CUSTOMER_LOAN %>% sample_n(2153) %>% bind_rows(CUSTOMER_LOAN) %>% sample_frac(.95)
CUSTOMER_LOAN_HIST_SCRAMBLE <- CUSTOMER_LOAN_HISTORY %>% sample_n(925) %>% bind_rows(CUSTOMER_LOAN_HISTORY) %>% sample_frac(.95)

#Add Some TEST data outliers
test_data = read_csv('~/repos/mxb344/WIL_Project/data/TEST_DATA.csv')

CUSTOMER_LOAN_SCRAMBLE <-
  test_data %>% select(id:dti) %>% bind_rows(CUSTOMER_LOAN_SCRAMBLE)

CUSTOMER_LOAN_HIST_SCRAMBLE  <- 
  test_data %>% select(id, member_id, delinq_2yrs:num_tl_120dpd_2m) %>% bind_rows(CUSTOMER_LOAN_HIST_SCRAMBLE)


#Write data pieces
write_csv(x=CUSTOMER_LOAN_SCRAMBLE, path='~/repos/mxb344/WIL_Project/data/CUSTOMER_LOAN.csv')
write_csv(x=CUSTOMER_LOAN_HIST_SCRAMBLE, path='~/repos/mxb344/WIL_Project/data/CUSTOMER_LOAN_HISTORY.csv')


