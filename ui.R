# Define UI for application
shinyUI(dashboardPage(
  dashboardHeader(title = "Opioid Dashboard"),
  dashboardSidebar(tags$blockquote("Welcome to the Opioids Dashboard. 
                                   Select inputs below to filter dashboard."),
                   selectInput("year",
                               label = "Year",
                               choices = years,
                               selected = 2016),
                   selectInput("state",
                               label = "State",
                               choices = states,
                               selected = "TN"),
                   selectInput("specialty",
                               label = "Specialty",
                               choices = specialties,
                               selected = "Orthopedic Surgery")),
  dashboardBody(
    h2("Opioid Metrics"),
    fluidRow(
      valueBoxOutput("providers"),
      valueBoxOutput("beneficiaries"),
      valueBoxOutput("rate"),
      valueBoxOutput("opioid_claims"),
      valueBoxOutput("total_claims"))
                
  ))
)