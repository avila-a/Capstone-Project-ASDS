rm(list = ls())
# install.packages("ncdf4")
library(ncdf4)

setwd("~/A - Estudios/LSE - Applied Social Data Science/Project/PM2.5/Pollution data")
fn <- "GWRwSPEC_PM25_NA_201201_201212-RH35.nc"
nc <- nc_open(filename = fn)

print(nc)

dat <- ncvar_get(nc, varid = attributes(nc$var)$names[1])
dat <- data.frame(dat)
names(dat) <- nc$dim$LAT$vals
dat$LON <- nc$dim$LON$vals
write.csv(dat, file = "pm25_usa_2012.csv")
nc_close(nc = nc)

# We need to transform this to "tidy".

# nc$var
# dat[1,]
# dim(dat)
# length(nc$dim$LAT$vals)
