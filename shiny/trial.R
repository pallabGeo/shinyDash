library(dplyr)
library(leaflet)
library(sf)
library(sp)
library(leaflet.extras)
library(htmltools)

coxs <- read_sf("C:/Users/EKARCH-MANGO-JV/Documents/shiny/data/coxs.shp")

mapColors <- colorFactor("plasma", domain = levels(coxs$ADM3_EN))
            
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
  )