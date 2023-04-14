library(reticulate)

# python packages to install
dependancies <- c("pandas", "numpy")



py_install(
  packages = dependancies,
  method = "conda",
  conda = "auto",
  python_version = "3.9.16",
  pip = TRUE
)

print("installing required python packages")
conda_install("r-reticulate", "gdal")
conda_install("r-reticulate", "xarray")
conda_install("r-reticulate", "psutil")
conda_install("r-reticulate", "plotly_express")
conda_install("r-reticulate", "netCDF4")



