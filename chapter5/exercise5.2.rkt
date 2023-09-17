#lang sicp

(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))

(controller
 (assign counter (const 0))
 (assign product (const 1)

 test-counter
 (test (op >) (reg counter) (const n))
 (branch (label done))
 (assign product (op *) (reg counter) (reg product))
 (assign counter (op +) (reg counter) (const 1))
 (goto (label test-counter))
 done)