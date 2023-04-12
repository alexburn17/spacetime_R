
library(reticulate)


########################################################################################################################

# Begin R script
########################################################################################################################



#############################################
######### spacetime function wrappers #######
#############################################




install_miniconda <- function(){
  
  user_permission <- utils::askYesNo("Install miniconda? downloads 50MB and takes time")

  if (isTRUE(user_permission)) {
    reticulate::install_miniconda(path = miniconda_path(), force = TRUE)
  } else {
    message("You should run `reticulate::install_miniconda()` before using this package")
  }

}


do_a_thing<- function(data){
  
  t <- get_array()
  
  return(t)
}

# read data R wrapper
read_data <- function(data){
 
  ds = read_data(data)
  return(ds)
}


# read data R wrapper
raster_trim <- function(data){
  
  ds = raster_trim(data)
  return(ds)
}


raster_align <- function(data, resolution, SRS, noneVal){
  
  # align rasters
  newObj = raster_align(data=data, resolution=resolution, SRS=SRS, noneVal=noneVal)

  return(newObj)

}




make_cube <- function(data, fileName, organizeFiles, organizeBands, varNames = "None", timeObj = "None"){
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
  
  x = obj$get_lat()
  return(x)
}


# get lon wrapper
get_lon <- function(obj){
  
  x = obj$get_lon()
  return(x)
}

# get UL corner wrapper
get_UL_corner <- function(obj){
  
  x = obj$get_UL_corner()

  return(x)
}


# get EPSG code wrapper
get_epsg_code <- function(obj){
  
  x = obj$get_epsg_code()
  
  return(x)
}



# get units wrapper
get_units <- function(obj){
  
  x = obj$get_units()
  
  return(x)
}


# get band number wrapper
get_band_number <- function(obj){
  
  x = obj$get_band_number()
  
  return(x)
}


# get raster dims wrapper
get_dims <- function(obj){
  
  x = unlist(obj$get_dims())
  x <- split(x, ceiling(seq_along(unlist(x))/2))
  
  return(x)
}



# get nodata value wrapper
get_nodata_value <- function(obj){
  
  x = obj$get_nodata_value()
  
  return(x)
}
 

# get data wrapper
get_data_array <- function(obj){
  
  x = obj$get_data_array()
  
  return(x)
}



# get GDAL data wrapper
get_GDAL_data <- function(obj){
  
  x = obj$get_GDAL_data()
  
  return(x)
}



# get time wrapper
get_time <- function(obj){
  
  x = obj$get_time()
  
  return(x)
}


# get var names wrapper
get_var_names <- function(obj){
  
  x = obj$get_var_names()
  
  return(x)
}












