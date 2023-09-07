#lang sicp
; (define count 0)
; (define (id x) (set! count (+ count 1)) x)

; (define w (id (id 10)))

; (eval-definition exp env)
; (define-variable! w (eval (id (id 10)) env) env)
; (define-variable! w (apply (actual-value id env) ((id 10)) env) env)
; (define-variable! w (apply (lambda (x) (set! count (+ count 1)) x) ((id 10)) env) env)
; (define-variable! w (eval (set! count (+ count 1))) (eval x)) ; x=('chunk id 10)
; (define-variable! w (eval x)) ; x=('chunk id 10), count=1
; (define-variable! w ('chunk id 10)) ; x=('chunk id 10), count=1



;;; L-Eval input:
count

;;; L-Eval value:
1

;;; L-Eval input:
w

;(force-it (eval w))
;(force-it ('chunk (id 10) env))
;(id 10)
;10 ;count=2

;;; L-Eval value:
10

;;; L-Eval input:
count

;;; L-Eval value:
2
