#I used this to check the nature of the NaN to see if it was coming from dividing 
#by zero or if it was coming from NA values in the row_sums. it was coming from 
#dividing by zero, so I will remove NA values when doing calculations
#infections_and_deaths$rowsumx_isna <- (is.na(infections_and_deaths$row_sum.x))
#infections_and_deaths$rowsumy_isna <- (is.na(infections_and_deaths$row_sum.y))