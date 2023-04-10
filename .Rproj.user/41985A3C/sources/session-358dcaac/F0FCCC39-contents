.onLoad <- function(libname, pkgname) {
  
  library(reticulate)
  use_condaenv(condaenv = "r-reticulate", conda = "auto", required = TRUE)
  
  get_array <- NULL
  st_test <- reticulate::import_from_path("spacetime_test", system.file("python/input/spacetime_test.py", package = packageName(), mustWork = TRUE))
  get_array <<- st_test$get_array 
  
  
  #reticulate::py_run_file(system.file("python/input/test.py", package = "spacetime"))
  
  
  
#  user_permission <- utils::askYesNo("Install miniconda? downloads 50MB and takes time")
#  
#  if (isTRUE(user_permission)) {
#    reticulate::install_miniconda(path = miniconda_path(), update = TRUE, force = TRUE)
#  } else {
#    message("You should run `reticulate::install_miniconda()` before using this package")
#  }
}