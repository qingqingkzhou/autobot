autobot (UofT ROB1514 Project)
============

## Navigation:

- Use ROS Navigation Stack as base to feed commands to move_base
- Localization uses particle filter implemented in amcl
- Navigation is built based on actionlib.SimpleActionClient("move_base", MoveBaseAction)
- Global planner is a list of predefined waypoints in json format. All the points will feed into navigate_to_point in order. Therefore, the robot will move along a series of mid-destinations and eventually reach the final goal
- A list of waypoints provided separately and used by point_feeder.py. Waypoints are stored in robo1514/launch/waypoints.json

**Running on robot notebook:**

```
$ rosrun rob1514 navigate_to_point.py
```

Once the navigate_to_point service server boot up and ready to accept points, run below:

```
$ roslaunch rob1514 global_planner.launch
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
