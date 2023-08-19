#lang sicp
(define (partial-sums stream)
  (define s (add-streams stream (cons-stream 0 s)))
  s)