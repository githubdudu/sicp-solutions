#lang sicp

(#%require "stream/streamfunc.rkt" "stream/stream.rkt")

(define (stream-limit stream tolerance)
  (define (helper s1 s2)
    (let ((diff (- (stream-car s1) (stream-car s2))))
      (if (< (abs diff) tolerance)
          (stream-car s2)
          (helper (stream-cdr s1) (stream-cdr s2)))))
  (helper stream (stream-cdr stream)))

;; Pre-defined
(define (sqrt-stream x)
  (define guesses
    (cons-stream
     1.0
     (stream-map (lambda (guess) (sqrt-improve guess x))
                 guesses)))
  guesses)
(define (sqrt-improve guess x)
  (average guess (/ x guess)))
(define (average x y) (/ (+ x y) 2))

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))
(sqrt 2 0.0001)