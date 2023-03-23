#load the reticulate package  
library(reticulate)

setwd("~/Documents/GitHub/spacetime_R")

# activate environment
use_condaenv(condaenv = "barra_python", conda = "auto", required = FALSE)

# source modules
source_python("spacetime/input/readData.py", convert = F)
source_python("spacetime/scale/rasterAlign.py", convert = F)
source_python("spacetime/scale/rasterTrim.py", convert = F) 
source_python("spacetime/objects/fileObject.py", convert = F) 
source_python("spacetime/operations/cubeSmasher.py", convert = F)
source_python("spacetime/operations/makeCube.py", convert = F) 
source_python("spacetime/operations/loadCube.py", convert = F) 
source_python("spacetime/graphics/dataPlot.py", convert = F) 
source_python("spacetime/output/writeCSV.py", convert = F) 
source_python("spacetime/operations/time.py", convert = F)
source_python("spacetime/operations/cubeToDataframe.py", convert = F)
########################################################################################################################

# Begin R script
########################################################################################################################

# get tif files from CpCM folder
dataPaths <- list.files(path="CpCM", pattern="*.tif", full.names=TRUE, recursive=FALSE)


#############################################
######### spacetime function wrappers #######
#############################################







# read data R wrapper
read.data <- function(data){
  
  ds = read_data(data)
  return(ds)
}


# read data R wrapper
raster.trim <- function(data){
  
  ds = raster_trim(data)
  return(ds)
}


raster.align <- function(data, resolution, SRS, noneVal){
  
  # align rasters
  newObj = raster_align(data=data, resolution=resolution, SRS=SRS, noneVal=noneVal)

  return(newObj)

}




make.cube <- function(data, fileName, organizeFiles = "filestotime", organizeBands="bandstotime", varNames="None", timeObj="None"){
  # align rasters
  if(varNames == "None" & timeObj == "None"){
    newObj = make_cube(data = data, fileName = fileName, organizeFiles = organizeFiles, organizeFiles=organizeFiles)
  } else if(varNames == "None" & timeObj != "None"){
    newObj = make_cube(data = data, fileName = fileName, organizeFiles = organizeFiles, organizeFiles=organizeFiles, timeObj=timeObj)
  } else {
    newObj = make_cube(data = data, fileName = fileName, organizeFiles = organizeFiles, organizeFiles=organizeFiles, varNames=varNames, timeObj=timeObj)
  }
  
  
  return(newObj)
  
}







#############################################
######### spacetime method wrappers #########
#############################################

# get lat wrapper
get_lat <- function(obj){
  
  x = py_to_r(obj$get_lat())
  return(x)
}


# get lon wrapper
get_lon <- function(obj){
  
  x = py_to_r(obj$get_lon())
  return(x)
}

# get UL corner wrapper
get_UL_corner <- function(obj){
  
  x = py_to_r(obj$get_UL_corner())

  return(x)
}


# get EPSG code wrapper
get_epsg_code <- function(obj){
  
  x = py_to_r(obj$get_epsg_code())
  
  return(x)
}



# get units wrapper
get_units <- function(obj){
  
  x = py_to_r(obj$get_units())
  
  return(x)
}


# get band number wrapper
get_band_number <- function(obj){
  
  x = py_to_r(obj$get_band_number())
  
  return(x)
}


# get raster dims wrapper
get_dims <- function(obj){
  
  x = unlist(py_to_r(obj$get_dims()))
  x <- split(x, ceiling(seq_along(unlist(x))/2))
  
  return(x)
}



# get nodata value wrapper
get_nodata_value <- function(obj){
  
  x = py_to_r(obj$get_nodata_value())
  
  return(x)
}
 

# get data wrapper
get_data_array <- function(obj){
  
  x = py_to_r(obj$get_data_array())
  
  return(x)
}



# get GDAL data wrapper
get_GDAL_data <- function(obj){
  
  x = py_to_r(obj$get_GDAL_data())
  
  return(x)
}



# get time wrapper
get_time <- function(obj){
  
  x = py_to_r(obj$get_time())
  
  return(x)
}


# get var names wrapper
get_var_names <- function(obj){
  
  x = py_to_r(obj$get_var_names())
  
  return(x)
}





ds <- read.data(dataPaths)
newObj = raster_align(data=ds, noneVal = -9999, SRS=4326)  
trimmed = raster.trim(newObj)
cube = make.cube(data = trimmed, fileName = "c44.nc4", organizeFiles = "filestotime", organizeBands = "bandstotime")




t <- get_time(x)
t












# read in data
ds = read_data(dataPaths)

# align rasters
newObj = raster_align(data=ds, noneVal = -9999, SRS=4326)  

# trim the rasters to the same greatest common bounding box
trimmed = raster_trim(newObj)

# make the aligned file object into a cube with a time element (writes the new file to disk)
cube = make_cube(data = trimmed, fileName = "cpcm.nc4", organizeFiles = "filestotime", organizeBands = "bandstotime")



#x <- trimmed$get_data_array()

#array(x)


#matrix(x[[1]])










