read_data <- NULL
raster_align <- NULL
raster_trim <- NULL
make_cube <- NULL
cube_smasher <- NULL
write_csv <- NULL
load_cube <- NULL
cube_time <- NULL
return_time <- NULL
select_time <- NULL
scale_time <- NULL
expand_time <- NULL

options("install.lock"=FALSE)

.onLoad <- function(libname, pkgname) {
  options("install.lock"=FALSE)

  use_condaenv(condaenv = "r-reticulate", conda = "auto", required = TRUE)
  
  read_d <- reticulate::import_from_path(module = "readData", system.file("python", "input", package = "spacetime", mustWork = TRUE))
  raster_a <- reticulate::import_from_path(module = "rasterAlign", system.file("python", "scale", package = "spacetime", mustWork = TRUE))
  raster_t <- reticulate::import_from_path(module = "rasterTrim", system.file("python", "scale", package = "spacetime", mustWork = TRUE))
  make_c <- reticulate::import_from_path(module = "makeCube", system.file("python", "operations", package = "spacetime", mustWork = TRUE))
  cube_s <- reticulate::import_from_path(module = "cubeSmasher", system.file("python", "operations", package = "spacetime", mustWork = TRUE))
  write_c <- reticulate::import_from_path(module = "writeCSV", system.file("python", "output", package = "spacetime", mustWork = TRUE))
  load_c <- reticulate::import_from_path(module = "loadCube", system.file("python", "operations", package = "spacetime", mustWork = TRUE))
  cube_t <- reticulate::import_from_path(module = "changeTime", system.file("python", "operations", package = "spacetime", mustWork = TRUE)) 
   
  read_data <<- read_d$read_data
  raster_align <<- raster_a$raster_align
  raster_trim <<- raster_t$raster_trim
  make_cube <<- make_c$make_cube
  cube_smasher <<- cube_s$cube_smasher
  write_csv <<- write_c$write_csv
  load_cube <<- load_c$load_cube
  cube_time <<- cube_t$cube_time
  return_time <<- cube_t$return_time
  select_time <<- cube_t$select_time
  scale_time <<- cube_tscale_time
  expand_time <<- cube_t$expand_time
}
  
