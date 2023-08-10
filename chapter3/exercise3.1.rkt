#lang sicp

;; Write a procedure just like `make-withdraw`



(define (make-accumulator curr)
  (lambda (addend)
    (begin (set! curr (+ addend curr))
           curr)))
;; Example
(define A (make-accumulator 5))
(A 10) ;15
(A 10) ;25