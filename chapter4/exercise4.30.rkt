#lang sicp

;; a
; If there is a primitive procedure, the side effect will be applied, corresponding arguments will be forced.
; `display` is a primitive procedure.

;; b
(define (p1 x)
  (set! x (cons x '(2)))
  x)
(define (p2 x)
  (define (p e)
    e x
    )
  (p (set! x (cons x '(2)))))

;; Original
(p1 1) ; '(1 2)
(p2 1) ; 1
;; Cy's
(p1 1) ; '(1 2)
(p2 1) ; '(1 2)

;; c
; example in part `a` is only a matter of when evaluating.

;; d
; It's hard to say. It depends on which property of the language we need.