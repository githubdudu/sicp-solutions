#lang racket

(define f
  (let ((last 0))
    (lambda (x)
      (define temp last)
      (set! last x)
      temp)))
(+ (f 0) (f 1)) ;0
(+ (f 1) (f 0)) ;1
; will return 0 if the arguments to + are evaluated from left to
; right but will return 1 if the arguments are evaluated from
; right to left.