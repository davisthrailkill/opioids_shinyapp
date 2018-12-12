library(tidyverse)
library(shinydashboard)

top5_specialties_rates <- readRDS("data/top5_specs_year.rds")

specialties <- as.data.frame(top5_specialties_rates) %>% 
  select(specialty_description) %>% 
  unique()
