#lang sicp

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(controller sqrt
            (assign guess (const 1))
            sqrt-iter
            (test (op good-enough?) (reg guess) (reg x) (const 0.001))
            (branch (label done))
            (assign guess (op improve) (reg guess))
            (goto (label sqrt))
            done)

(controller sqrt
            (assign guess (const 1))
            sqrt-iter
            (assign temp (op *) (reg guess) (reg guess))
            (assign temp (op -) (reg temp) (reg x))
            (test (op >) (reg temp) (const 0))
            (branch (label positive))
            (assign temp (op *) (reg temp) (const -1))
            positive
            (test (op <) (reg temp) (const 0.001))
            (branch (label done))
            (assign temp (op /) (reg x) (reg guess))
            (assign temp (op +) (reg temp) (reg guess))
            (assign guess (op /) (reg temp) (const 2))
            (goto (label sqrt))
            done)