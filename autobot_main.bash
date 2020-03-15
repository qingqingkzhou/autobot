#!/bin/bash

# set up environment
source ~/autobot/devel/setup.bash

# 1. launch turtlebot bringup
roslaunch turtlebot_bringup minimal.launch &
sleep 20

# 2. launch amcl with map
roslaunch turtlebot_navigation amcl_demo.launch map_file:=/home/turtlebot/autobot/maps/UTIAS-2.pgm &
sleep 20

# 3. launch rviz (optional)
roslaunch turtlebot_rviz_launchers view_navigation.launch --screen &
sleep 20

# 4. launch nav to a point
#rosrun rob1514 navigate_to_point.py &
#sleep 20

# 5. launch waypoint feeder
#roslaunch rob1514 global_planner.launch &
#sleep 20

echo "Autobot is ready to go!"

