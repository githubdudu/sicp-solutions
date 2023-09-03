#lang sicp

(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (let ((left (eval (first-operand exps) env)))
        (cons left (list-of-values (rest-operands exps) env)))))
(define (list-of-values2 exps env)
  (list-of-values (reverse exps) env))
(define (no-operands? ops) (null? ops))
(define (first-operand ops) (car ops))
(define (rest-operands ops) (cdr ops))
