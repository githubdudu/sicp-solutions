#lang sicp
(#%require "stream/streamop.rkt" "stream/streamfunc.rkt" "stream/stream.rkt")

(define sign-change-detector (lambda (now last)
                               (cond ((and (< now 0) (>= last 0)) -1)
                                     ((and (> now 0) (<= last 0)) 1)
                                     (else 0))))
(define zip-series
  (stream-map (lambda (x) (- (remainder x 10) 5))
              integers))


(define (smooth stream)
  (cons-stream (/ (+ (stream-car stream)
                     (stream-ref stream 1))
                  2)
               (smooth (stream-cdr stream))))
(define sense-data (smooth zip-series))
(define zero-crossings2
  (stream-map sign-change-detector
              sense-data
              (cons-stream 0 sense-data)))

(display-stream-inf zero-crossings2 100)
