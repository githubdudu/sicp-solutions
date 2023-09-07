#lang sicp
; (define (f a (b lazy) c (d lazy-memo))
;   ...)


;Definition - no change
(define (definition? exp)
  (tagged-list? exp 'define))
(define (definition-variable exp)
  (if (symbol? (cadr exp))
      (cadr exp)
      (caadr exp)))
(define (definition-value exp)
  (if (symbol? (cadr exp))
      (caddr exp)
      (make-lambda (cdadr exp) ;
                   (cddr exp)))) ;

;; Use these procedure during `extend-environment`
(define filter-parameters
  (lambda (x) (if (pair? x)
                  (car x)
                  x)))
(define filter-delays
  (lambda (x) (if (pair? x)
                  (cadr x)
                  '())))

; No change
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
        ((application? exp)
         (apply (actual-value (operator exp) env)
                (operands exp)
                env))
        (else
         (error "Unknown expression type: EVAL" exp))))

(define (apply procedure arguments env)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure
          procedure
          (list-of-arg-values arguments env)))
        ((compound-procedure? procedure)
         (eval-sequence
          (procedure-body procedure)
          (extend-environment
           (filter-parameters (procedure-parameters procedure)) ;changed
           (list-of-delayed-args  ;changed
            arguments
            (filter-delays (procedure-parameters procedure))
            env)
           (procedure-environment procedure))))
        (else (error "Unknown procedure type: APPLY"
                     procedure))))
(define (actual-value exp env)
  (force-it (eval exp env)))
(define (lazy? exp)
  (eq? 'lazy exp))
(define (lazy-memo? exp)
  (eq? 'lazy-memo exp))
(define (delay-it exp env)
  (list 'thunk exp env))
(define (delay-memo-it exp env)
  (list 'thunk-memo exp env))

(define (list-of-arg-values exps env)
  (if (no-operands? exps)
      '()
      (cons (actual-value (first-operand exps)
                          env)
            (list-of-arg-values (rest-operands exps)
                                env))))
(define (list-of-delayed-args exps delays env)
  (if (no-operands? exps)
      '()
      (let ((first (if (null? (car delays))
                       (actual-value (first-operand exps) env)
                       (if (lazy? (car delays))
                           (delay-it (first-operand exps) env)
                           (delay-memo-it (first-operand exps) env)))))
        ((cons first
               (list-of-delayed-args (rest-operands exps)
                                     (cdr delays)
                                     env))))))

(define (force-it obj)
  (cond ((thunk-memo? obj)
         (let ((result (actual-value (thunk-memo-exp obj)
                                     (thunk-memo-env obj))))
           (set-car! obj 'evaluated-thunk)
           (set-car! (cdr obj)
                     result) ; replace exp with its value
           (set-cdr! (cdr obj)
                     '()) ; forget unneeded env
           result))
        ((evaluated-thunk? obj) (thunk-value obj))
        ((thunk? obj)
         (actual-value (thunk-exp obj)
                       (thunk-env obj)))
        (else obj)))

(define (thunk? obj)
  (tagged-list? obj 'thunk))
(define (thunk-memo? obj)
  (tagged-list? obj 'thunk-memo))
(define (thunk-exp thunk) (cadr thunk))
(define (thunk-env thunk) (caddr thunk))
(define (thunk-memo-exp thunk) (cadr thunk))
(define (thunk-memo-env thunk) (caddr thunk))