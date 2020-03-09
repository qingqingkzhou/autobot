;; Auto-generated. Do not edit!


(when (boundp 'rob1514::NavPoint)
  (if (not (find-package "ROB1514"))
    (make-package "ROB1514"))
  (shadow 'NavPoint (find-package "ROB1514")))
(unless (find-package "ROB1514::NAVPOINT")
  (make-package "ROB1514::NAVPOINT"))
(unless (find-package "ROB1514::NAVPOINTREQUEST")
  (make-package "ROB1514::NAVPOINTREQUEST"))
(unless (find-package "ROB1514::NAVPOINTRESPONSE")
  (make-package "ROB1514::NAVPOINTRESPONSE"))

(in-package "ROS")





(defclass rob1514::NavPointRequest
  :super ros::object
  :slots (_x _y _r0 _r1 _r2 _r3 ))

(defmethod rob1514::NavPointRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:r0 __r0) 0.0)
    ((:r1 __r1) 0.0)
    ((:r2 __r2) 0.0)
    ((:r3 __r3) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _r0 (float __r0))
   (setq _r1 (float __r1))
   (setq _r2 (float __r2))
   (setq _r3 (float __r3))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:r0
   (&optional __r0)
   (if __r0 (setq _r0 __r0)) _r0)
  (:r1
   (&optional __r1)
   (if __r1 (setq _r1 __r1)) _r1)
  (:r2
   (&optional __r2)
   (if __r2 (setq _r2 __r2)) _r2)
  (:r3
   (&optional __r3)
   (if __r3 (setq _r3 __r3)) _r3)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _r0
    8
    ;; float64 _r1
    8
    ;; float64 _r2
    8
    ;; float64 _r3
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _r0
       (sys::poke _r0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _r1
       (sys::poke _r1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _r2
       (sys::poke _r2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _r3
       (sys::poke _r3 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _r0
     (setq _r0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _r1
     (setq _r1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _r2
     (setq _r2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _r3
     (setq _r3 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass rob1514::NavPointResponse
  :super ros::object
  :slots (_status ))

(defmethod rob1514::NavPointResponse
  (:init
   (&key
    ((:status __status) "")
    )
   (send-super :init)
   (setq _status (string __status))
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; string _status
    4 (length _status)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _status
       (write-long (length _status) s) (princ _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass rob1514::NavPoint
  :super ros::object
  :slots ())

(setf (get rob1514::NavPoint :md5sum-) "631fef18d2de8d39c6b202102f6ea8dd")
(setf (get rob1514::NavPoint :datatype-) "rob1514/NavPoint")
(setf (get rob1514::NavPoint :request) rob1514::NavPointRequest)
(setf (get rob1514::NavPoint :response) rob1514::NavPointResponse)

(defmethod rob1514::NavPointRequest
  (:response () (instance rob1514::NavPointResponse :init)))

(setf (get rob1514::NavPointRequest :md5sum-) "631fef18d2de8d39c6b202102f6ea8dd")
(setf (get rob1514::NavPointRequest :datatype-) "rob1514/NavPointRequest")
(setf (get rob1514::NavPointRequest :definition-)
      "float64 x
float64 y
float64 r0
float64 r1
float64 r2
float64 r3
---
string status

")

(setf (get rob1514::NavPointResponse :md5sum-) "631fef18d2de8d39c6b202102f6ea8dd")
(setf (get rob1514::NavPointResponse :datatype-) "rob1514/NavPointResponse")
(setf (get rob1514::NavPointResponse :definition-)
      "float64 x
float64 y
float64 r0
float64 r1
float64 r2
float64 r3
---
string status

")



(provide :rob1514/NavPoint "631fef18d2de8d39c6b202102f6ea8dd")


