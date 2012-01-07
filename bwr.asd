;;;; bwr.asd

(asdf:defsystem #:bwr
  :serial t
  :depends-on (#:alexandria
               #:hunchentoot
               #:cl-who
               #:parenscript
               #:css-lite)
  :components ((:file "package")
               (:file "bwr")))

