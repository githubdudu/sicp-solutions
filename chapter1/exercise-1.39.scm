(define (tan-cf x k)
  (define sqrx (square x))
  (define (iter k frac)
    (if (= 1 k) 
        (/ x (- (* 2 k) 1 frac))
        (iter (- k 1) (/ sqrx (- (* 2 k) 1 frac)))))
  (iter k 0))
(tan-cf (/ 3.14159 4) 100) ; 1.0