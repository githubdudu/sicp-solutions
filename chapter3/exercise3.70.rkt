#lang sicp
(#%require "stream/streamop.rkt" "stream/streamfunc.rkt" "stream/stream.rkt")
(#%provide weighted-pairs)
(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2)))
           (if (< (weight s1car) (weight s2car))
               (cons-stream
                s1car
                (merge-weighted (stream-cdr s1) s2 weight))
               (cons-stream
                s2car
                (merge-weighted s1 (stream-cdr s2) weight)))))))

(define (weighted-pairs s t weight)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (merge-weighted
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (weighted-pairs (stream-cdr s) (stream-cdr t) weight)
    weight)))

;; a : sum(i + j)
(define order-by-sum (weighted-pairs integers integers
                                     (lambda (x)
                                       (+ (car x) (cadr x)))))
(display-stream-inf order-by-sum 30)

;; b : sum(2i+3j+5ij)
(define (divisible-2-3-5? x)
  (cond ((= (remainder x 5) 0) #f)
        ((= (remainder x 2) 0) #f)
        ((= (remainder x 3) 0) #f)
        (else #t)))
(define order-by-sum2 (stream-filter
                       (lambda (x) (and (divisible-2-3-5? (car x)) (divisible-2-3-5? (cadr x))))
                       (weighted-pairs integers integers
                                       (lambda (li)
                                         (+ (* 2 (car li)) (* 3 (cadr li)) (* 5 (car li) (cadr li)))))))

(display-stream-inf order-by-sum2 10)
