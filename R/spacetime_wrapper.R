
library(reticulate)


########################################################################################################################

# Begin R script
########################################################################################################################



#############################################
######### spacetime function wrappers #######
#############################################




install_python_environment <- function(){
  
  user_permission <- utils::askYesNo("Install python environment through miniconda? Miniconda is required for spacetime to run. If you havent already installed it, type yes")

  if (isTRUE(user_permission)) {
    reticulate::install_miniconda(path = miniconda_path(), force = TRUE)
  } else {
    message("You are all set!")
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














