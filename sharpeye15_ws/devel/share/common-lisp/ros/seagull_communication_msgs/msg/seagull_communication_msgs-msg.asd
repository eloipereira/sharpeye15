
(cl:in-package :asdf)

(defsystem "seagull_communication_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :seagull_commons_msgs-msg
)
  :components ((:file "_package")
    (:file "SeagullPayload" :depends-on ("_package_SeagullPayload"))
    (:file "_package_SeagullPayload" :depends-on ("_package"))
  ))