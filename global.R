library(tidyverse)
library(shinydashboard)

top5_specialties_rates <- readRDS("data/top5_specs_year.rds")
providers <- readRDS("data/cms_state_providers.rds")

specialties <- as.data.frame(top5_specialties_rates) %>% 
  select(specialty_description) %>% 
  unique()

states <- as.data.frame(providers) %>% 
  select(State) %>% 
  unique()

years <- as.data.frame(providers) %>% 
  select(year) %>% 
  unique()