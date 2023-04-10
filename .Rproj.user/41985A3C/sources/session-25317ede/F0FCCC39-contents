.onLoad <- function(libname, pkgname) {
  
  library(reticulate)
  use_condaenv(condaenv = "r-reticulate", conda = "auto", required = TRUE)
  
  stga <- NULL
  
  stga <<- reticulate::import_from_path("test", system.file("python", "input/test.py", package = packageName(), mustWork = TRUE))
  
  
  
  
  #reticulate::py_run_file(system.file("python/input/test.py", package = "spacetime"))
  
  
  
#  user_permission <- utils::askYesNo("Install miniconda? downloads 50MB and takes time")
#  
#  if (isTRUE(user_permission)) {
#    reticulate::install_miniconda(path = miniconda_path(), update = TRUE, force = TRUE)
#  } else {
#    message("You should run `reticulate::install_miniconda()` before using this package")
#  }
}