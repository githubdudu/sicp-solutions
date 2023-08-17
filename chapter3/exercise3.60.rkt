#lang sicp
(#%require "stream/stream.rkt" "stream/streamop.rkt" "exercise3.59.rkt")
(#%provide mul-series)
(define (mul-series s1 s2)
  (cons-stream
   (* (stream-car s1) (stream-car s2))
   (add-streams
    (scale-stream (stream-cdr s1) (stream-car s2))
    (mul-series (stream-cdr s2) s1))))


(define test (add-streams (mul-series cosine-series cosine-series) (mul-series sine-series sine-series)))
;; TEST
; (display-stream-inf test 10)

; 1    
; 0    
; 0    
; 0    
; 0    
; 0    
; 0    
; 0    
; 0    
; 0done