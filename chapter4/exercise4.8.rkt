#lang sicp

(define (eval exp env)
  (cond ...
   ((let? exp) (eval (let->combination exp) env))
   ...))


(define (let->combination exp)
  (if (pairs? (let-pairs-list exp))
      (cons (make-lambda
             (map car (let-pairs-list exp))
             (let-body exp))
            (map cadr (let-pairs-list exp)))
      (begin
        (list 'define
              (named-let-variable exp)
              (make-lambda (map car (named-let-pairs-list exp))
                           (named-let-body exp)))
        (cons (named-let-variable exp)
              (map cadr (named-let-pairs-list exp))))))

(define (let? exp) (tagged-list? exp 'let))
(define (let-pairs-list exp) (cadr exp))
(define (let-body exp) (cddr exp)) ; body might contain multiple exp

(define (named-let-variable exp) (cadr exp))
(define (named-let-pairs-list exp) (caddr exp))
(define (named-let-body exp) (cdddr exp))
