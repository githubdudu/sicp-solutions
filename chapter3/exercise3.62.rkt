#lang sicp
(#%require "exercise3.61.rkt" "exercise3.59.rkt")
(define (div-series a b)
  (mul-series (invert-unit-series b) a))

(display-stream-inf (div-series sine-series cosine-series) 10) ; tangent-series = sine-series/cosine-series
; 0
; 1
; 0
; 1/3        
; 0
; 2/15       
; 0
; 17/315     
; 0
; 62/2835done