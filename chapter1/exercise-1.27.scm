(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        

(define (fermat-test a n)
  (= (expmod a n n) a))

(define (carmichael? n a)
  (cond ((>= a n) true)
        ((fermat-test a n) (carmichael? n (+ a 1)))
        (else false)))

; Carmichael numbers : The smallest few are 561, 1105, 1729, 2465, 2821, and 6601.
(carmichael? 561 1)
(carmichael? 1105 1)