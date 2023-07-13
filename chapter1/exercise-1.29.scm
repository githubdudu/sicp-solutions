;Simpson’s Rule
; h = (b - a)/n
; h/3(y0 + 4y1 + 2y2 +... 2yn-2 + 4yn-1 + yn)
; yk = f(a + kh)

; sum (version in the book)
(define (sum f a next b)
  (if (> a b) 
      0 
      (+ (f a)
         (sum f (next a) next b))))

(define (integral-simp f a b n)
  (define h (/ (- b a) n))
  (define (update-x x)
          (+ x h))
  (define (co k) 
    (if (or (= k 0) (= k n)) 
        1 
        (if (even? k) 
            2 
            4)))
  (define (sum x k)
    (if (> x b) 
        0 
        (+ (* (co k) (f x))
          (sum (update-x x) (+ k 1)))))
  
  (* (/ h 3) (sum a 0)))

(define (cube x) (* x x x))
(integral-simp cube 0 1 3)
