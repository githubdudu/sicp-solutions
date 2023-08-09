#lang sicp

;;
(define (div-terms L1 L2)
  (if (empty-termlist? L1)
      (list (the-empty-termlist) (the-empty-termlist))
      (let ((t1 (first-term L1))
            (t2 (first-term L2)))
        (if (> (order t2) (order t1))
            (list (the-empty-termlist) L1)
            (let ((new-c (div (coeff t1) (coeff t2)))
                  (new-o (- (order t1) (order t2))))
              (let ((rest-of-result
                     (div-terms (sub-terms L1 (mul-terms L2 (make-term new-o new-c))) L2)
                     ))
                (adjoin-term (make-term new-o new-c) rest-of-result)
                ))))))
(define (gcd-terms a b)
  (if (empty-termlist? b)
      a
      (gcd-terms b (remainder-terms a b))))

;; Implement `remainder-terms` with `div-terms`
(define (remainder-terms a b)
  (cdar (div-terms a b)))

;; Write `gcd-poly`
(define (gcd-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
                 (gcd-terms (term-list p1)
                            (term-list p2)))
      (error "Polys not in same var -- GCD-POLY"
             (list p1 p2))))

;; Install in the system a generic operation `greatest-common-divisor`
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(define (greatest-common-divisor a b)
  (if (eq? 'polynomial (type-tag a) (type-tag b))
      (gcd-poly a b)
      (gcd a b)))