#lang sicp

;; By adding a rule
(lisp-value (lambda (a b) (symbol<? (car a) (car b)))
            ?person-1
            ?person-2)