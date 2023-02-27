#load the reticulate package  
library(reticulate)

setwd("~/Documents/GitHub/spacetime_R")

# activate environment
use_condaenv(condaenv = "barra_python", conda = "auto", required = FALSE)

# source modules
source_python("spacetime/input/readData.py", convert = TRUE)
source_python("spacetime/scale/rasterAlign.py", convert = TRUE)
source_python("spacetime/scale/rasterTrim.py", convert = TRUE) 
source_python("spacetime/objects/fileObject.py", convert = TRUE) 
source_python("spacetime/operations/cubeSmasher.py", convert = TRUE)
source_python("spacetime/operations/makeCube.py", convert = TRUE) 
source_python("spacetime/operations/loadCube.py", convert = TRUE) 
source_python("spacetime/graphics/dataPlot.py", convert = TRUE) 
source_python("spacetime/output/writeCSV.py", convert = TRUE) 
source_python("spacetime/operations/time.py", convert = TRUE)
source_python("spacetime/operations/cubeToDataframe.py", convert = TRUE)
########################################################################################################################

# Begin R script
########################################################################################################################

# get tif files from CpCM folder
dataPaths <- list.files(path="CpCM", pattern="*.tif", full.names=TRUE, recursive=FALSE)

# read in data
ds = read_data(dataPaths)

# align rasters
newObj = raster_align(data=ds, noneVal = -9999, SRS=4326)

# trim the rasters to the same greatest common bounding box
trimmed = raster_trim(newObj)

# make the aligned file object into a cube with a time element (writes the new file to disk)
cube = make_cube(data = trimmed, fileName = "cpcm.nc4", organizeFiles = "filestotime", organizeBands = "bandstotime")



x <- trimmed$get_data_array()

array(x)


matrix(x[[1]])










