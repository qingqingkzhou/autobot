#!/usr/bin/env python
# Software License Agreement (BSD License)
# 
# Copyright (c) 2008, Willow Garage, Inc.
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.
#  * Neither the name of Willow Garage, Inc. nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
# 

import sys
import rospy
from std_msgs.msg import String

import cv2
import numpy as np
from pyzbar import pyzbar


def scan_qr_code(word_array):
    cap = cv2.VideoCapture(0)
    
    while True:
        _, frame = cap.read()
        decodedObjects = pyzbar.decode(frame)
        
        if decodedObjects:
            for obj in decodedObjects:
                qr_word = str(obj.data)
                if qr_word not in word_array:
                    word_array.append(qr_word)
            
            return word_array

def scan_qr_code_fake(word_array, n):
    
    decodedObjects = ["qrcode" + str(n)]
        
    if decodedObjects:
        for obj in decodedObjects:
            qr_word = str(obj)
            if qr_word not in word_array:
                word_array.append(qr_word)
            
        return word_array

def reporter(mode):
    '''
    topic: qr_word
    message type: String
    node name: qr_reporter
    anonymous = True ensures that your node has a unique name by adding random numbers to the end of NAME
    '''
    pub = rospy.Publisher('qr_word', String, queue_size = 10)
    rospy.init_node('qr_reporter', anonymous = True)
    rospy.loginfo('qr_reporter node running in %s mode', mode)
    
    rate = rospy.Rate(1) # 1hz

    word_array = []
    counter = 0
    while not rospy.is_shutdown():
        if mode == 'normal':
            if scan_qr_code(word_array):
                pub.publish(', '.join(word_array))
        else:
            counter += 1
            if scan_qr_code_fake(word_array, counter):
                pub.publish(', '.join(word_array))

        rate.sleep()
        
        
if __name__ == '__main__':
    mode = 'normal'
    
    if len(sys.argv):
        mode = str(sys.argv[1])

    try:
        reporter(mode)
    except rospy.ROSInterruptException:
        pass
