(define (prime? n)
  (define (smallest-divisor n) (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b) (= (remainder b a) 0))
  (and (> n 1) (= n (smallest-divisor n))))

(define (average x y)
  (/ (+ x y) 2))

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
(define dx 0.00001)

(define (newtons-method g guess)
  (define (newton-transform g)
    (lambda (x) (- x (/ (g x) ((deriv g) x)))))
  (fixed-point (newton-transform g) guess))

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
; for testing
; (define (sqrt x)
;   (newtons-method
;   (lambda (y) (- (square y) x)) 1.0))