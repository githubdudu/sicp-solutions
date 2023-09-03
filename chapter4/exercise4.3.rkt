#lang sicp
(define operation-table make-table)
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc))


(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((get 'eval (car exp)) ((get 'eval (car exp)) exp env))
        ((application? exp)
         (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
        (else (error "Unknown expression type -- EVAL" expr))))

(put 'eval 'quote text-of-quotation)
(put 'eval 'set! eval-assignment)
(put 'eval 'define eval-definition)
(put 'eval 'if eval-if)
(put 'eval 'lambda
     (lambda (exp env) (make-procedure (lambda-parameters exp)
                                       (lambda-body exp)
                                       env)))
(put 'eval 'begin
     (lambda (exp env)
       (eval-sequence (begin-actions exp) env)))
(put 'eval 'cond
     (lambda (exp env)
       (eval (cond->if exp) env)))

