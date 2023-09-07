#lang sicp

; Consider `id` procedure defined as in Exercise 4.27
(define count 0)
(define (id x) (set! count (+ count 1)) x)
(define (square x) (* x x))
;;; L-Eval input:

(square (id 10))
; ((eval *) (eval x) (eval x)) ; x=(delay-it (id 10) env)
; ((eval *) 10 (eval x)) ; x=('evaluated-thunk 10) count=1
; ((eval *) 10 10) ; x=('evaluated-thunk 10) count=1

; Fib is not a good example, we can see `expt` which utilized the `square`

(define (expt x n)
  (if (odd? n)
      (square (expt x (/ n 2)))
      (* n (square x (- n 1)))))