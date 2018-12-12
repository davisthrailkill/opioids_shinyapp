# Define server logic
shinyServer(function(input, output) {
   
  output$specsLinePlot <- renderPlot({
    
    # filter specialties dataset by specialty
    specs_data <- top5_specialties_rates %>% 
      filter(specialty_description == input$specialty)
    
    # create a line plot from filtered data
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
  
})
