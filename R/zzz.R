.onLoad <- function(libname, pkgname) {
  user_permission <- utils::askYesNo("Install miniconda? downloads 50MB and takes time")
  
  if (isTRUE(user_permission)) {
    reticulate::install_miniconda(path = miniconda_path(), update = TRUE, force = TRUE)
  } else {
    message("You should run `reticulate::install_miniconda()` before using this package")
  }
}