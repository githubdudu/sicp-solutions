#lang sicp
; I think we should remove only the binding in the first
; frame of the environment. Just as `define-variable!` just add new binding in the first frame
(define (make-unbound! var env)
  (let ((frame (first-frame env)))
    (define (scan vars vals)
      (cond ((null? (cdr vars))
             (error "Unbound variable: make-unbound!" var))
            ((eq? var (cadr vars)) (set-cdr! vars (cddr vars)))
            (else (scan (cdr vars) (cdr vals)))))
    (scan (cons '() (frame-variables frame)) (cons '() (frame-values frame)))))
