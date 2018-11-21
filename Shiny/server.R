#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

suppressWarnings(library(shiny))
suppressWarnings(library(ANLP))

# List of all the models

modelsList = readRDS("modelsList.RDS")



# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output, session) {
  
  # Expression that generates a plot of the distribution. The expression
  # is wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically
  #     re-executed when inputs change
  #  2) Its output type is a plot
  
  observe({
   
    text <- reactive({input$text})
    
    
    predictions <- predict_Backoff(text(),modelsList)
    a1 <<- predictions[1]
    
    
    output$prediction1 <- renderUI({
      actionButton("button1", label = a1)
      #HTML("<button id="prediction1" class="shiny-text-output"></button>")
    })
    
    
    
    
    output$prediction2 <- renderUI({
      actionButton("button2", label = a2)
      
    })
    
    
    
    output$prediction3 <- renderUI({
      actionButton("button3", label = a3)
      
    })
    
  })
  
  observeEvent(input$button1, {
    if(input$button1 == 1){
      name <- paste(input$text, a1)
      updateTextInput(session, "text", value=name)
    }
    
  })
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
})


