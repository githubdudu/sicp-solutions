#lang sicp
(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((if? exp) (eval-if exp env))
        ((lambda? exp) (make-procedure (lambda-parameters exp)
                                       (lambda-body exp)
                                       env))
        ((begin? exp)
         (eval-sequence (begin-actions exp) env))
        ((cond? exp) (eval (cond->if exp) env))
        ;; Solution
        ((and? exp) (eval-and (operands exp) env))
        ((or? exp) (eval-or (operands exp) env))
        ;;
        ((application? exp)
         (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
        (else
         (error "Unknown expression type: EVAL" exp))))
(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      false))
(define (and? exp) (tagged-list? exp 'and))
(define (or? exp) (tagged-list? exp 'or))

(define (eval-and exps env)
  (if (no-operands? exps)
      true
      (if (true? (eval (first-exp exps) env))
          (if (last-exp? exps)
              exps
              (eval-and (rest-exps exps) env))
          false)))
(define (eval-or exps env)
  (if (no-operands? exps)
      false
      (if (true? (eval (first-exp exps) env))
          (first-exp exps)
          (eval-or (rest-exps exps) env))))

;((and? exp) (eval (and->if exp) env))
;((or? exp) (eval (or->if exp) env))
(define (and->if exps)
  (if (no-operands? exps)
      'true
      (make-if (first-exp exps)
               (make-if (last-exp? exps)
                        exps
                        (and->if (rest-exps exps)))
               'false)))
(define (or->if exps env)
  (if (no-operands? exps)
      'false
      (make-if (first-exp exps)
               (first-exp exps)
               (or->if (rest-exps exps)))))