; sum (version in the book)
(define (sum-old term a next b)
  (if (> a b) 
      0 
      (+ (term a)
         (sum-old term (next a) next b))))

; Solution
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))
  