# Define UI for application
shinyUI(dashboardPage(
  dashboardHeader(title = "Opioid Prescriptions"),
  dashboardSidebar(tags$blockquote("This is a dashboard on opioids."),
                   sidebarMenu(
                     menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"))
                   )),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
              fluidRow(
                box(
                  title = "Specialties", status = "primary", solidHeader = TRUE,
                  "Select a specialty to see opioids prescribed per year", width = 5,
                  selectInput("specialty",
                              label = "Specialty",
                              choices = specialties,
                              selected = 2016)
                ),
                box(
                  title = "Prescription Rates by Sepcialties over Time", status = "primary",
                  solidHeader = TRUE, width = 7, plotOutput("specsLinePlot", height = 300)
                )
              ))
    )
  )
))