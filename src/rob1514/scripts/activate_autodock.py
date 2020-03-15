#!/usr/bin/env python

import roslib; roslib.load_manifest('kobuki_auto_docking')
import rospy
from std_msgs.msg import String

import actionlib
from kobuki_msgs.msg import AutoDockingAction, AutoDockingGoal
from actionlib_msgs.msg import GoalStatus

autodock_activate = False

def doneCb(status, result):
    if 0: print ''
    elif status == GoalStatus.PENDING   : state='PENDING'
    elif status == GoalStatus.ACTIVE    : state='ACTIVE'
    elif status == GoalStatus.PREEMPTED : state='PREEMPTED'
    elif status == GoalStatus.SUCCEEDED : state='SUCCEEDED'
    elif status == GoalStatus.ABORTED   : state='ABORTED'
    elif status == GoalStatus.REJECTED  : state='REJECTED'
    elif status == GoalStatus.PREEMPTING: state='PREEMPTING'
    elif status == GoalStatus.RECALLING : state='RECALLING'
    elif status == GoalStatus.RECALLED  : state='RECALLED'
    elif status == GoalStatus.LOST      : state='LOST'
    
    # Print state of action server
    print 'Result - [ActionServer: ' + state + ']: ' + result.text

def activeCb():
    if 0: print 'Action server went active.'

def feedbackCb(feedback):
    # Print state of dock_drive module (or node.)
    print 'Feedback: [DockDrive: ' + feedback.state + ']: ' + feedback.text

def dock_drive_client():
    # add timeout setting
    client = actionlib.SimpleActionClient('dock_drive_action', AutoDockingAction)
    while not client.wait_for_server(rospy.Duration(5.0)):
        if rospy.is_shutdown(): return
        print 'Action server is not connected yet. still waiting...'
    
    goal = AutoDockingGoal()
    client.send_goal(goal, doneCb, activeCb, feedbackCb)
    print 'Goal: Sent.'
    rospy.on_shutdown(client.cancel_goal)
    client.wait_for_result()
    #print '    - status:', client.get_goal_status_text()
    return client.get_result()

def nav_callback(data):
    global autodock_activate
    
    rospy.loginfo('activate_autodock: nav_result = %s', data.data)
    
    if data.data == 'GotoDock':    
        rospy.loginfo('activate_autodock: start auto docking')
        autodock_activate = True

if __name__ == '__main__':
    
    exit_flag = False
    
    try:
        rospy.init_node('dock_drive_client_py', anonymous=True)
        
        rospy.Subscriber('nav_result', String, nav_callback)
        
        rospy.loginfo('activate_autodock: waiting on activation signal')
        while autodock_activate == False:
            if rospy.is_shutdown():
                exit_flag = True
                break
            rospy.sleep(1.)

        if exit_flag == False:
            dock_drive_client()
        #print ''
        #print "Result: ", result
    except rospy.ROSInterruptException:
        print "program interrupted before completion"
