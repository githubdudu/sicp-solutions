#lang sicp

;; reduce-terms
(define (reduce-terms n d)
  (let* ((gcd (gcd-terms n d))
         (c (coeff (first-term gcd)))
         (O2 (order(first-term gcd)))
         (order-n (order n))
         (order-d (order d))
         (O1 (if (> order-n order-d) (order-n)(order-d)))
         (factor (expt c (- (+ 1 O1) O2)))
         (factor-term (make-term 0 factor)))
    (list (car (div-poly (mul-poly n factor-term) gcd)) (car (div-poly (mul-poly n factor-term) gcd)))))

(define (reduce-poly n d)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
                 (reduce-terms (terms n) (terms d)))
      (error "Polys not in same var -- REDUCE-POLY"
             (list p1 p2))))

;;b
(put 'reduce '(scheme-number scheme-number) reduce-integers)
(put 'reduce '(polynomial polynomial) reduce-poly)
(define (reduce n d)
  (apply-generic n d))
