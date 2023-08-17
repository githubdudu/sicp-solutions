#lang sicp
(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))
; (quotient is a primitive that returns the integer quotient of
; two integers.) What are the successive elements produced by
(expand 1 7 10) ; it is 1/7
; (1 4 2 8 5 7 1 4 2 8 5 7..)
(expand 3 8 10) ; it is 3/8
; (3 7 5 0 ..)