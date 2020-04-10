#!/usr/bin/env python

import sys
import rospy
from std_msgs.msg import String

g_sentence = ""
g_current_waypoint = 0
  
def speak(sentence):
    rospy.loginfo('[time_check] Say: %s', sentence)


def words_callback(data):
    num_words = len(data.data.split())
    global g_sentence
    g_sentence = data.data
    
    rospy.loginfo('[time_check] received QR words-->[%d] %s', num_words, g_sentence)


def nav_callback(data):
    global g_current_waypoint
    
    rospy.loginfo('[time_check] nav_result = %s', data.data)
    
    if 'id' in data.data: 
        g_current_waypoint = int(data.data.split('-')[1])
        rospy.loginfo('[time_check] Moved to waypoint %d', g_current_waypoint)
        
    elif data.data == 'GotoDock':    
        rospy.loginfo('[time_check] Final stage --> display and speak the sentence')
        speak(g_sentence)
        
        # autodocking will be activated by activate_autodock.py upon receiving 'GotoDock'
        rospy.loginfo('[time_check] Final stage --> start auto docking (not performed in simulation)')
        
    else:
        rospy.loginfo('[time_check] unknown nav_result')

            

def time_checkpoint(counter, return_time, finish_time):
    # invoked every 1 minute
    #rospy.loginfo('Timer called at %d minutes', counter)

    if counter == return_time:
        rospy.loginfo('[time_check] Return Time ---> %d minutes', counter)
        rospy.loginfo('[time_check] Current waypoint %d', g_current_waypoint)
        
    elif counter == finish_time:
        rospy.loginfo('[time_check] Finish Time ---> %d minutes', counter)
        speak(g_sentence)


if __name__ == '__main__':
    
    counter = 1
    
    # in minutes
    return_time = 10
    finish_time = 20

    if len(sys.argv) > 2:
        return_time = int(sys.argv[1])
        finish_time = int(sys.argv[2])
        
    rospy.init_node('time_check', anonymous=True)
    rospy.loginfo('[time_check] Start ... [return_time: %dmin] [finish_time: %dmin]', return_time, finish_time)
    
    rospy.Subscriber('qr_word', String, words_callback)
    rospy.Subscriber('nav_result', String, nav_callback)
    
    while not rospy.is_shutdown() and counter <= finish_time:
        
        # sleep for 1 minutes
        rospy.sleep(60.)

        time_checkpoint(counter, return_time, finish_time)
        counter += 1
        
    rospy.loginfo('[time_check] Process completed')
    rospy.loginfo('[time_check] Sentence: %s', g_sentence)

    while not rospy.is_shutdown():
        rospy.spin()
        