#lang sicp
(define (if-fail? exp)
  (tagged-list? exp 'if-fail))
(define (if-fail-cond exp) (cadr exp))
(define (if-fail-alt exp) (caddr exp))

; Modify from `analyze-if'.
(define (analyze-if-fail exp)
  (let ((cproc (analyze (if-fail-cond exp)))
        (aproc (analyze (if-fail-alt exp))))
    (lambda (env succeed fail)
      (cproc env
             succeed
             (lambda ()
               (aproc env succeed fail))))))