#lang sicp
(#%require "stream/streamop.rkt" "stream/streamfunc.rkt" "stream/stream.rkt")

(define (make-tableau transform s)
  (cons-stream s (make-tableau transform (transform s))))
(define (accelerated-sequence transform s)
  (stream-map stream-car (make-tableau transform s)))
(define (euler-transform s)
  (let ((s0 (stream-ref s 0)) ; Sn−1
        (s1 (stream-ref s 1)) ; Sn
        (s2 (stream-ref s 2))) ; Sn+1
    (cons-stream (- s2 (/ (square (- s2 s1))
                          (+ s0 (* -2 s1) s2)))
                 (euler-transform (stream-cdr s)))))
(define (square x) (* x x))

(define (pi-summands n)
  (cons-stream (/ 1.0 n)
               (stream-map - (pi-summands (+ n 2)))))
(define pi-stream
  (scale-stream (partial-sums (pi-summands 1)) 4))

(display-stream-inf
 (accelerated-sequence euler-transform pi-stream) 10)

(define (ln2-summands n)
    (cons-stream (/ 1.0 n)
                 (stream-map - (ln2-summands (+ n 1)))))
(define ln2-stream
  (partial-sums (ln2-summands 1)))
(display-stream-inf
 (accelerated-sequence euler-transform ln2-stream) 10)

;; Result from calculator 0.69314718055994530941723212145818
;; Taking 10 terms of the sequence yields the correct value of ln to 15 decimal places.
; 1.0
; 0.7
; 0.6932773109243697
; 0.6931488693329254
; 0.6931471960735491
; 0.6931471806635636
; 0.6931471805604039
; 0.6931471805599445
; 0.6931471805599427
; 0.6931471805599454done