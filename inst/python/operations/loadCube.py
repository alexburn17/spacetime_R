import netCDF4 as nc
import numpy as np
import pathlib
import os

def load_cube(file):
  
    y = pathlib.Path(__file__).parent.parent.resolve()
    os.chdir(y)
    from objects.cubeObject import cube
    from operations.time import cube_time, return_time

    # get data set
    ds = nc.Dataset(file)

    # get time
    if "units: seconds since" in str(ds.variables["time"]):
        time = return_time(ds.variables["time"])
    else:
        time = ds.variables["time"][:]

    # get var names
    vars = list(ds.variables.keys())
    matches = ['time', 'lat', 'lon', 'spatial_ref']
    varNames = list(set(vars)-set(matches))

    # get structure
    if len(varNames) > 1:
        struc = "filestovar"
    else:
        struc = "filestotime"

    fileSize = os.path.getsize(file) * 0.000001

    cube_ds = cube(ds, fileStruc = struc, names=varNames, timeObj=time, fileSize = fileSize)

    return cube_ds

    ds.close()
