#lang sicp

;; Must use the same `monte-carlo` procedure
(define (estimate-integral P x1 x2 y1 y2 trial-times)
  (define (integral-test)
    (P (random-in-range x2 x1) (random-in-range y2 y1)))
  (exact->inexact (* (- x1 x2)(- y1 y2) (monte-carlo trial-times integral-test))))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1)
                 trials-passed))))
  (iter trials 0))

;; Calculate Pi
(define (square x) (* x x))
(define (p-unit-circle a b)
  (<= (sqrt (+ (square (- a 1.0)) (square(- b 1.0)))) 1.0))
(estimate-integral p-unit-circle 2.0 0 2.0 0 100000)
