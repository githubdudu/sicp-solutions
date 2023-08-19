#lang sicp
(#%require "exercise3.70.rkt" "stream/streamop.rkt" "stream/streamfunc.rkt" "stream/stream.rkt")
(define (ramanujan-weight x)(+ (expt (car x )3) (expt (cadr x) 3)))
(define order-by-cubesum (weighted-pairs integers integers
                                         ramanujan-weight))
(define (ramanujan-transform s)
  (cons-stream
   (cons (ramanujan-weight (stream-ref s 0))
         (ramanujan-weight (stream-ref s 1)))
   (ramanujan-transform (stream-cdr s))))
(define ramanujan-numbers
  (stream-filter
   (lambda (x) (= (car x) (cdr x)))
   (ramanujan-transform order-by-cubesum)))

(display-stream-inf ramanujan-numbers 6)

; (1729 . 1729)
; (4104 . 4104)
; (13832 . 13832)
; (20683 . 20683)
; (32832 . 32832)
; (39312 . 39312)done