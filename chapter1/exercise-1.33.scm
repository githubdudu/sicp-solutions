(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a answer)
    (if (> a b)
        answer
        (if (filter a) (iter (next a) (combiner (term a) answer))
            (iter (next a) answer))))
  (iter a null-value))

(load "./utils.scm")
;solution 1.33a

(define (answer-a a b)
  (define (inc x) (+ 1 x))
  (filtered-accumulate + 0 square a inc b prime?))
;solution 1.33b

(define (answer-b n) 
  (define (id x) x)
  (define (inc x) (+ 1 x))
  (define (gcd-filter? x)
    (= (gcd x n) 1))
  (define (gcd a b)
    (if (= b 0)
        a 
        (gcd b (remainder a b))))
  (filtered-accumulate * 1 id 1 inc n gcd-filter?))

;test
(answer-a 1 5) ;38
(answer-b 10) ;189