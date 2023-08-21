#lang sicp
(#%require "stream/streamop.rkt" "stream/streamfunc.rkt")
(define (integral delayed-integrand initial-value dt)
  (define int
    (cons-stream
     initial-value
     (let ((integrand (force delayed-integrand)))
       (add-streams (scale-stream integrand dt) int))))
  int)

;; Build RLC based on Figure 3.37
;; Can't test this in Racket env
;; Use the hack mentioned in 4.1.6
(define (RLC R L C dt)
  (define (helper vc0 il0)
    (let ((vc 'unassigned*)
          (il 'unassigned*)
          (dvc 'unassigned*)
          (dil 'unassigned*))
      (set! vc (integral (delay dvc) vc0 dt))
      (set! il (integral (delay dil) il0 dt))
      (set! dvc (scale-stream il (- (/ 1 C))))
      (set! dil (add-streams (scale-stream il (- (/ R L)))
                             (scale-stream vc (/ 1 L))))
      (stream-map (lambda (a b)(cons a b)) vc il)))
  helper)

(display-stream-inf ((RLC 1 1 0.2 0.1) 10 0) 10)