get_array <- NULL
read_data <- NULL
file_object <- NULL
#raster_align <- NULL
#raster_trim <- NULL
#make_cube <- NULL

.onLoad <- function(libname, pkgname) {

  use_condaenv(condaenv = "r-reticulate", conda = "auto", required = TRUE)
  
  the_mod <- reticulate::import_from_path(module = "spacetimetest", system.file("python", "input", package = "spacetime", mustWork = TRUE))
  read_d <- reticulate::import_from_path(module = "readData", system.file("python", "input", package = "spacetime", mustWork = TRUE))
  file_o <- reticulate::import_from_path(module = "fileObject", system.file("python", "objects", package = "spacetime", mustWork = TRUE))
  #raster_a <- reticulate::import_from_path(module = "rasterAlign", system.file("python", "scale", package = "spacetime", mustWork = TRUE))
  #raster_t <- reticulate::import_from_path(module = "rasterTrim", system.file("python", "scale", package = "spacetime", mustWork = TRUE))
  #make_c <- reticulate::import_from_path(module = "makeCube", system.file("python", "operations", package = "spacetime", mustWork = TRUE))
  
  get_array <- the_mod$get_array
  read_data <- read_d$read_data
  file_object <- file_o$file_object
  #raster_align <<- raster_a$raster_align
  #raster_trim <<- raster_t$raster_trim
  #make_cube <<- make_c$make_cube
}
  
