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

; exercise 4.7
(define (make-let pairs-list body)
  (list 'let pairs-list body))
(define (let*-pairs-list exp) (cadr exp))
(define (let*-body exp) (cddr exp))
(define (let*->nested-lets exp)
  (nest-lets (let*-pairs-list exp) (let*-body exp)))
(define (nest-lets pairs body)
  (if (null? pairs)
      (sequence->exp body)  ;sequence->exp is necessary
      (make-let (list (car pairs))
                (nest-lets (cdr pairs) body))))

;; The reason why a let* expression can be rewritten as a set of nested let expressions,
; is that `nested lets` make it that each binding is made in an environment in
; which all of the preceding bindings are visible.