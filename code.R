library(plotGoogleMaps)
library(RColorBrewer) 

data <- read.csv("data.csv")

coordinates(data) <- ~artist.longitude +artist.latitude
proj4string(data) <- CRS("+init=epsg:4326")

key.entries <- c( 1.05,1.1,1.25,max (data$sa.hf))

m <- bubbleGoogleMaps(data, zcol='sa.hf', filename = 'map.html',
                      mapTypeId= 'TERRAIN', fitBounds=T, max.radius=75000, 
                      key.entries=key.entries, colPalette=brewer.pal(4,"YlOrRd"),
                      layerName="Ratio of Song Hotness to Artist Familiarity"
)
