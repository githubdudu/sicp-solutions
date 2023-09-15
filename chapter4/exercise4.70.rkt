#lang sicp

(define (add-assertion! assertion)
  (store-assertion-in-index assertion)
  (let ((old-assertions THE-ASSERTIONS))
    (set! THE-ASSERTIONS
          (cons-stream assertion old-assertions))
    'ok))

(define (add-assertion_! assertion)
  (store-assertion-in-index assertion)
  (set! THE-ASSERTIONS
        (cons-stream assertion THE-ASSERTIONS))
  'ok)

   
;  Because we use (cons-stream assertion THE-ASSERTION), so THE-ASSERTIONS will not be evaluated, (set! THE-ASSERTION (cons-stream assertion THE-ASSERTIONS)) will make THE-ASSERTION in the stream point to itself. so if we use THE-ASSERTIONS, it will lead to infinite loop. 