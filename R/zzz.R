read_data <- NULL
raster_align <- NULL
raster_trim <- NULL
make_cube <- NULL
#plot_cube <- NULL
options("install.lock"=FALSE)

.onLoad <- function(libname, pkgname) {
  options("install.lock"=FALSE)

  use_condaenv(condaenv = "r-reticulate", conda = "auto", required = TRUE)
  
  read_d <- reticulate::import_from_path(module = "readData", system.file("python", "input", package = "spacetime", mustWork = TRUE))
  raster_a <- reticulate::import_from_path(module = "rasterAlign", system.file("python", "scale", package = "spacetime", mustWork = TRUE))
  raster_t <- reticulate::import_from_path(module = "rasterTrim", system.file("python", "scale", package = "spacetime", mustWork = TRUE))
  make_c <- reticulate::import_from_path(module = "makeCube", system.file("python", "operations", package = "spacetime", mustWork = TRUE))
#  data_p <- reticulate::import_from_path(module = "dataPlot", system.file("python", "graphics", package = "spacetime", mustWork = TRUE))
  
  read_data <<- read_d$read_data
  raster_align <<- raster_a$raster_align
  raster_trim <<- raster_t$raster_trim
  make_cube <<- make_c$make_cube
#  plot_cube <<- data_p$make_cube
}
  
