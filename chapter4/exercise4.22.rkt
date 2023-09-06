#lang sicp

(define (analyze-let exp)
  (analyze (let->combination exp)))

; From 4.6
(define (let->combination exp)
  (cons (make-lambda
         (map car (let-pairs-list exp))
         (let-body exp))
        (map cadr (let-pairs-list exp))))