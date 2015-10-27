library(rgdal)
library(plyr)
### Read in Data ###
### Read in Data ###
### Read in Data ###

# If you haven't read a GeoJson into R before then see if 
# "GeoJSON" %in% ogrDrivers()$name 
# returns TRUE, if not you'll want to consider another format
VisZeroMap = readOGR("http://opendata.dc.gov/datasets/3f28bc3ad77f49079efee0ac05d8464c_0.geojson", "OGRGeoJSON")

VisZeroDF<-read.csv('https://raw.githubusercontent.com/HackShopDC/October29-VisionZeroData/master/Vision_Zero_Safety_Transportation.csv',na.strings=c("", "NA"),strip.white=TRUE,
                    colClasses=c(rep("numeric",3),rep("character",5),"numeric","character","character"))

count(VisZeroDF$USERTYPE)
count(VisZeroDF$REQUESTTYPE)

VisZeroDF$DATE <- as.Date(substr(VisZeroDF$REQUESTDATE,1,10), "%Y-%m-%d")
VisZeroDF$HOUR <- as.numeric(substr(VisZeroDF$REQUESTDATE,12,13))
VisZeroDF<-subset(VisZeroDF, substr(VisZeroDF$DATE,1,4)=='2015')
