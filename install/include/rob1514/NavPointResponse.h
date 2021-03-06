// Generated by gencpp from file rob1514/NavPointResponse.msg
// DO NOT EDIT!


#ifndef ROB1514_MESSAGE_NAVPOINTRESPONSE_H
#define ROB1514_MESSAGE_NAVPOINTRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace rob1514
{
template <class ContainerAllocator>
struct NavPointResponse_
{
  typedef NavPointResponse_<ContainerAllocator> Type;

  NavPointResponse_()
    : status()  {
    }
  NavPointResponse_(const ContainerAllocator& _alloc)
    : status(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _status_type;
  _status_type status;





  typedef boost::shared_ptr< ::rob1514::NavPointResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::rob1514::NavPointResponse_<ContainerAllocator> const> ConstPtr;

}; // struct NavPointResponse_

typedef ::rob1514::NavPointResponse_<std::allocator<void> > NavPointResponse;

typedef boost::shared_ptr< ::rob1514::NavPointResponse > NavPointResponsePtr;
typedef boost::shared_ptr< ::rob1514::NavPointResponse const> NavPointResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::rob1514::NavPointResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::rob1514::NavPointResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace rob1514

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::rob1514::NavPointResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::rob1514::NavPointResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rob1514::NavPointResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rob1514::NavPointResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rob1514::NavPointResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rob1514::NavPointResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::rob1514::NavPointResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4fe5af303955c287688e7347e9b00278";
  }

  static const char* value(const ::rob1514::NavPointResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4fe5af303955c287ULL;
  static const uint64_t static_value2 = 0x688e7347e9b00278ULL;
};

template<class ContainerAllocator>
struct DataType< ::rob1514::NavPointResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "rob1514/NavPointResponse";
  }

  static const char* value(const ::rob1514::NavPointResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::rob1514::NavPointResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string status\n\
\n\
";
  }

  static const char* value(const ::rob1514::NavPointResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::rob1514::NavPointResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.status);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct NavPointResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::rob1514::NavPointResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::rob1514::NavPointResponse_<ContainerAllocator>& v)
  {
    s << indent << "status: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.status);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROB1514_MESSAGE_NAVPOINTRESPONSE_H
