#lang sicp
(define (loop? x)
  (define (safe-cdr li)
    (if (pair? li)
        (cdr li)
        '()))
  (define (iter slow fast)
    (cond ((not (pair? fast)) false)
          ((not (pair? slow)) false)
          ((eq? slow fast) true)
          (else (iter (safe-cdr slow) (safe-cdr (safe-cdr fast))))))
  (iter (safe-cdr x) (safe-cdr (safe-cdr x))))
; Tested with mzscheme implementation of R5RS:
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
