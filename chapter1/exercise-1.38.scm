(define (cont-frac n d k)
  (define (iter k frac)
    (if (= 0 k) 
        frac
        (iter (- k 1) (/ (n k) (+ (d k) frac)))))
  (iter k 0))

(define (special? n)
  (= (remainder (- n 2) 3) 0)) ; 2,5,8,11
(define (d-euler k)
  (let ((n (+ k 1))) 
    (if (= (remainder n 3) 0)
        (* 2 n 1/3)
        1)))
(cont-frac (lambda (x) 1.0) d-euler 100) ; e-2  Euler's number: e