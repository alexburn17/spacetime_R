

def get_array():
  import numpy as np
  import os
  
  import pathlib
  x = pathlib.Path(__file__).parent.parent.resolve()
  
  print(x + "/input/readData.py")

  
  
  #x = np.array([1, 2, 3, 4])
  #x = os.getcwdb()
  
  return(x)


