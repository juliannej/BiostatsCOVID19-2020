#Numerical descriptive statistics of variables of interest
#Run one block at a time or all at once (if all at once, then scroll through console to see all results)

library(summarytools)

#MERGES 
#merge death and infection dataframes
infections_and_deathsraw <- merge(infectionsraw, deathsraw,by="FIPS")
infections_and_deaths <- merge(infections_and_deathsraw, counties, by="FIPS")
infections_and_deaths$proportion_dead <- (infections_and_deaths$row_sum.y / infections_and_deaths$row_sum.x)
View(infections_and_deaths)

#the descr function gives the mean, std dev, min, median, max
#stats = c("mean", "sd") argument for mean and standard deviation for example
#the minimum, first quartile, median, third quartile and maximum with stats = "fivenum"

#total deaths per county
descr(deaths$row_sum,
      headings = TRUE,
      stats = "common")
x <- "Above are the descriptive stats for total deaths per county"
print(x,quote=FALSE)

#number of infections
descr(infections$row_sum,
      headings = TRUE, #remove headings
      stats = "common")
x <- "Above are the descriptive stats for total infections per county"
print(x,quote=FALSE)

###GO OVER THIS, n=1958????
#proportion infected who died, per county
descr(infections_and_deaths$proportion_dead,
      headings = FALSE, #remove headings
      stats = "common")

#median household income, per county
descr(counties$Median_Household_Income_2018,
      headings = FALSE,
      stats = "common")

#education level WE MAY NEED TO MAKE NEW CATEGORIES, LUMP THESE, OR CHOOSE
descr(counties$`Percent of adults with less than a high school diploma 2014-18`,
      headings = FALSE,
      stats = "common")

descr(counties$`Percent of adults with a high school diploma only 2014-18`,
      headings = FALSE,
      stats = "common")

descr(counties$`Percent of adults completing some college or associate's degree 2014-18`,
      headings = FALSE,
      stats = "common")

descr(counties$`Percent of adults with a bachelor's degree or higher 2014-18`,
      headings = FALSE,
      stats = "common")

#Economic typology counts and proportions
table(counties$Economic_typology_2015)
econ_types <- table(counties$Economic_typology_2015)
prop.table(econ_types)



