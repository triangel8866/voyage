#ggmap example
install.packages("ggmap")
install.packages('ggplot2')
library(ggmap)
library(maps)
d <- data.frame(lat=c(12.97131,12.98692,13.00),
                lon=c(77.5121,77.68627,77.58))
Bangalore <- get_map("Bangalore,India", zoom=12)
p <- ggmap(Bangalore)
p + geom_line(data=d, aes(x=lon, y=lat), color="black", size=1)


#load csv file
getwd()
setwd("C:\\Users\\yue.yuan\\Documents\\Yue Yuan Documents\\R\\documents\\demo")
#vessel 1
vel1 <- read.csv("HVP_477766400.CSV")
head(vel1)
vel1 <- vel1[c("mmsi","longitude","latitude")]
head(vel1)
summary(vel1)
library(ggmap)
library(maps)

# bbox <- make_bbox(vel1$longitude, vel1$latitude,f=0.1)

m1 <- get_map(location = c(20,1,140,31), source = "google")
p<- ggmap(m1)
p + geom_line(data = vel1, aes(x=longitude, y = latitude), color = "black", size = 0.5)

#vessel 1 & 2
vel2 <- read.csv("HVP_477770900.csv")
vel2 <- vel2[,c("mmsi","longitude","latitude")]
head(vel2)
vel1.2<- rbind(vel1,vel2)
head(vel1.2)
summary(vel1.2)
vel1.2$mmsi <- as.factor(vel1.2$mmsi)
summary(vel2)
library(ggmap)
library(maps)
# bbox <- make_bbox(vel1.2$longitude,vel1.2$latitude,f=0.01)

m2 <- get_map(location = c(20,-50,140,85), source = "google")

# m2 <- get_map(bbox)
p <- ggmap(m2)
p + geom_path(data = vel1.2, aes(x=longitude, y=latitude, group = mmsi, color = mmsi), size = 0.5)


m3 <- get_map(location = c(100,-2,135,85), source = "google")
p <- ggmap(m3)
p + geom_line(data = vel2, aes(x=longitude, y=latitude, group = mmsi), size = 0.5)




get_km_from_mapdist <- function(i) {
  mapdist(as.character(vel2[i, c('longitude','latitude')]), 
          as.character(vel2[i, c('longitude','latitude')]), 
          mode='driving')$km
}

vel2$dists = sapply(1:nrow(vel2), get_km_from_mapdist)




