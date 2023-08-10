#lang sicp

;; Write a procedure with declaring a local variable
(define (make-monitored f)
  (define counter 0)
  (lambda (x)
    (cond ((eq? x 'how-many-calls?) counter)
          ((eq? x 'reset-count) (set! counter 0))
          (else
           (begin (set! counter (+ counter 1))
                  (f x))))))
;; Example
(define s (make-monitored sqrt))
(s 100) ;10
(s 'how-many-calls?) ;1