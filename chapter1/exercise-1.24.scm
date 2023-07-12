;smallest-divisor
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))

;prime?
(define (prime? n)
  (= n (smallest-divisor n)))

;next
(define (next n)
  (if (= 2 n) 3 (+ 2 n)))

;fast-prime?
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

;timed-prime-test
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;search-for-primes
(define (search-for-primes start count)
  (if (> count 0) 
      (let ((x (if (divides? 2 start)
                   (+ start 1)
                   start)))
        (if (prime? x)
            (begin
             (display x)
             (newline)
             (search-for-primes (+ x 2) (- count 1)))
            (search-for-primes (+ x 2) count)))))

(timed-prime-test 1009)
(timed-prime-test 1013 )
(timed-prime-test 1019 )
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037 )
(timed-prime-test 1000000007 )
(timed-prime-test 1000000009 )
(timed-prime-test 1000000021 )
(timed-prime-test 1000000000039) 
(timed-prime-test 1000000000061) 
(timed-prime-test 1000000000063) 