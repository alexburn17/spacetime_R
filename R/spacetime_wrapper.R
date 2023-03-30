# load the reticulate package  


#install_miniconda(path = miniconda_path(), update = TRUE, force = FALSE)

#conda_list()

library(reticulate)

# python packages to install
dependancies <- c("pandas", "numpy")



  
print("installing anaconda, a python package manger. If it is already installed, this step will be skipped.")
  
install_miniconda(path = miniconda_path(), update = FALSE, force = TRUE)


py_install(
  packages = dependancies,
  envname = "r-miniconda",
  method = "conda",
  python_version = "3.9.16",
  pip = TRUE
)

print("installing required python packages")
conda_install("r-reticulate", "gdal")
conda_install("r-reticulate", "xarray")
conda_install("r-reticulate", "psutil")
conda_install("r-reticulate", "plotly_express")
conda_install("r-reticulate", "netCDF4")

# activate environment
use_condaenv(condaenv = "r-reticulate", conda = "auto", required = TRUE)



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



#############################################
######### spacetime function wrappers #######
#############################################




do_a_thing<- function(data){
  t <- data+3
  return(t)
}

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




make.cube <- function(data, fileName, organizeFiles, organizeBands, varNames = "None", timeObj = "None"){
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












