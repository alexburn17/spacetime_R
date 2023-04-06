.onLoad <- function(libname, pkgname) {
  
  library(reticulate)
  use_condaenv(condaenv = "r-reticulate", conda = "auto", required = TRUE)
  
  print("it ran")
  

  
}