
(cl:in-package :asdf)

(defsystem "rob1514-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "NavPoint" :depends-on ("_package_NavPoint"))
    (:file "_package_NavPoint" :depends-on ("_package"))
  ))