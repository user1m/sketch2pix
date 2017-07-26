import sys
import cv2 as cv
import numpy as np
import os

m = 300
n = 300
DIR_PATH = sys.argv[1]
SKETCH_PATH = sys.argv[2]

for file in os.listdir(DIR_PATH):
    file_path = os.path.join(DIR_PATH, file)
    img = cv.imread(file_path)
    img = cv.cvtColor(img, cv.COLOR_BGR2RGB)
    height, width, channels = img.shape
    if (height, width, channels) != (m, n, 3):
	    img = cv.resize(img, (m, n))
    sketch_gray, sketch_color = cv.pencilSketch(img, sigma_s=60, sigma_r=0.07, shade_factor=0.05)
    write_path = os.path.join(SKETCH_PATH, file)
    cv.imwrite(write_path, sketch_gray)
    
