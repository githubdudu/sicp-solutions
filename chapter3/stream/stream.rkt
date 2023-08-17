#lang sicp
(#%provide cons-stream stream-car stream-cdr)
; (define delay  ;use default
;   (lambda (exp) (lambda () exp)))
; (define (force delayed-object) ; use default
;   (begin (display 'self-defined)
;          (delayed-object)))
; (define (cons-stream a b) ;use default 
;   (cons a (delay b)))
(define (stream-car stream) (car stream))
(define (stream-cdr stream) (force (cdr stream)))
