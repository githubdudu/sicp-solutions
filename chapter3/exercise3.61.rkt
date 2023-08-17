#lang sicp
(#%require "stream/stream.rkt" "stream/streamop.rkt" "exercise3.60.rkt" "exercise3.59.rkt")
(#%provide invert-unit-series mul-series display-stream-inf)
(define (invert-unit-series S)
  (cons-stream 1 (scale-stream (mul-series (invert-unit-series S) (stream-cdr S)) -1)))

;; TEST
; (display-stream-inf (invert-unit-series exp-series) 10)