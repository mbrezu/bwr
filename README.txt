-*- markdown -*-

# BWR - Basic Web Rig

A very simple project that can be used as a base for
Hunchentoot/cl-who/Jquery based projects.

## Example usage

(start a fresh SLIME session; I assume `quicklisp` is installed)

    CL-USER> (ql:quickload :bwr)
    To load "bwr":
      Load 1 ASDF system:
        bwr
    ; Loading "bwr"
    ..................................................
    [package bwr].
    (:BWR)
    CL-USER> (bwr:make-app 'bwr:hello-handler)
    (#<CLOSURE (LAMBDA # :IN HUNCHENTOOT:CREATE-PREFIX-DISPATCHER) {1003C81C8B}>
     #<CLOSURE (LAMBDA # :IN HUNCHENTOOT:CREATE-PREFIX-DISPATCHER) {1003C7515B}>
     HUNCHENTOOT:DISPATCH-EASY-HANDLERS)
    CL-USER> (bwr:start)
    #<HUNCHENTOOT:EASY-ACCEPTOR (host *, port 9000)>
    CL-USER>

