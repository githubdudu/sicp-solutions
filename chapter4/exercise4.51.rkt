#lang sicp

((assignment-perm? exp) (analyze-assignment exp))
(define (assignment-perm? exp)
  (tagged-list? exp 'permanent-set!))

; Just modify the `analyze-assignment' procedure, remove the failure callback procedure.
(define (analyze-assignment-perm exp)
  (let ((var (assignment-variable exp))
        (vproc (analyze (assignment-value exp))))
    (lambda (env succeed fail)
      (vproc env
             (lambda (val fail2) ; *1*
               (set-variable-value! var val env)
               (succeed 'ok fail2))
             fail))))

