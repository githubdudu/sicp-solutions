#lang sicp
; a
;; below is the definition of application?
; The application should be the rest of expression after checking all the expression types. Louis's plan will classify the `(define x 3)` as a application wrongly.
(define (application? exp) (pair? exp))

; b
(define (application2? exp) (tagged-list? exp 'call))
(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      false))
(define (operator exp) (cadr exp))
(define (operands exp) (cddr exp))