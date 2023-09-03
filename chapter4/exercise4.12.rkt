#lang sicp

(define (scan var val vars vals env proc1 proc2)
  (cond ((null? vars) (proc1 env var val))
        ((eq? var (car vars)) (proc2 vals val))
        (else (scan (cdr vars) (cdr vals)))))

(define (lookup-variable-value var env)
  (define (env-loop env)
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (scan var
                0
                (frame-variables frame)
                (frame-values frame)
                env
                (lambda (env _var _val) (env-loop (enclosing-environment env)))
                (lambda (x y) (car x))))))
  (env-loop env))

(define (set-variable-value! var val env)
  (define (env-loop env)
    (if (eq? env the-empty-environment)
        (error "Unbound variable: SET!" var)
        (let ((frame (first-frame env)))
          (scan var
                val
                (frame-variables frame)
                (frame-values frame)
                env
                (lambda (env _var _val) (env-loop (enclosing-environment env)))
                (lambda (x y) (set-car! x y))))))
  (env-loop env))

(define (define-variable! var val env)
  (let ((frame (first-frame env)))
    (scan var
          val
          (frame-variables frame)
          (frame-values frame)
          env
          (lambda (env var val) (add-binding-to-frame! var val (first-frame env)))
          (lambda (x y) (set-car! x y)))))