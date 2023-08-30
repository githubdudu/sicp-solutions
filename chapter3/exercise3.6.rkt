#lang sicp
(define random-init 0) ;variable x that is initialized to some fixed value random-init
(define rand
  (let ((x random-init))
    (define (dispatch m)
      (cond ((eq? m 'generate) (set! x (rand-update x))
                               x)
            ((eq? m 'reset) (lambda (init) (set! x init)))
            (else (error "Unknown request: RAND"
                         m))))
    dispatch))

(define (rand-update x) (+ x 1))

(rand 'generate)
; 1
(rand 'generate)
; 2
((rand 'reset) 0)
; 0
(rand 'generate)
; 1