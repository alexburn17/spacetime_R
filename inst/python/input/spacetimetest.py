

def get_array():
  import numpy as np
  import os
  
  
  
  import pathlib
  y = pathlib.Path(__file__).parent.parent.resolve()
  
  os.chdir(y)
  
  #print(x + "/input/readData.py")

  
  
  #x = np.array([1, 2, 3, 4])
  x = os.getcwdb()
  
  return(x)


