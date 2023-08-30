#lang sicp
(#%require "stream/stream.rkt" "stream/streamfunc.rkt")

;; Definition from book
(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo experiment-stream passed failed)
  (define (next passed failed)
    (cons-stream
     (/ passed (+ passed failed))
     (monte-carlo
      (stream-cdr experiment-stream) passed failed)))
  (if (stream-car experiment-stream)
      (next (+ passed 1) failed)
      (next passed (+ failed 1))))

;;;
(define (estimate-integral P x1 x2 y1 y2)
  (define (integral-test)
    (P (random-in-range x2 x1) (random-in-range y2 y1)))
  (stream-map
   (lambda (p) (exact->inexact (* (- x1 x2)(- y1 y2) p)))
   (monte-carlo integral-test 0 0)))