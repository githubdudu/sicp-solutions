#lang sicp
(#%require "stream/streamop.rkt" "stream/streamfunc.rkt" "stream/stream.rkt")

(define sign-change-detector (lambda (now last)
                               (cond ((and (< now 0) (>= last 0)) -1)
                                     ((and (> now 0) (<= last 0)) 1)
                                     (else 0))))
(define (make-zero-crossings input-stream last-value last-avpt)
  (let ((avpt (/ (+ (stream-car input-stream)
                    last-value)
                 2)))
    (cons-stream
     (sign-change-detector avpt last-avpt)
     (make-zero-crossings
      (stream-cdr input-stream) (stream-car input-stream) avpt))))

(define zip-series
  (stream-map (lambda (x) (- (remainder x 10) 5))
              integers))
(define sense-data zip-series)
(define zero-crossings
  (make-zero-crossings sense-data 0 1))

(display-stream-inf zero-crossings 100)