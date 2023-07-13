; sum (version in the book)
(define (sum-old term a next b)
  (if (> a b) 
      0 
      (+ (term a)
         (sum-old term (next a) next b))))

; Product
(define (product term a next b)
  (define (iter answer a)
    (if (> a b)
        answer
        (iter (* answer (term a)) (next a))))
  (iter 1 a))

(define (factorial n)
  (define (f-term x) x)
  (define (inc x) (+ x 1))
  (product f-term 1 inc n))

(define (pi-product a b)
  (define (pi-term x)
    (/ (* 2 2 x (+ x 1)) (square (+ x x 1))))
  (define (pi-next x)
    (+ x 1))
  (* 4 (product pi-term a pi-next b)))

(display (exact->inexact (pi-product 1 100)))

; solution 1.31b
(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a ) (product-recursive term (next a ) next b))))