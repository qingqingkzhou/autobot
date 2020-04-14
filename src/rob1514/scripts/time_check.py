#!/usr/bin/env python

import sys
import rospy
from std_msgs.msg import String
from google import google
import string

g_sentence = ""
g_current_waypoint = 0
g_exit = False

def speak(sentence):
    rospy.loginfo('[time_check] Say: %s', sentence)


def words_callback(data):
    num_words = len(data.data.split(', '))
    global g_sentence
    g_sentence = data.data
    
    rospy.loginfo('[QR] received words-->[%d] %s', num_words, g_sentence)


def time_checkpoint(counter, return_time, finish_time):
    # invoked every 1 minute
    #rospy.loginfo('Timer called at %d minutes', counter)
    if counter == return_time:
        rospy.loginfo('[time_check] Return Time ---> %d minutes', counter)
        rospy.loginfo('[time_check] Current waypoint %d', g_current_waypoint)
        
    #elif counter == finish_time:
        # speak(g_sentence)
    
    else:
        rospy.loginfo('[time_check] Running for %d minutes', counter)


def get_search_result(words, num_page):

    rospy.loginfo('[Google] search string: %s', words)

    search_results = google.search(words, num_page)
    results = []
    for result in search_results:
        #print(result.description)
        results.append(result.description.encode('utf-8').strip())

    return results

def contain_all_words(words, doc_str):
    for word in words:
        if word not in doc_str:
            return False

    return True

def contain_any_word(words, doc_str):
    for word in words:
        if word in doc_str:
            return True

    return False    

def get_sentence(words):
    sentence = []
    results = get_search_result(words, 3)
    check_words = words.split(', ')
    #print(check_words)

    # extract only valid results from google search results
    valid_results = [r for r in results if contain_all_words(check_words, r)]
    
    for r in valid_results:
        rospy.loginfo('[Google] %s', r)
        r_array = r.split()
        valid_words = [e for e in r_array if contain_any_word(check_words, e)]
        if len(valid_words) == len(check_words):
            for valid_word in valid_words:
                for check_word in check_words:
                    if check_word in valid_word:
                        start = valid_word.find(check_word)
                        if start > 0:
                            valid_word = valid_word[start:]
            
            sentence = ' '.join(valid_words)

            return sentence

def nav_callback(data):
    global g_current_waypoint
    global g_exit
    
    rospy.loginfo('[Nav] nav_result = %s', data.data)
    
    if 'id' in data.data: 
        g_current_waypoint = int(data.data.split('-')[1])
        rospy.loginfo('[Nav] Moved to waypoint %d', g_current_waypoint)
        
    elif data.data == 'GotoDock':    
        # rospy.loginfo('[Nav] Final stage --> display and speak the sentence')
        # speak(g_sentence)
        
        # autodocking will be activated by activate_autodock.py upon receiving 'GotoDock'
        rospy.loginfo('[Nav] Final stage --> start auto docking (not performed in simulation)')
        rospy.loginfo('[time_check] Sentence: %s', get_sentence(g_sentence))
        rospy.loginfo('[time_check] Process completed')

        g_exit = True
        
    else:
        rospy.loginfo('[Nav] unknown nav_result')


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
        
        if g_exit:
            break

        # sleep for 1 minutes
        rospy.sleep(60.)

        time_checkpoint(counter, return_time, finish_time)
        counter += 1
        
    rospy.loginfo('[time_check] Exit')
    #rospy.loginfo('[time_check] Sentence: %s', get_sentence(g_sentence))
    