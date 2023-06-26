from osgeo import gdal
import os
import pathlib


def read_data(dataList=None):
  
    y = pathlib.Path(__file__).parent.parent.resolve()
    os.chdir(y)
    from objects.fileObject import file_object

    fileData = []
    fileSize = []

    for i in range(len(dataList)):

        fileData.append(gdal.Open(dataList[i]))

        fileSize.append(os.path.getsize(dataList[i]) * 0.000001)

    ds = file_object(fileData, fileSize)

    return ds
