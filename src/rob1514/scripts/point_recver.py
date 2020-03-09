#!/usr/bin/env python

from rob1514.srv import NavPoint
import rospy

def handle_nav_to_point(req):
    print "Nav to (%s, %s)" % (req.x, req.y)
    return "Success"

def nav_to_point_server():
    rospy.init_node('nav_to_point_server')
    s = rospy.Service('nav_to_point', NavPoint, handle_nav_to_point)
    print "Ready to receive waypoint"
    rospy.spin()

if __name__ == "__main__":
    nav_to_point_server()
