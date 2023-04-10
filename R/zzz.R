get_array <- NULL

.onLoad <- function(libname, pkgname) {
  
  use_condaenv(condaenv = "r-reticulate", conda = "auto", required = TRUE)
  
  reticulate::import_from_path(module = "spacetime_test", system.file("python/input", "spacetime_test.py", package = "spacetime", mustWork = TRUE))

  

  
  
  #reticulate::py_run_file(system.file("python/input/test.py", package = "spacetime"))
  
  
  
#  user_permission <- utils::askYesNo("Install miniconda? downloads 50MB and takes time")
#  
#  if (isTRUE(user_permission)) {
#    reticulate::install_miniconda(path = miniconda_path(), update = TRUE, force = TRUE)
#  } else {
#    message("You should run `reticulate::install_miniconda()` before using this package")
#  }
}