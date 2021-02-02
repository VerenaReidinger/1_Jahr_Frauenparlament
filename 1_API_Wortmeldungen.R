library(httr)
library(tidyverse)
library(tidyjson)

## Set working directory ####
setwd("D:/Tamedia/GSync/Datenteam/Projekte/202012_Parlament_Frauen/")
getwd()



## Alle relevanten Sessionen holen (bis und mit 46. Legislatur)

url_session <- "https://ws.parlament.ch/odata.svc/Session?$top=1000&$filter=ID gt 4600 and Language eq 'DE'&$format=json" %>% 
  str_replace_all(" ", "%20")
r <- GET(url_session)
r$status_code
temp_a <- jsonlite::fromJSON(content(r, "text"))

df_session <- as_tibble(temp_a$d) %>% select(-c(`__metadata`, Meetings, LegislativePeriods, Businesses, Votes))

# Sessionen speichern
df_session %>% write_csv("Data/relevante_Sessionen.csv")



## Alle Wortmeldungen holen

df_wort <- tibble()

for(IdSession in df_session$ID){
  print(IdSession)
  run <- 1
  lastElement <- 0
  
  while(run == 1){
    print(lastElement)
    url_wort <- str_c("https://ws.parlament.ch/odata.svc/Transcript?$top=1000&$filter=ID gt ", lastElement, "L and Language eq 'DE' and IdSession eq '", IdSession, "'&$select=CouncilId,CouncilName,DisplaySpeaker,Start,End,ID,Type,SpeakerLastName,SpeakerFullName,SpeakerFirstName,MeetingCouncilAbbreviation,IdSession,IdSubject,ParlGroupName,PersonNumber&$format=json") %>% 
      str_replace_all(" ", "%20")
    
    r <- GET(url_wort)
    r$status_code
    temp_a <- jsonlite::fromJSON(content(r, "text"))
    
    ## kommen noch Daten?
    if (is_empty(temp_a$d)) {
      run <- 0
      break
      }
    
    temp_wort <- as_tibble(temp_a$d) %>% select(-"__metadata")
  
    ## letztes Element bestimmen
    lastElement <- max(as.numeric(temp_wort$ID))
    
    df_wort <- bind_rows(df_wort, temp_wort)
  }
}

# Wortmeldungen speichern
df_wort %>% write_csv("Data/wortmeldungen_alle.csv")



## alle Parlamentarier holen

lkp_parl <- tibble()
run <- 1
lastElement <- 0
  
while(run == 1){
  print(lastElement)
  url_parl <- str_c("https://ws.parlament.ch/odata.svc/Person?$top=1000&$filter=ID gt ", lastElement, "L and Language eq 'DE' and PersonNumber gt 0&$format=json") %>% 
    str_replace_all(" ", "%20") 
  
  r <- GET(url_parl)
  r$status_code
  temp_a <- jsonlite::fromJSON(content(r, "text"))
  
  ## kommen noch Daten?
  if (is_empty(temp_a$d)) {
    run <- 0
    break
  }
  
  temp_parl <- as_tibble(temp_a$d) %>% select(c(ID, PersonNumber, PersonIdCode, LastName, FirstName, GenderAsString))
  
  ## letztes Element bestimmen
  lastElement <- max(as.numeric(temp_parl$ID))
  
  lkp_parl <- bind_rows(lkp_parl, temp_parl)
}

## Parlamentarier speichern
lkp_parl %>% write_csv("Data/parlamentarier_alle.csv")
