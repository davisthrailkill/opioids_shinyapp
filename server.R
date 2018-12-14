# Define server logic
shinyServer(function(input, output) {
   
  output$providers <- renderValueBox({
    
    # filter providers dataset by state and year
    state_data <- providers %>% 
      filter(nppes_provider_state == input$state & specialty_description == input$specialty & 
               year == input$year)
    
    # create a line plot from filtered state data
    valueBox(formatC(state_data$count_npi, digits = 0, format = "f"),
             subtitle = "Count of Providers")
  })
  output$beneficiaries <- renderValueBox({
    state_data <- providers %>%
      filter(nppes_provider_state == input$state & specialty_description == input$specialty &
               year == input$year)
    
    valueBox(formatC(state_data$total_beneficiaries, digits = 0, format = "f"),
             subtitle = "Part D Beneficiaries")
  })
  output$rate <- renderValueBox({
    
    # filter providers dataset by state and year
    state_data <- providers %>% 
      filter(nppes_provider_state == input$state & specialty_description == input$specialty & 
               year == input$year)
    
    # create a line plot from filtered state data
    valueBox(formatC(state_data$opioid_prescription_rate, digits = 1, format = "f"),
             subtitle = "Prescription Rate")
  })
  output$opioid_claims <- renderValueBox({
    
    # filter providers dataset by state and year
    state_data <- providers %>% 
      filter(nppes_provider_state == input$state & specialty_description == input$specialty & 
               year == input$year)
    
    # create a line plot from filtered state data
    valueBox(formatC(state_data$opioid_claims, digits = 0, format = "f"),
             subtitle = "Opioid Claims")
  })
  output$total_claims <- renderValueBox({
    
    # filter providers dataset by state and year
    state_data <- providers %>% 
      filter(nppes_provider_state == input$state & specialty_description == input$specialty & 
               year == input$year)
    
    # create a line plot from filtered state data
    valueBox(formatC(state_data$total_claims, digits = 0, format = "f"),
             subtitle = "Total Claims")
  })
})
