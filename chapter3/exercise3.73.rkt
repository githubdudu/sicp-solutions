#lang sicp
(#%require "stream/streamop.rkt" "stream/streamfunc.rkt" "stream/stream.rkt")
(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (add-streams (scale-stream integrand dt)
                              int)))
  int)

(define (RC R C dt)
  (define (RC-model stream initial-value)
    (add-streams (integral stream initial-value (/ dt C))
                 (scale-stream stream R)))
  RC-model)

(define RC1 (RC 5 1 0.5))
(display-stream-inf (RC1 integers 0) 100)
