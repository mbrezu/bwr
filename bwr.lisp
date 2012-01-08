;;;; bwr.lisp

(declaim (optimize debug))

(in-package #:bwr)

(defvar *acceptor* nil)

(defun make-app (request-handler)
  (setf tbnl:*dispatch-table* (last tbnl:*dispatch-table*))
  (push (tbnl:create-prefix-dispatcher "/" request-handler)
        tbnl:*dispatch-table*)
  (push (tbnl:create-folder-dispatcher-and-handler
         "/static/"
         (asdf:system-relative-pathname :bwr "static/"))
        tbnl:*dispatch-table*))

(defun start ()
  (when (not *acceptor*)
    (setf *acceptor* (make-instance 'tbnl:easy-acceptor :port 9000))
    (make-app 'handler))
  (tbnl:start *acceptor*))

(defun stop ()
  (tbnl:stop *acceptor*))

(defun handler ()
  (labels ((path-is (str)
             (string-equal (tbnl:script-name tbnl:*request*)
                           str)))
    (cond ((path-is "/")
           (with-html-output-to-string (hs nil :indent 0)
             (:html
              (:head
               (:title "Basic Web Rig")
               (:script :type "text/javascript" :src "static/jquery.js")
               (:script :type "text/javascript" :src "code/script.js")
               (:link :rel "stylesheet" :type "text/css" :media "screen" :href "style.css"))
              (:body
               (:p :id "the-p")))))
          ((path-is "/style.css")
           (css-lite:css
             (("#the-p") (:background-color "yellow"))))
          ((path-is "/code/script.js")
           (let ((*ps-print-pretty* t))
             (ps
               ((@ ($ document) ready)
                (lambda ()
                  ((@ ($ "#the-p") text)
                   "hello")))))))))
