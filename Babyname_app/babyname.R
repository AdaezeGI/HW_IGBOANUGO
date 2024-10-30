library(shiny)
library(babynames)

qrt<-quantile(babynames$year, probs = c(0,0.25,0.5,0.75,1))

ui <- fluidPage(
  titlePanel("Plot and Table of Name"),
  title = "Can you find me?",
  

  textInput(inputId = "name",
            label = "Baby Name",
            placeholder = "Arya"),
  

  radioButtons(inputId = "sex",
               label = "Gendre",
               choices = c(Boy = "M",
                           Girl = "F")),

  
sliderInput(inputId = "year",
            label = "Year",
            min = min(babynames$year),
            max = max(babynames$year),
            value = c(qrt[2], qrt[4])
            ),
submitButton("Take Action"),



tableOutput(outputId = "baby"),
plotOutput(outputId = "plot")



)

server <- function(input, output, session){
 output$plot <- renderPlot(
   
   babynames %>% 
     filter(name == input$name,   
            sex == input$sex,
            year >=min(input$year), year <= max(input$year)) %>% 
     ggplot(aes(year, n)) +
     geom_line()
   
 ) 
 
 output$baby <- renderTable(
   babynames %>% 
   filter(name == input$name,
          sex == input$sex,
          year >=min(input$year) , year <= max(input$year)) %>% 
 select(year, n)
 )
 
}

shinyApp(ui = ui, server = server)