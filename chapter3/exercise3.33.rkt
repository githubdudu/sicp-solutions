#lang sicp

;; High level of abstraction, just like `celsius-fahrenheit-converter`
;; (a + b)/2 = c
;; a + b = 2 * c
(define (averager a b c)
  (let ((d (make-connector))
        (e (make-connector)))
    (multiplier c d e)
    (adder a b e)
    (constant 2 d)
    'ok))