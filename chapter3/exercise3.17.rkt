#lang sicp
(define (count-pairs x)
  (define traversed-list '())
  (define (helper x)
    (if (or (not (pair? x)) (memq x traversed-list))
        0
        ((set! traversed-list (cons x traversed-list))
         (+ 1 (helper (car x)) (helper (cdr x))))))
  (helper x))
