library(tidyverse)
library(shinydashboard)

specialties_year <- readRDS("data/specialties_year.rds")
top5_specialties_rates <- readRDS("data/top5_specs_year.rds")
providers <- readRDS("data/cms_state_providers_specs.rds")

specialties <- as.data.frame(providers) %>% 
  select(specialty_description) %>% 
  unique()

states <- as.data.frame(providers) %>% 
  select(nppes_provider_state) %>% 
  unique()

years <- as.data.frame(providers) %>% 
  select(year) %>% 
  unique()