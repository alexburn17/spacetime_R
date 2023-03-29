

library(devtools)

install_github("alexburn17/spacetime_R")

library(spacetime)




# get tif files from CpCM folder
dataPaths <- list.files(path="/Users/pburnham/Documents/data", pattern="*.tif", full.names=TRUE, recursive=FALSE)


ds <- spacetime::read.data(dataPaths)

spacetime::do_a_thing(3)



newObj = raster_align(data=ds, noneVal = -9999, SRS=4326)  
trimmed = raster.trim(newObj)
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
















