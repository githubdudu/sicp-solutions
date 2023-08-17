#lang sicp
;; It is decided by the calculation of (stream-cdr fibs), it actually is calculating next fibs,
;; so the next fib will be computed twice.


; (cons-stream
;  0
;  (cons-stream 1 (add-streams (stream-cdr fibs) fibs))))

;  (cons-stream 1 (add-streams (stream-cdr fib(0)) fib(0)))))

;  (cons-stream 1 (add-streams (stream-cdr fib(1)) fib(1)))))

;  (cons-stream 2 (add-streams (stream-cdr fib(2)) fib(2)))))

;; In order to cal (stream-cdr fib(1)), we have to cal (stream-cdr fib(0)) and fib(0)
;; In order to cal (stream-cdr fib(2)), we have to cal (stream-cdr fib(1)) and fib(1), so its twice of (stream-cdr fib(0)) and fib(0)

;; If there is no memo, the number of additions INCREASE exponentially!