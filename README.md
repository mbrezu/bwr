-*- markdown -*-

# BWR - Basic Web Rig

A very simple project that can be used as a base for
Hunchentoot/cl-who/Jquery based projects.

## Example usage

(start a fresh SLIME session; I assume `quicklisp` is installed)

    ; SLIME 2011-11-03
    CL-USER> (ql:quickload :bwr)
    To load "bwr":
      Load 1 ASDF system:
        bwr
    ; Loading "bwr"
    ..................................................
    [package bwr]..
    (:BWR)
    CL-USER> (bwr:start)
    #<HUNCHENTOOT:EASY-ACCEPTOR (host *, port 9000)>
    CL-USER>

## Modifying the basic rig

 1) Copy the project.
 2) Rename `:bwr` etc. to the new names.
 3) Customize `bwr.lisp/handler` to do what you need.

Note: changes to `handler` don't require server restarts, just reloads
in the browser.
