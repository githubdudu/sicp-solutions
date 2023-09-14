#lang sicp

(rule (append-to-form () ?y ?y))
(rule (append-to-form (?u . ?v) ?y (?u . ?z))
      (append-to-form ?v ?y ?z))


(rule (reverse () ()))
(rule (reverse (?x . ?y) ?z)
      (and (append-to-form ?v (?x) ?z)
           (lisp-value (lambda (ca) (not (null? ca))) ?x)
           (reverse ?y ?v)))

; Work for (reverse (1 2 3) ?x) 
; Work for (reverse ?x (1 2 3)) if we make `?x` not null.
