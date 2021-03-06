#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

suppressWarnings(library(shiny))
suppressWarnings(library(shinythemes))
suppressWarnings(library(wordcloud))

# Define UI for application that plots random distributions
shinyUI(navbarPage("Next word prediction model",
                   theme = shinytheme("spacelab"),
                   
                   
                   # Sidebar with a slider input for number of observations
                   tabPanel(HTML("Application</a></li><li><a href=\'https://www.linkedin.com/in/williammassalinoauditor/'>Linkedin</a></li></a></li><li><a href=\'mailto:massinha10@hotmail.com'>Email me</a></li><li><a"),
                            
                            fluidRow(
                              column(3),
                              column(6,
                                     tags$head(
                                       tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
                                     ),
                                     tags$div(
                                       #HTML('<textarea width="60%" id="text" rows="3" cols="30" class="form-control"></textarea>'),
                                       h3("Enter your text here"),
                                       tags$textarea(id = 'text', placeholder = 'Type here', rows = 3, class='form-control',""),
                                       
                                       
                                       HTML('<script type="text/javascript"> 
                    document.getElementById("text").focus();
                    </script>'),
                                       
                                       HTML("<div id='buttons'>"),
                                       uiOutput("prediction1",inline = T)),
                                       HTML("</div>"),align="center"),
                                     
                              
                              
                              column(3)
                            )),
                   
                   ## Footer
                   hr(),
                   
                   
                   tags$span(style="color:grey", 
                             
                             tags$footer("@2018-", 
                                         tags$a(
                                           target="_blank",
                                           "William Massalino"), 
                                         align = "Center"))
                   
))