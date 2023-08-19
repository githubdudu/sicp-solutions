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
(display-stream-inf (pairs integers integers) 767)

;; (1, 100)? (-2 + (100 -2) * 2)th
; Total : 198
; First row 100th, rest 98
; 2nd row (2+96/2)th 50, rest 48
; 3rd row (2+46/2)th 25, rest 23
; 4th row (2+21/2)th 12, rest 11
; 5th row (2+9/2)th 6, rest 5
; 6th row (2+3/2)th 3, rest 2
; 7th row 2rd, rest 0

;; the (9, 10)? (2^9 - 1 + 2^8)
;; the (10, 10)? (2^10 - 1)
;; the pair (99, 100)? (2^99 + 2^98 - 1)
;; the pair (100, 100)? (2^100 - 1)
; (m-n>1): (2^n - 1 + 2^(n - 1) + (m - n - 1) * 2^n) = (m - n + 1/2)* 2^n - 1
; f(n,m)


;; (1,1) (1,2) ...   (1,100) ...
;;       (2,2) (2,3) (2,100) ...
;;            (99,99)(99, 100)...
;;                   (100,100) (100, 101) ...