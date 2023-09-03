#lang sicp

;;It is a so boring question. Copy from solution website.
(define (eval-while expr env)
  (let ((pred (while-predicate expr))
        (body (while-body expr)))
    (eval (make-if pred (sequence->exp (list body expr)) "done") env)))
(define (while? expr)
  (tagged-list? expr 'while))

(define (while-predicate expr) (cadr expr))

(define (while-body expr) (caddr expr))