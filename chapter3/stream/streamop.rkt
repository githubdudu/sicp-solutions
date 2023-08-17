#lang sicp
(#%require "streamfunc.rkt")
(#%provide ones integers add-streams scale-stream)
(define ones (cons-stream 1 ones))

(define (add-streams s1 s2) (stream-map + s1 s2))

(define integers
  (cons-stream 1 (add-streams ones integers)))

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor))
              stream))
              
(define s (cons-stream 1 (add-streams s s)))