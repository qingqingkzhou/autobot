#!/usr/bin/env python

import rospy
import cv2
import numpy as np
from pyzbar import pyzbar

image = cv2.imread("pysource_qrcode.png")


decodedObjects = pyzbar.decode(image)
for obj in decodedObjects:
    print("Type:", obj.type)
    print("Data: ", obj.data, "\n")

cv2.imshow("Frame", image)
cv2.waitKey(0)

