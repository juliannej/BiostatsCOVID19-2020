# Load and subset the data

#Libraries
library(readr)

#Counties sheet
#load the raw counties data
countiesraw <- read_csv("data/counties.csv")
#filter the counties data to be the Western states of the US
#and name the data 'counties'
counties <- subset(countiesraw, State == 'CA' | State == 'OR' | State == 'WA' | 
                    State == 'MT' | State == 'UT' | State == 'NV' | State == 'NM'| 
                     State == 'AZ' | State == 'ID'| State == 'WY'| State == 'CO',)
#have a view of the counties data within RStudio
View(counties)

interventionsraw <- read_csv("data/interventions.csv")

#need to change the FIPS over to be a width of 5 with appropriate leading 0s
#e.g. 1000 becomes 01000
#this makes this dataframe and the counties compatible for a merge
newFIPS <- sprintf("%05d", interventionsraw$FIPS)
interventionsraw$FIPS <- newFIPS

#merge the dataframe so that the data on interventions is usable with that of the main counties
interventions <- merge(counties, interventionsraw,by="FIPS")
View(interventions)
