#lang sicp
(#%require "stream/streamop.rkt" "stream/streamfunc.rkt" "stream/stream.rkt")
(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))

(define (triples s t u)
  (cons-stream
   (list (stream-car s) (stream-car t) (stream-car u))
   (interleave
    (interleave
     (stream-map (lambda (x) (list (stream-car s) (stream-car t) x))
                 (stream-cdr u))
     (stream-map (lambda (x) (cons (stream-car s) x))
                 (pairs (stream-cdr t) (stream-cdr u))))
    (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

; (display-stream-inf (triples integers integers integers) 100)
(define (right-triangle? x y z)
  (if (= (+ (* x x) (* y y)) (* z z))
      #t
      #f))
(define pythagorean-triples
  (stream-filter (lambda (x) (right-triangle? (car x) (cadr x) (caddr x)))
                 (triples integers integers integers)))
(display-stream-inf pythagorean-triples 10)
; (3 4 5)
; (6 8 10)
; (5 12 13)
; (9 12 15)
; (8 15 17)
; (12 16 20)
; (15 20 25)