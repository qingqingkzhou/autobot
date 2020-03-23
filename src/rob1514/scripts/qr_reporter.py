#!/usr/bin/env python
from __future__ import print_function

import roslib
import sys
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import numpy as np
from pyzbar import pyzbar

class image_converter:

  def __init__(self):
    self.bridge = CvBridge()
    self.image_sub = rospy.Subscriber("/head_camera/image_raw", Image, self.callback)
    self.pub = rospy.Publisher('qr_word', String, queue_size = 100)
    self.word_array = []

  def callback(self,data):
    try:
      cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
    except CvBridgeError as e:
      print(e)

    cv2.imshow("Image window", cv_image)

    decodedObjects = pyzbar.decode(cv_image)
    for obj in decodedObjects:
        qr_word = str(obj.data)
        if qr_word not in self.word_array:
            self.word_array.append(qr_word)
            print("[QR Reporter] => ", self.word_array, "\n")
            self.pub.publish(', '.join(self.word_array))

    cv2.waitKey(3)

def main(args):

    print("[QR Reporter] Launched...\n")
    rospy.init_node('qr_reporter', anonymous = True)
    ic = image_converter()
    
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("[QR Reporter] shutting down\n")
    
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)