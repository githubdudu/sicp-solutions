#lang sicp
(#%require "streamfunc.rkt")
(#%provide (all-defined))
(define ones (cons-stream 1 ones))

(define (add-streams s1 s2) (stream-map + s1 s2))

(define integers
  (cons-stream 1 (add-streams ones integers)))

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor))
              stream))

(define double (cons-stream 1 (add-streams double double)))

(define (partial-sums stream)
  (define s (add-streams stream (cons-stream 0 s)))
  s)
