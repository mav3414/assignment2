getwd()
library(shiny)
library(sp)
library(shiny)
library(plotly)
library(sf)
library(tidyverse)
library(ggplot2)

setwd(".github/workflows")

rsconnect::setAccountInfo(name='miguelmav3414',
                          token='F63E8E968694AB2228B3408E6EF7BCEF',
                          secret='ptXXYz7/jVWpaU2aFhD+muPyNpKcIaQ2qZzCEcN/')
library(rsconnect)
rsconnect::deployApp(".github/workflows", appName = "test")
##################################################################
#Problem 3_ with 2 input functions, Toggle Major_streets

library(sp)
library(shiny)
library(plotly)

ui <- fluidPage(
  fluidRow(
    column(width = 12, 
           align = "center", 
           tags$h1("Assignment 2: Shiny R")
    )
  ),
  
  fluidRow(
    column(width = 4, 
           offset = 4,
           align = "center", 
           tags$em(tags$h3("Arrests in Chicago by District: 2002"))
    ),
    column(width = 5, 
           align = "center", 
           offset = 4, 
           tags$h3("PPHA 30536 Winter 2022")
    )
  ),
  fluidRow(column(width = 5, 
                  align = "center", 
                  offset = 4,        
                  selectInput(inputId = "dist",
                              label = "Please pick District group",
                              choices = c("1_5","6_9_22", "10_14","15_21" ))
                  
  )),
  fluidRow(column(width = 5, 
                  align = "center", 
                  offset = 4,        
                  selectInput(inputId = "streets",
                              label = "Toggle Major_Streets On/Off",
                              choices =c("streets","nostreet"))
                  
  )),
  
  fluidRow(column(width = 8, 
                  align = "center", 
                  offset = 3,imageOutput(outputId = "dist")
  )
  ),

  fluidRow(column(width = 8, 
                  align = "center", 
                  offset = 3, imageOutput(outputId = "streets")
  )
  ),
)

server <- function(input, output) {
  output$dist <- renderImage({ 
    if (input$dist == "1_5") {
      src <- "workflows/parrestonefive.png"
    } else if (input$dist == "6_9_22") {
      src <- "workflows/pqarrestn6_9.png"
    }else if (input$dist == "10_14") {
      src <- "workflows/pqarrestS10_14.png"
    }else if (input$dist == "15_21") {
      src <- "workflows/parrestsfiftwo.png"
    }
  
    list(src = src,
         width = "80%")
  }, deleteFile = FALSE)
  output$streets <- renderImage({ 
    if (input$streets == "streets") {
      src <- "workflows/merged2.png"
    } else if (input$streets == "nostreet") {
      src <- "workflows/my_arrestmap.png"
    } 
    list(src = src,
         width = "80%")
  }, deleteFile = FALSE)

}

shinyApp(ui = ui, server = server)
