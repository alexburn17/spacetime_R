read_data <- NULL
raster_align <- NULL
raster_trim <- NULL
make_cube <- NULL
cube_smasher <- NULL
options("install.lock"=FALSE)

.onLoad <- function(libname, pkgname) {
  options("install.lock"=FALSE)

  use_condaenv(condaenv = "r-reticulate", conda = "auto", required = TRUE)
  
  read_d <- reticulate::import_from_path(module = "readData", system.file("python", "input", package = "spacetime", mustWork = TRUE))
  raster_a <- reticulate::import_from_path(module = "rasterAlign", system.file("python", "scale", package = "spacetime", mustWork = TRUE))
  raster_t <- reticulate::import_from_path(module = "rasterTrim", system.file("python", "scale", package = "spacetime", mustWork = TRUE))
  make_c <- reticulate::import_from_path(module = "makeCube", system.file("python", "operations", package = "spacetime", mustWork = TRUE))
  cube_s <- reticulate::import_from_path(module = "cubeSmasher", system.file("python", "operations", package = "spacetime", mustWork = TRUE))
  
  read_data <<- read_d$read_data
  raster_align <<- raster_a$raster_align
  raster_trim <<- raster_t$raster_trim
  make_cube <<- make_c$make_cube
  cube_smasher <<- cube_s$cube_smasher
}
  
