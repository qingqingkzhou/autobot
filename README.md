autobot (UofT ROB1514 Project)
============

## QR code scan, decode and form meaningful sentence procedure:

**Running on robot notebook:**

1. A node `qr_scan_reporter` will publish scanned-decoded word onto topic `qr_word` every 1 second with all the currently collected words. Message format: `word1, word2, word3, ...`

```
$ qr_scan_reporter.py
```


2. A node `speaker` will listen on the topic `sentence` for the correct sentence to speak. This node will use text to speech python package `pyttsx3` and audio card to speak out the sentence. Message format (std_msgs/String): `The meaningful sentence is here`

```
$ ./speaker.py
```


**Running on remote workstation:**

3. Display current published messages on the topic `qr_word`

```
$ rostopic echo /qr_word
```


4. (manual task) Manually look at all the qr_word and come up with a meaningful sentence.



5. Send the meaningful sentence back to the robot on the topic sentence
```
$ rostopic pub sentence std_msgs/String "The meaningful sentence is here"
```
