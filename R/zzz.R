get_array <- NULL

.onLoad <- function(libname, pkgname) {
  
  
  
  
  user_permission <- utils::askYesNo("Install miniconda? downloads 50MB and takes time")
  
  if (isTRUE(user_permission)) {
    reticulate::install_miniconda(path = miniconda_path(), update = TRUE, force = TRUE)
  } else {
    message("You should run `reticulate::install_miniconda()` before using this package")
  }
  
  
  
  
  use_condaenv(condaenv = "r-reticulate", conda = "auto", required = TRUE)
  
  the_mod <- reticulate::import_from_path(module = "spacetime_test", system.file("python", "input", package = "spacetime", mustWork = TRUE))
  get_array <<- the_mod$get_array
  
  
  
  
  
  
  
  
  
  
  
}