# Define server logic
shinyServer(function(input, output) {
   
  output$specsLinePlot <- renderPlot({
    
    # filter specialties dataset by specialty
    specs_data <- top5_specialties_rates %>% 
      filter(specialty_description == input$specialty)
    
    # create a line plot from filtered specialty data
    ggplot(specs_data, aes(x=year, y=opioid_prescription_rate, color = specialty_description)) +
      geom_line() +
      theme_bw() +
      theme(axis.title.x = element_blank()) +
      scale_color_discrete(name = "Specialty", breaks = c("Interventional Pain Management",
                                                          "Pain Management",
                                                          "Anesthesiology", 
                                                          "Orthopedic Surgery", 
                                                          "Physical Medicine and Rehabilitation")) +
      labs(y="Prescription Rate", title="Opioid Prescription Rate")
    
  })
  output$providers <- renderValueBox({
    
    # filter providers dataset by state and year
    state_data <- providers %>% 
      filter(State == input$state & year == input$year)
    
    # create a line plot from filtered state data
    valueBox(formatC(state_data$count_npi, digits = 0, format = "f"),
             subtitle = "Count of Providers")
  })
  output$rate <- renderValueBox({
    
    # filter providers dataset by state and year
    state_data <- providers %>% 
      filter(State == input$state & year == input$year)
    
    # create a line plot from filtered state data
    valueBox(formatC(state_data$opioid_prescription_rate, digits = 1, format = "f"),
             subtitle = "Prescription Rate")
  })
  output$opioid_claims <- renderValueBox({
    
    # filter providers dataset by state and year
    state_data <- providers %>% 
      filter(State == input$state & year == input$year)
    
    # create a line plot from filtered state data
    valueBox(formatC(state_data$opioid_claims, digits = 0, format = "f"),
             subtitle = "Opioid Claims")
  })
  output$total_claims <- renderValueBox({
    
    # filter providers dataset by state and year
    state_data <- providers %>% 
      filter(State == input$state & year == input$year)
    
    # create a line plot from filtered state data
    valueBox(formatC(state_data$total_claims, digits = 0, format = "f"),
             subtitle = "Total Claims")
  })
})
