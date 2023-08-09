#lang sicp

;; Implement `pseudoremainder-terms`
;; be like `remainde-terms`
(define (pseudoremainder-terms a b)
  (let ((c (coeff (first-term b)))
        (O1 (order (first-term a)))
        (O2 (order (first-term b))))
    (let ((factor (expt c (- (+ 1 O1) O2))))
      (cdar (div-terms (mul a factor) b)))))

;; Modify `gcd-terms`
;; Let it call pseudoremainder just once.
(define (gcd-terms a b)
  (define (helper a b)
    (if (empty-termlist? b)
        (let* ((gcd-coeff (apply gcd (map coeff a))))
          (div-terms a (make-term 0  gcd-coeff)))
        (helper b (remainder-terms a b))))

  (if (empty-termlist? b)
      (let* ((gcd-coeff (apply gcd (map coeff a))))
        (div-terms a (make-term 0  gcd-coeff)))
      (helper b (pseudoremainder-terms a b))))