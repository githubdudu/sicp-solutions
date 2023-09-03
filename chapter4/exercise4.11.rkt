#lang sicp

; represent a frame as a list of bindings, where each binding is a name-value pair.
(define (make-frame variables values)
  (map cons variables values))
(define (frame-variables frame) (map car frame))
(define (frame-values frame) (map cdr frame))
(define (add-binding-to-frame! var val frame)
  (set! frame (cons (cons var val) frame)))

; `extend-environment`
;Don't need to modify


;; The abstraction of frame is not good, hence we still need to modify `set-variable-value!` and
; `define-variable!

; Frame as a list of bindings, is just a table, nothing less, notiong more.
(define (set-variable-value! var val env)
  (define (env-loop env)
    (define (scan frame)
      (cond ((null? frame)
             (env-loop (enclosing-environment env)))
            ((eq? var (caar frame)) (set-cdr! (car frame) val))
            (else (scan (cdr frame)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable: SET!" var)
        (scan (first-frame env))))
  (env-loop env))

(define (define-variable! var val env)
  (let ((frame (first-frame env)))
    (define (scan frame)
      (cond ((null? frame)
             (add-binding-to-frame! var val frame))
            ((eq? var (caar frame)) (set-cdr! (car frame) val))
            (else (scan (cdr frame)))))
    (scan frame)))