# Load and subset the data
# Run the whole file at once by selecting all and clicking run

#Libraries
library(readr)


#Counties data loading (NECESSARY)
#load the raw counties data
countiesraw <- read_csv("data/counties.csv")

#DATA PROCESSING

#filter the counties data to be the Western states of the US
#and name the data 'counties'
counties <- subset(countiesraw, State == 'CA' | State == 'OR' | State == 'WA' | 
                    State == 'MT' | State == 'UT' | State == 'NV' | State == 'NM'| 
                     State == 'AZ' | State == 'ID'| State == 'WY'| State == 'CO',)
View(counties)

#Interventions data processing:
interventionsraw <- read_csv("data/interventions.csv")

#need to change the FIPS over to be a width of 5 with appropriate leading 0s
#e.g. 1000 becomes 01000
#this makes this dataframe and the counties compatible for a merge
newFIPS <- sprintf("%05d", interventionsraw$FIPS)
interventionsraw$FIPS <- newFIPS


#infections data
infectionsraw <- read_csv("data/infections_timeseries.csv")

newFIPSi <- sprintf("%05d", infectionsraw$FIPS)
infectionsraw$FIPS <- newFIPSi

#add a column for total infections in each county
infectionsraw$total_infections = rowSums(infectionsraw[,-c(1,2)])

#hospital visits data
hospitalsraw <- read_csv("data/hospital_visits.csv")

newFIPSii <- sprintf("%05d", hospitalsraw$FIPS)
hospitalsraw$FIPS <- newFIPSii


#deaths data
deathsraw <- read_csv("data/deaths_timeseries.csv")

newFIPSiii <- sprintf("%05d", deathsraw$FIPS)
deathsraw$FIPS <- newFIPSiii

#add a column at the end that sums total deaths per county
deathsraw$total_deaths = rowSums(deathsraw[,-c(1,2)])

#MERGES

#merge the dataframe so that the data on interventions is usable with that of the main counties
#interventions <- merge(interventionsraw,  counties, by="FIPS")
#View(interventions)

#merge the hospital and county dataframes
hospitalizations <- merge(hospitalsraw, counties,by="FIPS")
View(hospitalizations)

#merge infection and county dataframes
infections <- merge(infectionsraw, counties,by="FIPS")
View(infections)

#merge death and county dataframes
deaths <- merge(deathsraw, counties,by="FIPS")
View(deaths)


