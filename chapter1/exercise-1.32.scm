(define (sum-old term a next b)
  (if (> a b) 
      0 
      (+ (term a)
         (sum-old term (next a) next b))))

(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a ) (product-recursive term (next a ) next b))))

(define (accumulate combiner null-value term a next b)
  (if (> a b) 
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))
(define (product term a next b)
  (accumulate * 1 term a next b))

; iter version
(define (accumulate combiner null-value term a next b)
  (define (iter a answer)
    (if (> a b)
        answer
        (iter (next a) (combiner (term a) answer))))
  (iter a null-value))
