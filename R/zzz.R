get_array <- NULL
#read_data <- NULL

.onLoad <- function(libname, pkgname) {

  use_condaenv(condaenv = "r-reticulate", conda = "auto", required = TRUE)
  
  the_mod <- reticulate::import_from_path(module = "spacetime_test", system.file("python", "input", package = "spacetime", mustWork = TRUE))
  #readData <- reticulate::import_from_path(module = "readData", system.file("python", "input", package = "spacetime", mustWork = TRUE))
  
  
  get_array <<- the_mod$get_array
  #read_data <<- readData$read_data
  
  
}
  
  
  
  

  
