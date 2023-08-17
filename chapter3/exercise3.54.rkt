#lang sicp
(define (mul-streams s1 s2) (stream-map * s1 s2))

;; nth element is n+1 factorial
; 0 th is 1!
; 1 th is 2! 
; So (stream-cdr integer) instead of (integer)
(define factorials
  (cons-stream 1 (mul-streams (stream-cdr integer) factorials)))