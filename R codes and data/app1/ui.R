#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Data Analysis of the Presidential Elections"),
  
  sidebarLayout(
    sidebarPanel(img(src="Election-featured.jpg",align="center",height = 400,width=400),
                 selectInput("candidate", label = h3("Select Candidate"),
                             choices = list("Donald Trump" =1, "Hillary Clinton" = 2,"Bernie Sanders"=3,"ALL"= 4), selected = 3),
                 hr(),
                 selectInput("type",label = h2("Select"), choices = list("Day1" = 1,"Day2" = 2,"Day3" = 3, "Day4"=4, "Day5" =5, "Day6" = 6, "Day7" = 7, "Week"=8),selected = 1)),
    mainPanel(
      plotOutput("plot1",width= "50%"),
      plotOutput("plot2",width = "50%"),
      dataTableOutput("table")
      
    )
  )
)
)