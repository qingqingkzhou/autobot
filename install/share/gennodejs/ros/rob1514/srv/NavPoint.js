// Auto-generated. Do not edit!

// (in-package rob1514.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class NavPointRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.r0 = null;
      this.r1 = null;
      this.r2 = null;
      this.r3 = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('r0')) {
        this.r0 = initObj.r0
      }
      else {
        this.r0 = 0.0;
      }
      if (initObj.hasOwnProperty('r1')) {
        this.r1 = initObj.r1
      }
      else {
        this.r1 = 0.0;
      }
      if (initObj.hasOwnProperty('r2')) {
        this.r2 = initObj.r2
      }
      else {
        this.r2 = 0.0;
      }
      if (initObj.hasOwnProperty('r3')) {
        this.r3 = initObj.r3
      }
      else {
        this.r3 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NavPointRequest
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [r0]
    bufferOffset = _serializer.float64(obj.r0, buffer, bufferOffset);
    // Serialize message field [r1]
    bufferOffset = _serializer.float64(obj.r1, buffer, bufferOffset);
    // Serialize message field [r2]
    bufferOffset = _serializer.float64(obj.r2, buffer, bufferOffset);
    // Serialize message field [r3]
    bufferOffset = _serializer.float64(obj.r3, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NavPointRequest
    let len;
    let data = new NavPointRequest(null);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [r0]
    data.r0 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [r1]
    data.r1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [r2]
    data.r2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [r3]
    data.r3 = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a service object
    return 'rob1514/NavPointRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f7c5a18d8fa4f7649a2e4b1ab86d3972';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 x
    float64 y
    float64 r0
    float64 r1
    float64 r2
    float64 r3
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NavPointRequest(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.r0 !== undefined) {
      resolved.r0 = msg.r0;
    }
    else {
      resolved.r0 = 0.0
    }

    if (msg.r1 !== undefined) {
      resolved.r1 = msg.r1;
    }
    else {
      resolved.r1 = 0.0
    }

    if (msg.r2 !== undefined) {
      resolved.r2 = msg.r2;
    }
    else {
      resolved.r2 = 0.0
    }

    if (msg.r3 !== undefined) {
      resolved.r3 = msg.r3;
    }
    else {
      resolved.r3 = 0.0
    }

    return resolved;
    }
};

class NavPointResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.status = null;
    }
    else {
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NavPointResponse
    // Serialize message field [status]
    bufferOffset = _serializer.string(obj.status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NavPointResponse
    let len;
    let data = new NavPointResponse(null);
    // Deserialize message field [status]
    data.status = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.status.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'rob1514/NavPointResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4fe5af303955c287688e7347e9b00278';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string status
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NavPointResponse(null);
    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: NavPointRequest,
  Response: NavPointResponse,
  md5sum() { return '631fef18d2de8d39c6b202102f6ea8dd'; },
  datatype() { return 'rob1514/NavPoint'; }
};
