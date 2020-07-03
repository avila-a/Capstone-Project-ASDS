# install.packages("openair")
library(tidyverse)
library("openair")

kc1 <- importAURN(site = "kc1", year = 2011:2012)
sub2 <- timeAverage(kc1, avg.time = "2 week")
windRose(kc1)ç
calendarPlot(kc1)
# kc1.airbase <- importAirbase(site = "gb0620a")

sites <- airbaseFindCode(country = c("DE", "GB"), site.type = "background")
?openair::importEurope

traj <- importTraj(site = "london")
View(traj)
position <- traj %>%
  group_by(lat, lon) %>%
  summarise_all(first)

stuttgart <- importEurope("debw118", year = 2010:2019, meta = TRUE)

# install.packages("saqgetr")
library(saqgetr) # https://github.com/skgrange/saqgetr
library(leaflet)

# Import site information
data_sites <- get_saq_sites()
?get_saq_sites
# Glimpse tibble
glimpse(data_sites)

table(data_sites$data_source)

leaflet()  %>% addTiles() %>% 
  addMarkers(lng = data_sites$longitude[1:2000], 
             lat = data_sites$latitude[1:2000])

random_site <- data_sites$site[1243]
data_ex <- get_saq_observations(
  site = c("gb0036r", "gb0682a"), 
  start = 1990,
  verbose = TRUE
)
summary(data_ex)
glimpse(data_ex)
table(data_ex$variable)
