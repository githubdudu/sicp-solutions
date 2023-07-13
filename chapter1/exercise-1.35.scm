(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
    tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(display (fixed-point cos 1.0))
;x = 1 + 1/x  , multiple x to both sides of the equation
;x^2 = x + 1,  it is golden ratio φ
(display (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
