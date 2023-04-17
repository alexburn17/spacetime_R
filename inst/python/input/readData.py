from inst.python.objects.fileObject import *
from osgeo import gdal
import os



def read_data(dataList=None):

    fileData = []
    fileSize = []

    for i in range(len(dataList)):

        fileData.append(gdal.Open(dataList[i]))


        fileSize.append(os.path.getsize(dataList[i]) * 0.000001)

    ds = file_object(fileData, fileSize)

    return ds
