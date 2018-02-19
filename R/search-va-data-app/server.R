
# Load packages
library(dplyr)
library(geojsonio)
library(htmltools)
library(leaflet)
library(magrittr)
library(rgdal)
library(shiny)

# Load functions
source("make_map.R")

# Load data
data = geojsonio::geojson_read(x = "vets_by_state_spatial.geojson", what = "sp")

# Define server 
shinyServer(function(input, output) {
   
  map =  eventReactive(input$update, {
    make_map(data, input$field)
  })
  
  
  output$map <- renderLeaflet({
    
    map()
    
  })
  
})
