# Define UI for application
shinyUI(dashboardPage(
  dashboardHeader(title = "Opioids Dashboard"),
  dashboardSidebar(tags$blockquote("Select inputs below to filter dashboard."),
                   selectInput("year",
                               label = "Year",
                               choices = years,
                               selected = 2016),
                   selectInput("state",
                               label = "State",
                               choices = states,
                               selected = "TN",
                               selectize = TRUE),
                   selectInput("specialty",
                               label = "Specialty",
                               choices = specialties,
                               selected = "Orthopedic Surgery",
                               selectize = TRUE)),
  dashboardBody(
    h2("Opioid Metrics"),
    fluidRow(
      box(title = "Opioid Prescription Rate", status = "primary",
                 plotOutput("map", height = 162), width = 4),
      column(width = 8,
             valueBoxOutput("providers"),
             valueBoxOutput("beneficiaries"),
             valueBoxOutput("30_day_fills"),
             valueBoxOutput("total_claims"),
             valueBoxOutput("opioid_claims"),
             valueBoxOutput("rate"))
    ),
    fluidRow(
      box(title = "Opioid Prescriber List", status = "primary",
          dataTableOutput("opioid_providers_table"), width = 12)
    )
  ))
)