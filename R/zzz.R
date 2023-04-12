get_array <- NULL

.onLoad <- function(libname, pkgname) {
  
  use_condaenv(condaenv = "r-reticulate", conda = "auto", required = TRUE)
  
  the_mod <- reticulate::import_from_path(module = "spacetime_test", system.file("python", "input", package = "spacetime", mustWork = TRUE))
  get_array <<- the_mod$get_array
  
}