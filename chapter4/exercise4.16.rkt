#lang sicp
(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (car vars))
             (if (eq? '*unassigned* (car vals))
                 (error "*unassigned variable" (car vars) (car vals))
                 (car vals)))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))

;;b
(define (make-let pairs-list body)
  (list 'let pairs-list body))
(define (make-assignment var exp)
  (list 'set! var exp))

(define (scan-out-defines body)
  (let ((defs (filter definitions? body)))
    (if (null? defs) ;; Important. To avoid infinite loop
        body
        (make-let (map (lambda (x) (list (definition-variable x) '*unassigned))
                       defs)
                  (map (lambda (x) (if (definition? x)
                                       (make-assignment (definition-variable x) (definition-value x))
                                       x)))))))

;;c
(define (make-procedure parameters body env)
  (list 'procedure parameters (scan-out-defines body) env))