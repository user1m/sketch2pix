import sys
import cv2 as cv
import numpy as np
import os
from filters import PencilSketch

m = 300
n = 300
DIR_PATH = sys.argv[1]
FACE_PATH = sys.argv[2]
SKETCH_PATH = sys.argv[3]

for file in os.listdir(DIR_PATH):
    file_path = os.path.join(DIR_PATH, file)
    img = cv.imread(file_path)
    img = cv.resize(img, (m, n))
    cv.imwrite(os.path.join(FACE_PATH, file), img)
    
    img = cv.cvtColor(img, cv.COLOR_BGR2RGB)
    height, width, channels = img.shape
#    if (height, width, channels) != (m, n, 3):
#	    img = cv.resize(img, (m, n))
#	    img = np.resize(img, (m, n, 3))
    pencil = PencilSketch(width, height)
    sketch = pencil.render(img)
    write_path = os.path.join(SKETCH_PATH, file)
    cv.imwrite(write_path, sketch)
    
