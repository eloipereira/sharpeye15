
(cl:in-package :asdf)

(defsystem "seagull_commons_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "SeagullError" :depends-on ("_package_SeagullError"))
    (:file "_package_SeagullError" :depends-on ("_package"))
    (:file "SeagullHeartbeat" :depends-on ("_package_SeagullHeartbeat"))
    (:file "_package_SeagullHeartbeat" :depends-on ("_package"))
    (:file "CommsParameters" :depends-on ("_package_CommsParameters"))
    (:file "_package_CommsParameters" :depends-on ("_package"))
    (:file "SeagullHeader" :depends-on ("_package_SeagullHeader"))
    (:file "_package_SeagullHeader" :depends-on ("_package"))
  ))