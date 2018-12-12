# Define UI for application
shinyUI(dashboardPage(
  dashboardHeader(title = "Opioid Dashboard"),
  dashboardSidebar(tags$blockquote("Welcome to the Opioids Dashboard."),
                   sidebarMenu(
                     menuItem("Overall Dashboard", tabName = "dashboard", icon = icon("dashboard")),
                     menuItem("State Dashboard", tabName = "stateDash", icon = icon("dashboard"))
                   )),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
              fluidRow(
                box(
                  title = "Specialties", status = "primary", solidHeader = TRUE,
                  "Select a specialty to see opioids prescribed per year", width = 5,
                  selectInput("specialty",
                              label = NULL,
                              choices = specialties,
                              selected = NULL)
                ),
                box(
                  title = "Prescription Rates per Specialty over Time", status = "primary",
                  solidHeader = TRUE, width = 7, plotOutput("specsLinePlot", height = 300)
                )
              )),
      tabItem(tabName = "stateDash",
              fluidRow(
                box(
                  title = "Year", status = "primary", solidHeader = TRUE,
                  "Select a year to see opioids prescribed", width = 5,
                  selectInput("year",
                              label = NULL,
                              choices = years,
                              selected = 2016)),
                box(
                  title = "States", status = "primary", solidHeader = TRUE,
                  "Select a state to see counts by state", width = 5,
                  selectInput("state",
                              label = NULL,
                              choices = states,
                              selected = "Tennessee"))
                ),
              fluidRow(
                valueBoxOutput("providers"),
                valueBoxOutput("rate"),
                valueBoxOutput("opioid_claims"),
                valueBoxOutput("total_claims")
              )
              ))
    )
  )
)