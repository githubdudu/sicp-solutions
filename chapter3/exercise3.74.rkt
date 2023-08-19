#lang sicp
(#%require "stream/streamop.rkt" "stream/streamfunc.rkt" "stream/stream.rkt")

(define sign-change-detector (lambda (now last)
                               (cond ((and (< now 0) (>= last 0)) -1)
                                     ((and (> now 0) (<= last 0)) 1)
                                     (else 0))))
(define (make-zero-crossings input-stream last-value)
  (cons-stream
   (sign-change-detector
    (stream-car input-stream)
    last-value)
   (make-zero-crossings
    (stream-cdr input-stream)
    (stream-car input-stream))))
; (define zero-crossings
;   (make-zero-crossings sense-data 0))

(define zip-series
  (stream-map (lambda (x) (- (remainder x 10) 5))
              integers))
(define sense-data zip-series)
(define zero-crossings2
  (stream-map sign-change-detector
              sense-data
              (cons-stream 0 sense-data)))
(display-stream-inf zero-crossings2 100)
;; There is a issue here. From the function of `sign-change-detector`, apparently the arguments are (current-value, last-value).
;; If the `zero-crossing` is defined as rigid as negtive to positive(or vice versa), not just zero to positive. 
;  It would be wrong to pass 0 as last-value. We may correct this by modifying `sign-change-detector`.