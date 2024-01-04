
library(reticulate)


########################################################################################################################
# Begin R script
########################################################################################################################



##############################################
######### spacetime function wrappers ########
##############################################



#' Install a python environment - run once after initial installation 
#'
#' @return No return but a python environment will be installed via miniconda at r-reticulate
#' @examples
#' install_python_environment()
install_python_environment <- function(){
  
  user_permission <- utils::askYesNo("Install python environment through miniconda? Miniconda is required for spacetime  to run. If you havent already installed it, type yes")

  if (isTRUE(user_permission)) {
    reticulate::install_miniconda(path = miniconda_path(), force = TRUE)
  } else {
    message("You are all set!")
  }
}


# read data R wrapper
#' Read in raster data as a spacetime file object
#'
#' @param data A list of raster files
#' @return A spacetime file object
#' @examples
#' read_data(data = data_list)
read_data <- function(data){
  
  ds = read_data(data)
  return(ds)
}

# trim data R wrapper
#' Trims rasters in a file object in the manner specified by the "method" argument
#'
#' @param data A spacetime file object
#' @param ul A list of lat and lon values for the upper left corner of a bounding box (list)
#' @param lr A list of lat and lon values for the lower right corner of a bounding box (list)
#' @param method The method used to trim raster stack. Options are "intersection", "union", "corners" or "shape" (character string)
#' @param shapeFile The name of or path to a shape file (character string)
#' @return A spacetime file object with extents trimmed
#' @examples
#' raster_trim(data = fileObj, shapeFile = "file.shp", method = "shape")
raster_trim <- function(data, ul, lr, shapeFile, method = "intersection"){
  
  ds = raster_trim(data = data, method = method, ul = ul, lr = lr, shapeFile = shapeFile)
  return(ds)
}




# data=None, resolution="min", SRS=4326, noneVal=None, algorithm="near"



#' Aligns rasters in a file object to have the same pixel size, alignment, and spatial reference system
#'
#' @param data A spacetime file object
#' @param noneVal The intended no data value (numeric) Defaults to the first in the stack
#' @param resolution The resolution of the intended output (character string or numeric). "min" (selects the largest pixel size in the stack - default), "max" (smallest pixel size in stack), numeric value (the intended pixel size in the units of the intended SRS). " 
#' @param SRS The spatial reference system/EPSG code (numeric) Defaults to the first in the stack
#' @param algorithm The aggregation algorithm method (character string)
#' @return A spacetime file object with aligned files
#' @examples
#' raster_align(data = fileObj, SRS = 4326, noneVal = -9999)
raster_align <- function(data, noneVal, resolution = "min", SRS = 4326, algorithm="near"){
  
  # align rasters
  newObj = raster_align(data=data, resolution=resolution, SRS=SRS, noneVal=noneVal)

  return(newObj)

}


#' Creates a spacetime cube object and writes a .nc4 file to disk
#'
#' @param data A spacetime file object
#' @param fileName The intended name of the file written to disk (character string)
#' @param organizeFiles How files are intended to be organized in the cube (character string)
#' @param organizeBands How bands are intended to be organized in the cube (character string)
#' @param varNames A list of variable names (list)
#' @param timeObj A spacetime time object
#' @param inMemory Should the operation be virtualized (slower but easier on memory) or done in memory (faster but higher memory usage) (boolean or character)
#' @return A spacetime cube object and a nc4 file written to disk
#' @examples
#' make_cube(data = fileObj, fileName = file.nc4, organizeFiles="filestotime", organizeBands="bandstotime")
make_cube <- function(data, fileName, organizeFiles = "filestotime", organizeBands = "bandstotime", varNames = "None", timeObj = "None", inMemory = "auto"){
  # align rasters
  if(varNames == "None" & timeObj == "None"){
    newObj = make_cube(data = data, fileName = fileName, organizeFiles = organizeFiles, organizeBands=organizeBands, inMemory = inMemory)
  } else if(varNames == "None" & timeObj != "None"){
    newObj = make_cube(data = data, fileName = fileName, organizeFiles = organizeFiles, organizeBands=organizeBands, timeObj=timeObj, inMemory = inMemory)
  } else {
    newObj = make_cube(data = data, fileName = fileName, organizeFiles = organizeFiles, organizeBands=organizeBands, varNames=varNames, timeObj=timeObj, inMemory = inMemory)
  }
  
  return(newObj)
  
}












