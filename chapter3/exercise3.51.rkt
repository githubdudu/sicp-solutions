#lang sicp
(#%require "stream/streamfunc.rkt" )


(define (show x)
  (display-line x)
  x)
(define x
  (stream-map show
              (stream-enumerate-interval 0 10)))
(stream-ref x 5)
(stream-ref x 7)


;; Result, test in racket and try.scheme.org, using self-defined `delay` and `force` or not.
; 0  
; 1  
; 2  
; 3  
; 4  
; 5  
; 6  
; 7  
; 8  
; 9  
; 105
; 7