#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rs
library(wordcloud)
library(shiny)

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
 titlePanel(h1(strong("Data Analysis of the Presidential Elections"),align = "center",style="color:darkblue")),
 hr(),
 
 sidebarLayout(
   sidebarPanel(img(src="Election-featured.jpg",align="center",height = 400,width=400),
                selectInput("candidate", label = h3("WordCloud"),
                choices = list("ALL"= 1), selected = 1),
                hr(),
                selectInput("type",label = h2("Select"), choices = list("Day1" = 1,"Day2" = 2,"Day3" = 3, "Day4"=4, "Day5" =5, "Day6" = 6, "Day7" = 7, "Week"=8),selected = 1)),
 mainPanel(
   plotOutput("plot1",width= "75%"),
   h4(strong(em("WordCloud for all tweets collected")),align="center",style = "color:green"),
   img(src="wordcolud.png",align="center",height = 500,width=900)
 
   
 )
              )
     )
   )


# Define server logic required to draw a histogram
server <- shinyServer(function(input, output,session) {
 
  
  output$plot1 <- renderPlot(
    {
      data <- switch(input$type,
                     "1" = list1,
                     "2" = list2,
                     "3" = list3,
                     "4" = list4,
                     "5" = list5,
                     "6" = list6,
                     "7" = list7,
                     "8" = list8)
      barplot(data,width = 0.01,col = c("blue","red","lavender"),border = "black",main="Number of Tweets for each candidate",legend.text = c("Donald Trump","Hillary Clinton", "Bernie Sanders"))
    }
  )
      
   
})

# Run the application 
shinyApp(ui = ui, server = server)

