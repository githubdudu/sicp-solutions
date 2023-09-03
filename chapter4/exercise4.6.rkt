#lang sicp

(define (eval exp env)
  (cond ...
   ((let? exp) (eval (let->combination exp) env))
   ...))


(define (let->combination exp)
  (cons (make-lambda
         (map car (let-pairs-list exp))
         (let-body exp))
        (map cadr (let-pairs-list exp))))
(define (let? exp) (tagged-list? exp 'let))
(define (let-pairs-list exp) (cadr exp))
(define (let-body exp) (cddr exp)) ; body might contain multiple exp