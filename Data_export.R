#Data_export.R
#merge the correct sheets for analysis, for export so group-members 
#can use with JASP without further data-processing

#merge deaths and infections for export
deaths_and_infections <- merge(deaths, infections, by="FIPS")

#create column for rate of death
deaths_and_infections <- na.omit(deaths_and_infections)
deaths_and_infections$death_rate = 
  (deaths_and_infections$total_deaths)/(deaths_and_infections$total_infections)

#export data
write.csv(deaths_and_infections,"extra_data/deaths_and_infections.csv", row.names = TRUE)


#TODO pare down data to only the columns of relevant variables?
#county FIPS
#county name
#county population
#county area (?)
#population density
#economic typology
#median household income
#deaths
#death per capita
#death_rate of infection
#infections
#infections per capita
#hospitalizations
#hospitalizations per capita
#education columns (see the graphical R script file)
#ethnic and racial columns - need to account for population density