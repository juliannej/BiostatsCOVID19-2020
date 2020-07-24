#Data_export.R
#merge the correct sheets for analysis, for export so group-members 
#can use with JASP without further data-processing

#merge deaths and infections for export
deaths_and_infections <- merge(deaths, infections, by="FIPS")

#TODO rename the row_sum.x to total_deaths and row_sum.y to total_infections


#create column for rate of death
deaths_and_infections <- na.omit(deaths_and_infections)
deaths_and_infections$death_rate = 
  # (deaths_and_infections$total_deaths)/(deaths_and_infections$total_infections)
  (deaths_and_infections$row_sum.x)/(deaths_and_infections$row_sum.y)
View(deaths_and_infections$death_rate)

#TODO rename this column from V1 to death_rate

#export data
write.csv(deaths_and_infections,"extra_data/deaths_and_infections.csv", row.names = TRUE)

#TODO merge deaths_and_infections with hospitalizations

#TODO export data


#TODO pare down data to only the columns of relevant variables?