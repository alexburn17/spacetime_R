

library(devtools)

install_github("alexburn17/spacetime_R")


library(spacetime)

spacetime::do_a_thing(3)


library(reticulate)
use_condaenv(condaenv = "r-reticulate", conda = "auto", required = TRUE)



# get tif files from CpCM folder
dataPaths <- list.files(path="/Users/pburnham/Documents/data", pattern="*.tif", full.names=TRUE, recursive=FALSE)


outPut <- spacetime::read.data(data=dataPaths)

get_lat(outPut)


newObj <- raster.align(data=outPut, noneVal = -9999, SRS=4326, resolution = .008)  
trimmed = raster.trim(outPut)
cube = make.cube(data = trimmed, fileName = "c44.nc4", organizeFiles = "filestotime", organizeBands = "bandstotime")




#setwd("~/Documents/GitHub/spacetime_R")
#install.packages("roxygen2")

#source("R/spacetime_wrapper.R")





# read in data
#ds = read_data(dataPaths)

# align rasters
#newObj = raster_align(data=ds, noneVal = -9999, SRS=4326)  

# trim the rasters to the same greatest common bounding box
#trimmed = raster_trim(newObj)

# make the aligned file object into a cube with a time element (writes the new file to disk)
#cube = make_cube(data = trimmed, fileName = "cpcm.nc4", organizeFiles = "filestotime", organizeBands = "bandstotime")
















