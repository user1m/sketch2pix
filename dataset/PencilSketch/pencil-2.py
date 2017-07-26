import cv2
import sys
import numpy as np

m = 300
n = 300

def dodgeV2(image, mask):
  return cv2.divide(image, 255-mask, scale=256)


def burnV2(image, mask):
  return 255 - cv2.divide(255-image, 255-mask, scale=256)


img = cv2.imread(sys.argv[1])
img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
height, width = img.shape

if (height, width) != (m, n):
	img = cv2.resize(img, (m, n))

img_gray_inv = 255 - img
img_blur = cv2.GaussianBlur(img_gray_inv, ksize=(21, 21),
                            sigmaX=0, sigmaY=0)

img_blend = dodgeV2(img, img_blur)
#cv2.imshow("pencil sketch", img_blend)

#img_canvas = cv2.imread(sys.argv[2])
#img_canvas = cv2.cvtColor(img_canvas, cv2.COLOR_BGR2GRAY)
#img_blend = cv2.multiply(img_blend, img_canvas, scale=1/256)

cv2.imwrite(sys.argv[3], img_blend)
