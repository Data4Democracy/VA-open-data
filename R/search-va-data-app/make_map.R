make_map = function(data, x){
  
  library(dplyr)
  library(geojsonio)
  library(htmltools)
  library(leaflet)
  library(magrittr)
  library(rgdal)
  
  if (x == 2){
    
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$X18.to.34.years) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$X18.to.34.years,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(X18.to.34.years),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~X18.to.34.years, 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
    
  }
  else if (x == 3){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$X35.to.54.years) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$X35.to.54.years,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(X35.to.54.years),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~X35.to.54.years, 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  else if (x == 4){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$X55.to.64.years) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$X55.to.64.years,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(X55.to.64.years),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~X55.to.64.years, 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  else if (x == 5){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$X65.to.74.years) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$X65.to.74.years,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(X65.to.74.years),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~X65.to.74.years, 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  else if (x == 6){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$X75.years.and.over) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$X75.years.and.over,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(X75.years.and.over),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~X75.years.and.over, 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  else if (x == 7){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$Bachelor.Degree.or.Higher.) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$Bachelor.Degree.or.Higher.,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(Bachelor.Degree.or.Higher.),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~Bachelor.Degree.or.Higher., 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  else if (x == 8){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$Below.Poverty.Level.Past.12.Months.Income) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$Below.Poverty.Level.Past.12.Months.Income,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(Below.Poverty.Level.Past.12.Months.Income),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~Below.Poverty.Level.Past.12.Months.Income, 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  else if (x == 9){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$Disability.Rate..with.Any.Disability) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$Disability.Rate..with.Any.Disability,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(Disability.Rate..with.Any.Disability),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~Disability.Rate..with.Any.Disability, 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  else if (x == 10){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$Gulf.War.I......................8.1990.to.8.2001.) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$Gulf.War.I......................8.1990.to.8.2001.,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(Gulf.War.I......................8.1990.to.8.2001.),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~Gulf.War.I......................8.1990.to.8.2001., 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  else if (x == 11){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$Gulf.War.II..............................9.2001.or.later.) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$Gulf.War.II..............................9.2001.or.later.,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(Gulf.War.II..............................9.2001.or.later.),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~Gulf.War.II..............................9.2001.or.later., 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  else if (x == 12){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$High.School.Graduate.or.Equivalent.) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$High.School.Graduate.or.Equivalent.,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(High.School.Graduate.or.Equivalent.),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~High.School.Graduate.or.Equivalent., 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright") 
  }
  else if (x == 13){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$Korean.War) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$Korean.War,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(Korean.War),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~Korean.War, 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  else if (x == 14){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$Less.than.High.School.Graduate.) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$Less.than.High.School.Graduate.,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(Less.than.High.School.Graduate.),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~Less.than.High.School.Graduate., 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  else if (x == 15){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$Median.Personal.Income..Past.12.Months) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$Median.Personal.Income..Past.12.Months,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(Median.Personal.Income..Past.12.Months),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~Median.Personal.Income..Past.12.Months, 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  else if (x == 16){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$Percent.Female) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$Percent.Female,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(Percent.Female),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~Percent.Female, 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  else if (x == 17){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$Some.College.) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$Some.College.,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(Some.College.),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~Some.College., 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  else if (x == 18){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$Unemployment.Rate.for.Veterans) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$Unemployment.Rate.for.Veterans,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(Unemployment.Rate.for.Veterans),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~Unemployment.Rate.for.Veterans, 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  else if (x == 19){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$Veteran.Population) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$Veteran.Population,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(Veteran.Population),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~Veteran.Population, 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  else if (x == 20){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$Vietnam.Era) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$Vietnam.Era,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(Vietnam.Era),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~Vietnam.Era, 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  else if (x == 21){
    labels = sprintf("<strong>%s</strong><br/>%g veterans", data$NAME, data$World.War.II) %>% 
      lapply(htmltools::HTML)
    
    pal = colorQuantile(palette = "YlOrRd", 
                        domain = data$World.War.II,
                        n = 4)
    
    m <- leaflet(data) %>%
      setView(-96, 37.8, 4) %>%
      addTiles() %>%
      addPolygons(stroke = TRUE, 
                  smoothFactor = 0.2, 
                  fillOpacity = 0.7,
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillColor = ~pal(World.War.II),
                  label = labels,
                  highlight = highlightOptions(
                    weight = 5,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE)) %>%
      addLegend(pal = pal, 
                values = ~World.War.II, 
                opacity = 0.7, 
                title = NULL,
                position = "bottomright")
  }
  
  return(m)
  
}