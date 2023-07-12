(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (check-square (expmod base (/ exp 2) m) m)
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        
; a ^ (n - 1) modulo n == 1
; a ^ n modulo n == a;
;"nontrivial square root of 1 modulo n" : a number not equal to 1 or n - 1 whose square is equal to 1 modulo n
;   Hint: One convenient way to make expmod signal is to have it return 0.
(define (check-square a n)
  (define sqr (square a))
  (if (or (= a 1) (= a (- n 1)))
      sqr
      (if (= (remainder sqr n) 1)
          0
          sqr)))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

(display (fast-prime? 561 10)) ;Carmichael numbers
(display (fast-prime? 1105 10)) ;Carmichael numbers
(display (fast-prime? 1729 10)) ;Carmichael numbers
(display (fast-prime? 1009 100)) ; prime