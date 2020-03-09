; Auto-generated. Do not edit!


(cl:in-package rob1514-srv)


;//! \htmlinclude NavPoint-request.msg.html

(cl:defclass <NavPoint-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (r0
    :reader r0
    :initarg :r0
    :type cl:float
    :initform 0.0)
   (r1
    :reader r1
    :initarg :r1
    :type cl:float
    :initform 0.0)
   (r2
    :reader r2
    :initarg :r2
    :type cl:float
    :initform 0.0)
   (r3
    :reader r3
    :initarg :r3
    :type cl:float
    :initform 0.0))
)

(cl:defclass NavPoint-request (<NavPoint-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NavPoint-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NavPoint-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rob1514-srv:<NavPoint-request> is deprecated: use rob1514-srv:NavPoint-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <NavPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rob1514-srv:x-val is deprecated.  Use rob1514-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <NavPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rob1514-srv:y-val is deprecated.  Use rob1514-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'r0-val :lambda-list '(m))
(cl:defmethod r0-val ((m <NavPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rob1514-srv:r0-val is deprecated.  Use rob1514-srv:r0 instead.")
  (r0 m))

(cl:ensure-generic-function 'r1-val :lambda-list '(m))
(cl:defmethod r1-val ((m <NavPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rob1514-srv:r1-val is deprecated.  Use rob1514-srv:r1 instead.")
  (r1 m))

(cl:ensure-generic-function 'r2-val :lambda-list '(m))
(cl:defmethod r2-val ((m <NavPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rob1514-srv:r2-val is deprecated.  Use rob1514-srv:r2 instead.")
  (r2 m))

(cl:ensure-generic-function 'r3-val :lambda-list '(m))
(cl:defmethod r3-val ((m <NavPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rob1514-srv:r3-val is deprecated.  Use rob1514-srv:r3 instead.")
  (r3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NavPoint-request>) ostream)
  "Serializes a message object of type '<NavPoint-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'r0))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'r1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'r2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'r3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NavPoint-request>) istream)
  "Deserializes a message object of type '<NavPoint-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'r0) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'r1) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'r2) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'r3) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NavPoint-request>)))
  "Returns string type for a service object of type '<NavPoint-request>"
  "rob1514/NavPointRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NavPoint-request)))
  "Returns string type for a service object of type 'NavPoint-request"
  "rob1514/NavPointRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NavPoint-request>)))
  "Returns md5sum for a message object of type '<NavPoint-request>"
  "631fef18d2de8d39c6b202102f6ea8dd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NavPoint-request)))
  "Returns md5sum for a message object of type 'NavPoint-request"
  "631fef18d2de8d39c6b202102f6ea8dd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NavPoint-request>)))
  "Returns full string definition for message of type '<NavPoint-request>"
  (cl:format cl:nil "float64 x~%float64 y~%float64 r0~%float64 r1~%float64 r2~%float64 r3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NavPoint-request)))
  "Returns full string definition for message of type 'NavPoint-request"
  (cl:format cl:nil "float64 x~%float64 y~%float64 r0~%float64 r1~%float64 r2~%float64 r3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NavPoint-request>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NavPoint-request>))
  "Converts a ROS message object to a list"
  (cl:list 'NavPoint-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':r0 (r0 msg))
    (cl:cons ':r1 (r1 msg))
    (cl:cons ':r2 (r2 msg))
    (cl:cons ':r3 (r3 msg))
))
;//! \htmlinclude NavPoint-response.msg.html

(cl:defclass <NavPoint-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:string
    :initform ""))
)

(cl:defclass NavPoint-response (<NavPoint-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NavPoint-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NavPoint-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rob1514-srv:<NavPoint-response> is deprecated: use rob1514-srv:NavPoint-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <NavPoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rob1514-srv:status-val is deprecated.  Use rob1514-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NavPoint-response>) ostream)
  "Serializes a message object of type '<NavPoint-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NavPoint-response>) istream)
  "Deserializes a message object of type '<NavPoint-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NavPoint-response>)))
  "Returns string type for a service object of type '<NavPoint-response>"
  "rob1514/NavPointResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NavPoint-response)))
  "Returns string type for a service object of type 'NavPoint-response"
  "rob1514/NavPointResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NavPoint-response>)))
  "Returns md5sum for a message object of type '<NavPoint-response>"
  "631fef18d2de8d39c6b202102f6ea8dd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NavPoint-response)))
  "Returns md5sum for a message object of type 'NavPoint-response"
  "631fef18d2de8d39c6b202102f6ea8dd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NavPoint-response>)))
  "Returns full string definition for message of type '<NavPoint-response>"
  (cl:format cl:nil "string status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NavPoint-response)))
  "Returns full string definition for message of type 'NavPoint-response"
  (cl:format cl:nil "string status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NavPoint-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NavPoint-response>))
  "Converts a ROS message object to a list"
  (cl:list 'NavPoint-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'NavPoint)))
  'NavPoint-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'NavPoint)))
  'NavPoint-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NavPoint)))
  "Returns string type for a service object of type '<NavPoint>"
  "rob1514/NavPoint")