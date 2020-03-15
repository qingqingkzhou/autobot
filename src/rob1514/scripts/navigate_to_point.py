#!/usr/bin/env python

# TurtleBot must have minimal.launch & amcl_demo.launch
# running prior to starting this script
# For simulation: launch gazebo world & amcl_demo prior to run this script

import rospy
import json
from std_msgs.msg import String
from rob1514.srv import NavPoint
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
import actionlib
from actionlib_msgs.msg import *
from geometry_msgs.msg import Pose, Point, Quaternion

g_mode = 'normal'

class GoToPose():
    def __init__(self):

        self.goal_sent = False
        
        # What to do if shut down (e.g. Ctrl-C or failure)
        rospy.on_shutdown(self.shutdown)
        
        # Tell the action client that we want to spin a thread by default
        self.move_base = actionlib.SimpleActionClient("move_base", MoveBaseAction)
        rospy.loginfo("Wait for the action server to come up")
        
        # Allow up to 5 seconds for the action server to come up
        self.move_base.wait_for_server(rospy.Duration(5))
        
    def goto(self, pos, quat):
        
        # Send a goal
        self.goal_sent = True
        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = 'map'
        goal.target_pose.header.stamp = rospy.Time.now()
        goal.target_pose.pose = Pose(Point(pos['x'], pos['y'], 0.000),
                                     Quaternion(quat['r1'], quat['r2'], quat['r3'], quat['r4']))
        
        # Start moving
        self.move_base.send_goal(goal)
        
        # Allow TurtleBot up to 60 seconds to complete task
        success = self.move_base.wait_for_result(rospy.Duration(60))
        
        state = self.move_base.get_state()
        result = False

        if success and state == GoalStatus.SUCCEEDED:
            # We made it!
            result = True
        else:
            self.move_base.cancel_goal()

        self.goal_sent = False
        return result

    def shutdown(self):
        if self.goal_sent:
            self.move_base.cancel_goal()
        rospy.loginfo("Stop")
        rospy.sleep(1)


def handle_nav_to_point(req):
    rospy.loginfo("Going to (%s, %s) (%s, %s, %s, %s) pose", req.x, req.y, req.r0, req.r1, req.r2, req.r3)

    if g_mode == 'fake':
        rospy.sleep(1.)
        return "Succeed"
    
    try:
        navigator = GoToPose()	

        # Customize the following values so they are appropriate for your location
        #position = {'x': 3.33, 'y' : -0.547}
        #quaternion = {'r1' : 0.000, 'r2' : 0.000, 'r3' : 0.000, 'r4' : 1.000}

        #position = {'x': 5.65, 'y' : -0.684}
        #quaternion = {'r1' : 0.000, 'r2' : 0.000, 'r3' : 0.000, 'r4' : 1.000}

        position = {'x': req.x, 'y' : req.y}
        quaternion = {'r1' : req.r0, 'r2' : req.r1, 'r3' : req.r2, 'r4' : req.r3}

        success = navigator.goto(position, quaternion)
        
        if success:
            return "Succeed"
        else:
            return "Failed"

    except rospy.ROSInterruptException:
        rospy.loginfo("Ctrl-C caught. Quitting")

    return "Canceled"


def nav_to_point_server(mode):
    global g_mode
    g_mode = mode
    
    rospy.Service('nav_to_point', NavPoint, handle_nav_to_point)
    rospy.loginfo('Ready to receive waypoint')
    rospy.spin()


if __name__ == '__main__':
    
    mode = 'normal'
    if len(sys.argv) > 1:
        mode = str(sys.argv[1])
    
    rospy.init_node('nav_to_point_server', anonymous=False)
    rospy.loginfo('nav_to_point: running in %s mode', mode)
    
    nav_to_point_server(mode)
    
