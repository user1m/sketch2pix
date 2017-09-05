
# coding: utf-8


# python DrawSketches.py  (1)path/to/target (2)path/for/sketch-ouput

# In[1]:
import cv2 as cv
import numpy as np
import os
import sys
#import matplotlib.pyplot as plt
import matplotlib
matplotlib.use('TkAgg')
from matplotlib import pyplot as plt
plt.interactive('True')

from scipy.misc import imresize

m = 200
n = 200
DIR_PATH = sys.argv[1]  # 'pdata'  # photo directory
SKETCH_PATH = sys.argv[2]  # 'sdata'  # sketch directory
# change from directory to just file path if you don't have to make data
# set but need to create sketch for prediction.
for file in os.listdir(DIR_PATH):
    file_path = os.path.join(DIR_PATH, file)
    img = cv.imread(file_path)
    write_path = os.path.join(SKETCH_PATH, file)
    img = cv.cvtColor(img, cv.COLOR_BGR2RGB)
    height, width, channels = img.shape
    if (height, width, channels) != (m, n, 3):
        img = imresize(img, (m, n, 3))
    img_gray = cv.cvtColor(img, cv.COLOR_RGB2GRAY)
    img_blur = cv.GaussianBlur(img_gray, (21, 21), 0, 0)
    img_blend = cv.divide(img_gray, img_blur, scale=256)
    sketch = cv.cvtColor(img_blend, cv.COLOR_GRAY2RGB)
    write_path = os.path.join(SKETCH_PATH, file)
    cv.imwrite(write_path, sketch)


# In[ ]:
