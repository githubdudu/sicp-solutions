#lang sicp
(#%require "stream/streamop.rkt" "stream/streamfunc.rkt")
(define (integral delayed-integrand initial-value dt)
  (define int
    (cons-stream
     initial-value
     (let ((integrand (force delayed-integrand)))
       (add-streams (scale-stream integrand dt) int))))
  int)

;; Can't test this in Racket env
;; Use the hack mentioned in 4.1.6
(define (solve-2nd f y0 dy0 dt)
  (define y (integral (delay dy) y0 dt))
  (define dy (integral (delay ddy) dy0 dt))
  (define ddy (stream-map f dy y))
  y)
(define (solve-2nd-hack f y0 dy0 dt)
  (let ((y 'unassigned*)
        (dy 'unassigned*)
        (ddy 'unassigned*))
    (set! y (integral (delay dy) y0 dt))
    (set! dy (integral (delay ddy) dy0 dt))
    (set! ddy (stream-map f dy y))
    y))

(display-stream-inf (solve-2nd-hack (lambda (x y) (+ (* x 1) (* y 2))) 0 1 0.001) 10)
