#!/usr/bin/env python

import json
import rospy
from std_msgs.msg import String
from rob1514.srv import *

def nav_to_point_client(x, y, r0, r1, r2, r3):
    rospy.wait_for_service('nav_to_point')
    try:
        nav_to_point = rospy.ServiceProxy('nav_to_point', NavPoint)
        resp = nav_to_point(x, y, r0, r1, r2, r3)
        return resp.status
    except rospy.ServiceException, e:
        rospy.loginfo('nav_to_point service call failed: %s', e)


def load_waypoints(file):
    rospy.loginfo('Load waypoints from %s', file)

    with open(file) as json_file:
    	data = json.load(json_file)
    	for p in data['points']:
	    x = p['x']
	    y = p['y']
	    r0 = p['r0']
	    r1 = p['r1']
	    r2 = p['r2']
	    r3 = p['r3']
	    rospy.loginfo('Goto (%s, %s) (%s, %s, %s, %s) => %s', x, y, r0, r1, r2, r3,  nav_to_point_client(x, y, r0, r1, r2, r3))


if __name__ == "__main__":
    
    if len(sys.argv) >= 2:
	rospy.init_node('point_feeder')
	
	try:
            load_waypoints(str(sys.argv[1]))
	except rospy.ROSInterruptException:
	    rospy.loginfo('node shutdown')	
    else:
	print("point_feeder: Please provide a json file of waypoints in order!")

