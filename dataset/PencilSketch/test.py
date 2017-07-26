import sys
import cv2

#print(sys.argv[1])
#print(sys.argv[2])

bg_gray='pencilsketch_bg.jpg'
canvas = cv2.imread('/home/user1m/workspace/sketch2pix/dataset/PencilSketch/pencilsketch_bg.jpg', cv2.CV_8UC1)
if canvas is not None:
    print("BACKGROND EXISTS")
else:
    print("BACKGROND DOESN'T EXISTS")
