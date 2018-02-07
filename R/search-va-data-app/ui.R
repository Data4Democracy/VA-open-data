# Load packages
library(dplyr)
library(geojsonio)
library(leaflet)
library(magrittr)
library(shiny)

# Define UI 
shinyUI(fluidPage(
  
  # Title
  titlePanel("VA Open Data: Vets by State"),
  
  # Sidebar
  sidebarLayout(
    sidebarPanel(
       selectInput(inputId = "field",
                   "Select field to display:",
                   choices = list("18 to 34 years" = 2,	
                               "35 to 54 years" = 3,
                               "55 to 64 years" = 4,
                               "65 to 74 years" = 5,
                               "75 years and over" = 6,
                               "Bachelor Degree or Higher" = 7,
                               "Below Poverty Level-Past 12 Months Income" = 8,	
                               "Disability Rate- with Any Disability" = 9,
                               "Gulf War I (8/1990 to 8/2001)" = 10,	
                               "Gulf War II (9/2001 or later)" = 11,
                               "High School Graduate or Equivalent" = 12,
                               "Korean War" = 13,
                               "Less than High School Graduate" = 14,
                               "Median Personal Income- Past 12 Months" = 15,
                               "Percent Female" = 16,
                               "Some College" = 17,
                               "Unemployment Rate" = 18,
                               "Veteran Population" = 19,
                               "Vietnam Era" = 20,
                               "World War II" = 21),
                   selected = NULL),
       actionButton("update", "Update"),
       
       width = 4
    ),
    
    # Render the table
    mainPanel(
      leafletOutput("map"),
      width = 8
    )
  )
))
