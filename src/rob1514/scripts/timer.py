#!/usr/bin/env python

import sys
import rospy
from std_msgs.msg import String
import pyttsx3

g_sentence = ""
g_current_waypoint = 0
  
def speak(sentence, mode):
    rospy.loginfo('time_check: Say: %s', sentence)

    if mode == 'normal':
        # tts says the sentence
        engine = pyttsx3.init()
        engine.say(data.data)
        engine.runAndWait()


def words_callback(data, mode):
    num_words = len(data.data.split())
    global g_sentence
    g_sentence = data.data
    
    if mode == 'normal':
        rospy.loginfo('time_check: received QR words-->[%d] %s', num_words, g_sentence)
    elif num_words < 10:
        rospy.loginfo('time_check: received QR words-->[%d] %s', num_words, g_sentence)


def nav_callback(data, mode):
    global g_current_waypoint
    
    rospy.loginfo('time_check: nav_result = %s', data.data)
    
    if 'id' in data.data: 
        g_current_waypoint = int(data.data.split('-')[1])
        rospy.loginfo('time_check: Moved to waypoint %d', g_current_waypoint)
        
    elif data.data == 'GotoDock':    
        rospy.loginfo('time_check: Final stage --> display and speak the sentence')
        speak(g_sentence, mode)
        
        # autodocking will be activated by activate_autodock.py upon receiving 'GotoDock'
        rospy.loginfo('time_check: Final stage --> start auto docking')
        
    else:
        rospy.loginfo('time_check: unknown nav_result')

            

def time_checkpoint(counter, return_time, speak_time):
    # invoked every 1 minute
    #rospy.loginfo('Timer called at %d minutes', counter)

    if counter == return_time:
        rospy.loginfo('time_check: Return Time ---> %d minutes', counter)
        rospy.loginfo('time_check: Current waypoint %d', g_current_waypoint)
        
    elif counter == speak_time:
        rospy.loginfo('time_check: Speak Time ---> %d minutes', counter)
        speak(g_sentence, mode)


if __name__ == '__main__':
    
    counter = 1
    
    # in minutes
    return_time = 15
    speak_time = 25
    
    # running mode
    mode = 'normal'
    
    if len(sys.argv) > 1:
        args_str = str(sys.argv[1])
        args_list = args_str.split('-')
        mode = args_list[0]
        return_time = int(args_list[1])
        speak_time = int(args_list[2])
        
    rospy.init_node('time_check', anonymous=True)
    rospy.loginfo('time_check: running in %s mode', mode)
    
    rospy.Subscriber('qr_word', String, words_callback, mode)
    rospy.Subscriber('nav_result', String, nav_callback, mode)
    
    while not rospy.is_shutdown() and counter <= speak_time:
        
        # sleep for 1 minutes
        if mode == 'normal':
            rospy.sleep(60.)
        else:
            rospy.sleep(1.)
        
        time_checkpoint(counter, return_time, speak_time)
        counter += 1
        
    rospy.loginfo('time_check: Process completed')
    
    while not rospy.is_shutdown():
        rospy.spin()
        