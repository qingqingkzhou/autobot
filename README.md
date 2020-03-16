autobot (UofT ROB1514 Project)
============

This project is to run turtlebot using ROS on a prebuilt .pgm map autonomous. Explore all the areas in the map to find QR code and then scan/decode the QR code. At the end, come back to the charging station and perform autodock, speak all the words in a meaningful sentence.


## Running whole project using launch file:

**Running on robot notebook:**

1. Source `rob1514` package

```
$ source ~/autobot/devel/setup.bash
```

2. Run basic turtlebot bringup, navigation stack and amcl with the prebuilt pgm map

```
$ roslaunch rob1514 turtlebot_nav_basic.launch
```

3. Run autobot rob1514 nodes

```
$ roslaunch rob1514 autobot.launch
```


## Flow Control:

- `timer.py` is used to control the whole process with regard to time
- `timer.py` subscribes to `nav_result` and `qr_word` topics in order to receive the decoded QR code and navigation result from navigate_to_point
- `timer.py` takes 3 arguments: mode, return time and speak time. `mode` can be 'normal' or 'fake' ('fake' is used to run simulation with fake data). `return time` is an integer in second to specify the maximum time allowed before going to the return trip. `speak time` is used to specifiy the maximum time allowed to speak the sentence.

**Running on robot notebook:**

Below is an example with return time as 30 seconds and speak time as 40 seconds. It's running in normal mode.

```
$ rosrun rob1514 timer.py 'normal-30-40'
```


## Navigation:

- Use ROS Navigation Stack as base to feed commands to move_base
- Localization uses particle filter implemented in amcl
- Navigation is built based on actionlib.SimpleActionClient("move_base", MoveBaseAction)
- Global planner is a list of predefined waypoints in json format. All the points will feed into navigate_to_point in order. Therefore, the robot will move along a series of mid-destinations and eventually reach the final goal
- A list of waypoints provided separately and used by point_feeder.py. Waypoints are stored in robo1514/launch/waypoints.json

**Running on robot notebook:**

`navigate_to_point.py` runs as a action server and takes a goal and send to navigation stack.

```
$ rosrun rob1514 navigate_to_point.py
```

`point_feeder.py` reads all the waypoints from a json file and send these waypoints one by one in order to `navigate_to_point.py`. `point_feeder.py` also takes an argument for initial delay. As soon as all the waypoints have been completed, a "GotoDock" message will be published. Once the navigate_to_point service server boot up and ready to accept points, run below (120 is the initial delay in seconds. in this case, point_feeder will wait for 120 seconds at the beginning before sending the waypoints):

```
$ rosrun rob1514 point_feeder.py 'path_to_json_file' 120
```


## Auto-docking:

- `activate_autodock.py` is used to active auto-docking process
- `activate_autodock.py` subscribes to `nav_result`. As soon as "GotoDock" message is received from point_feeder.py, the autodock will be activated.

**Running on robot notebook:**

```
$ rosrun rob1514 activate_autodock
```


## QR code scan, decode and form meaningful sentence procedure:

**Running on robot notebook:**
- Option 1: using launch file: it will launch two QR reporter. One uses notebook's camera and the other uses astra camera from the robot base. With two cameras, we increaase the possiblility of scanning QR code. But it might affect the performance of navigation and localization. 

```
$ roslaunch rob1514 qr_sentence.launch
```

- Option 2: run nodes individually:

1. A node `qr_reporter` will publish scanned-decoded word onto topic `qr_word` every 1 second with all the currently collected words. Message format: `word1, word2, word3, ...`. 

Reporter accepts two mode: normal, fake. In `normal` mode, reporter uses physical interface for camera and speaker. In `fake` mode, no camera or speaker involved and it's used for communication logic testing only.

```
$ rosrun rob1514 qr0_reporter.py 'normal' --screen
$ rosrun rob1514 qr1_reporter.py 'fake' --screen
```


2. A node `speaker` will listen on the topic `sentence` for the correct sentence to speak. This node will use text to speech python package `pyttsx3` and audio card to speak out the sentence. Message format (std_msgs/String): `The meaningful sentence is here`

```
$ rosrun rob1514 speaker.py
```


**Running on remote workstation:**

3. Display current published messages on the topic `qr_word`

```
$ rostopic echo /qr_word
```


4. (manual task) Manually look at all the qr_word and come up with a meaningful sentence.



5. Send the meaningful sentence back to the robot on the topic `sentence`
```
$ rostopic pub sentence std_msgs/String "The meaningful sentence is here"
```
