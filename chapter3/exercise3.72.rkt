#lang sicp
(#%require "exercise3.70.rkt" "stream/streamop.rkt" "stream/streamfunc.rkt" "stream/stream.rkt")
(define (square-weight x)(+ (expt (car x ) 2) (expt (cadr x) 2)))
(define order-by-squaresum (weighted-pairs integers integers
                                         square-weight))
(define (transform s)
  (cons-stream
   (cons (square-weight (stream-ref s 0))
         (cons (square-weight (stream-ref s 1))
               (square-weight (stream-ref s 2))))
   (transform (stream-cdr s))))
(define 3-72-numbers
  (stream-filter
   (lambda (x) (= (car x) (cadr x) (cddr x)))
   (transform order-by-squaresum)))

(display-stream-inf 3-72-numbers 5)

; (325 325 . 325)
; (425 425 . 425)
; (650 650 . 650)
; (725 725 . 725)
; (845 845 . 845)done