#lang sicp
(#%require "stream/streamop.rkt" "stream/streamfunc.rkt" "stream/stream.rkt")
; Hint: You will need to mix in an additional stream
;; We consider it to be composed of four parts. So there is one more part than the pairs(i < j).

(define (pairs-2 s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (interleave
     (stream-map (lambda (x) (list (stream-car s) x))
                 (stream-cdr t))
     (stream-map (lambda (x) (list x (stream-car t)))
                 (stream-cdr s)))
    (pairs-2 (stream-cdr s) (stream-cdr t)))))

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))
                   
(display-stream-inf (pairs-2 integers integers) 100)