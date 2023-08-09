#lang sicp

;; Modify "+ - *" to "add sub mul".
(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
  (make-rat (add (mul (numer x) (denom y))
               (mul (numer y) (denom x)))
            (mul (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (sub (mul (numer x) (denom y))
               (mul (numer y) (denom x)))
            (mul (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (mul (numer x) (numer y))
            (mul (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (mul (numer x) (denom y))
            (mul (denom x) (numer y))))
