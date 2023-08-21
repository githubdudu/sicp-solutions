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
(define (solve-2nd a b y0 dy0 dt)
  (define y (integral (delay dy) y0 dt))
  (define dy (integral (delay ddy) dy0 dt))
  (define ddy (add-streams (scale-stream y b) (scale-stream dy a)))
  y)
(define (solve-2nd-hack a b y0 dy0 dt)
  (let ((y 'unassigned*)
        (dy 'unassigned*)
        (ddy 'unassigned*))
    (set! y (integral (delay dy) y0 dt))
    (set! dy (integral (delay ddy) dy0 dt))
    (set! ddy (add-streams (scale-stream y b) (scale-stream dy a)))
    y))

(display-stream-inf (solve-2nd-hack 1 1 0 1 0.001) 10)