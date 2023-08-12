#lang sicp
(define (loop? x)
  (define traversed-list '())
  (define (helper x)
    (cond ((memq x traversed-list) true)
          ((not (pair? x)) false)
          (else (set! traversed-list (cons x traversed-list))
                (helper (cdr x)))))
  (helper x))


;test
(define x '(1 2 3 4 5 6 7 8))
(define y '(1 2 3 4 5 6 7 8))
(set-cdr! (cdddr (cddddr y)) (cdddr y))
(define z '(1))
(set-cdr! z z)
x ; (1 2 3 4 5 6 7 8)
y ; (1 2 3 . #0=(4 5 6 7 8 . #0#))
z ; #0=(1 . #0#)
(loop? x) ; #f
(loop? y) ; #t
(loop? z) ; #t