server = function(session, input, output){
  
  output$box1 <- renderValueBox({
    valueBox(1000, subtitle = 'No. of Upazilas', icon = icon('users'), color = 'teal')
  })
  output$box2 <- renderValueBox({
    valueBox(1000, subtitle = 'No. of Upazilas', icon = icon('users'), color = 'teal')
  })
  output$box3 <- renderValueBox({
    valueBox(1000, subtitle = 'No. of Upazilas', icon = icon('users'), color = 'teal')
  })
  output$box4 <- renderValueBox({
    valueBox(1000, subtitle = 'No. of Upazilas', icon = icon('users'), color = 'teal')
  })
  
  coxs <- read_sf("C:/Users/EKARCH-MANGO-JV/Documents/shiny/data/coxs.shp")
  
  mapColors <- colorFactor("plasma", domain = levels(coxs$ADM3_EN))
  
  output$map_id <- renderLeaflet({
    coxs %>% leaflet() %>% 
      addTiles(
        urlTemplate = "http://mt0.google.com/vt/lyrs=p&hl=en&x={x}&y={y}&z={z}",
        attribution = 'Google',
        options = providerTileOptions(opacity = 0.7)
      ) %>%
      addPolygons(
        fillColor = "yellow",
        weight = 2,
        color = "red",
        dashArray = 5,
        fillOpacity = 1,
        label = coxs$ADM3_EN,
        labelOptions = labelOptions(
          style = list('font-weight' = 'normal', padding = '3px 8px'),
          textsize  = "12px",
          direction = "auto"
        )
      ) %>% 
      addFullscreenControl() %>%
      addMiniMap(tiles = providers$openStreetMap, width = 120, height = 80)
  })
  
  output$pie_id <- renderHighchart({
    hchart()
  })
}


  