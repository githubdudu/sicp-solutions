#lang sicp
(#%require "stream/streamop.rkt" "stream/streamfunc.rkt" "stream/stream.rkt")

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))
(define (pairs s t)
  (interleave
   (stream-map (lambda (x) (list (stream-car s) x))
               t)
   (pairs (stream-cdr s) (stream-cdr t))))
(display-stream-inf (pairs integers integers) 1)
;; It doesn't work. There is endless interleave loop.