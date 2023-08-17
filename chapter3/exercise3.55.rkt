#lang sicp
(define (partialsums stream)
  (define s (add-streams stream (cons-stream 0 s)))
  s)