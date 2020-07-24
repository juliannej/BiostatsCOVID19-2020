#RUN THESE ONE AT A TIME 
#highlight the hist command and press run

library(rcompanion)
#TRANSFORMATIONS, examples
#https://rcompanion.org/handbook/I_12.html
#plotNormalHistogram(deaths$row_sum) #using rcompanion
#D_sqrt = sqrt(deaths$row_sum) #square root transformation
#D_cub = sign(deaths$row_sum) * abs(deaths$row_sum)^(1/3) #cube root transformation
#D_log = log((deaths$row_sum+1)) #log transformation, added 1 because log of 0 is undefined
#D_tuk = transformTukey(deaths$row_sum,
                       #plotit=FALSE) #Tukey transformation
#plotNormalHistogram(D_tuk)



#TRY TO GET BETTER SCALES, see if can make bigger graph
hist(deaths$row_sum,breaks = 25, main="COVID19-related deaths per county")

hist(infections$row_sum,breaks = 20, main="COVID19 Infections per county")

#Tukey transformation on the infection data makes it much closer to normal
I_tuk = transformTukey(infections$row_sum, plotit=FALSE)
plotNormalHistogram(I_tuk)


hist(infections_and_deaths$proportion_dead, breaks=20,
     main="Proportion of infected who died from COVID19 per county")

#Transformations for porportion dead
P_log = log((infections_and_deaths$proportion_dead+1))
#P_tuk = transformTukey(infections_and_deaths$proportion_dead, plotit=FALSE)
plotNormalHistogram(P_log)

hist(counties$Median_Household_Income_2018, breaks=20, main="Median household income per county")

hist(counties$`Percent of adults with less than a high school diploma 2014-18`, breaks=20,
     main = "Percent of adults with less than a high school diploma 2014-18 per county")

hist(counties$`Percent of adults with a high school diploma only 2014-18`, breaks=20,
     main = "Percent of adults with a high school diploma only 2014-18 per county")

hist(counties$`Percent of adults completing some college or associate's degree 2014-18`, breaks=20,
     main = "Percent of adults completing some college or associate's degree 2014-18 per county")

hist(counties$`Percent of adults with a bachelor's degree or higher 2014-18`, breaks=20,
     main = "Percent of adults with a bachelor's degree or higher 2014-18 per county")

barplot(table(counties$Economic_typology_2015),
        main = "Economic typology of counties in the Western US",
        xlab = "Economic typology",
        ylab = "Frequency", col="lightblue")


#Notes
#example hist(airquality$Temp,prob=T,main="Temperature")