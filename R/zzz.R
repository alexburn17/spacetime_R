.onLoad <- function(libname, pkgname) {
  
  library(reticulate)
  use_condaenv(condaenv = "r-reticulate", conda = "auto", required = TRUE)
  
  print("it ran")
  
  # source modules
  source_python("spacetime/input/test.py", convert = F)
  source_python("spacetime/input/readData.py", convert = F)
  source_python("spacetime/scale/rasterAlign.py", convert = F)
  source_python("spacetime/scale/rasterTrim.py", convert = F) 
  source_python("spacetime/objects/fileObject.py", convert = F) 
  source_python("spacetime/operations/cubeSmasher.py", convert = F)
  source_python("spacetime/operations/makeCube.py", convert = F) 
  source_python("spacetime/operations/loadCube.py", convert = F) 
  source_python("spacetime/graphics/dataPlot.py", convert = F) 
  source_python("spacetime/output/writeCSV.py", convert = F) 
  source_python("spacetime/operations/time.py", convert = F)
  source_python("spacetime/operations/cubeToDataframe.py", convert = F)

  
}