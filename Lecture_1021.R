install.packages("remotes")
remotes::install_github("rladies/praise")
library(praise)
praise()
install.packages("devtools")
devtools::install_github('RLesur/Rcade')
Rcade::games
praise()


temp_min <- c( -2 , -2 , 0 , 3 , 7 , 10 , 12 , 12 , 8 , 5 , 1 , -1 )
plot(temp_min)
plot(temp_min,pch=19,cex=2,col='#5c0fc960',main="Germany Min Temp",xlab = "Frequency", ylab="Temperature")
lines(lowess(temp_min,f=.4),col='red')
lines(lowess(temp_min,f=.8),col='blue')
lines(lowess(temp_min,f=.2),col='orange')
help(plot)

install.packages("terra")
install.packages("geodata")
install.packages("rnaturalearthdata")
library(sf)
library(terra)
library(geodata)
library(rnaturalearth)

ger <- ne_countries(country="Germany",scale="medium",returnclass="sf")
plot(ger)
clim <- geodata::worldclim_global(var="tmin",res=10,download=T,path='.')
plot(clim)
ger.r <- st_transform(ger,st_crs(clim))
plot(ger.r)

clim_ger_crop <- terra::crop(clim,ger.r)
plot(clim_ger_crop)
clim_ger_mask <- terra::mask(clim_ger_crop, ger.r)
plot(clim_ger_mask)

twn <- ne_countries(country="Taiwan",scale="medium",returnclass="sf")
plot(twn)
twn.r <- st_transform(twn,st_crs(twn))
clim_twn_crop <- plot(terra::crop(clim,twn))
clim_twn_mask <- plot(clim_twn_mask,twn.r)

?geodata
pop <- geodata::population(2020,var="tmin",res=10,download=T,path=".")
plot(pop)
plot(terra::crop(pop,twn))
plot(terra::mask(terra::crop(pop,twn.r),twn.r))

elev <- elevation_30s("Taiwan")
plot(elev)

climGer_vect <- terra::extract(clim_ger_mask, ger, mean)
climGer_vect
plot(unlist(climGer_vect[2:13]))



