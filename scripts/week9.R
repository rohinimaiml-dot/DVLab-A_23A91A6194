## Install Package
install.packages("leaflet")

## Load he Library
library(leaflet)

#Very Basic Map
leaflet()%>%addTiles()

#Map Centeredon a Location
leaflet()%>%addTiles()%>%
  setView(
    lng=78.9629,
    lat=20.5937,
    zoom=5
  )

#Add a Marker Exapmle: New Delhi
leaflet()%>%
  addTiles()%>%
  addMarkers(
    lng=77.2088,
    lat=28.6139
  )

#Marker with Popup Information
leaflet()%>%
  addTiles()%>%
  addMarkers(
    lng=77.2088,
    lat=28.6139,
    popup="New Delhi"
  )

#Multiple Markers
cities<-data.frame(
  name=c("Delhi","Mumbai","Chennai","Kolkata"),
  lat=c(28.6139,18.9582,13.0827,22.5744),
  lng=c(77.2088,72.8321,80.2707,88.3629)
)

leaflet(cities)%>%
  addTiles()%>%
  addMarkers(
    lng=~lng,
    lat=~lat,
    popup=~name
  )

#Circle Markers (instead of pins,use circles.)
leaflet(cities)%>%
  addTiles()%>%
  addCircleMarkers(
    lng=~lng,
    lat=~lat,
    radius=6,
    color="red",
    popup=~name
  )

#map with color Palette
cities$pop<-c(30,20,11,15)
pal<-colorNumeric(
  palette="red",
  domain=cities$pop
)
leaflet(cities)%>%
  addTiles()%>%
  addCircleMarkers(
    lng=~lng,
    lat=~lat,
    radius=~pop/2,
    color=~pal(pop),
    popup=~name
  )

#Add legend
leaflet(cities)%>%
  addTiles()%>%
  addCircleMarkers(
    lng=~lng,
    lat=~lat,
    radius=~pop/2,
    color=~pal(pop),
    popup=~name
  )%>%
  addLegend(
    "bottomright",
    pal=pal,
    values=~pop,
    title="Population"
  )
#Different map styles leaflet supports different tile layers.
#default open street
leaflet()%>%
  addProviderTiles("OpenStreetMap")

#Dark theme
leaflet()%>%
  addProviderTiles("CartoDB.DarkMatter")

#Light Minimal
leaflet()%>%
  addProviderTiles("CartoDB.Positron")

#Satellite imagery
leaflet()%>%
  addProviderTiles("Esri.WorldImagery")

#Advanced map with layers
leaflet(cities)%>%
  addTiles()%>%
  addCircleMarkers(
    lng=~lng,
    lat=~lat,
    radius=8,
    color="blue",
    group="Cities"
  )%>%
  addLayersControl(
    overlayGroups = c("Cities"),
    options=layersControlOptions(collapsed = TRUE)
  )