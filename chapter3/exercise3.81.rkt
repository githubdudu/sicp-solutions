#lang sicp
(#%require "stream/stream.rkt" "stream/streamfunc.rkt")
(define random-init 0) ;variable x that is initialized to some fixed value random-init
(define (random-number-gen number requests-stream)
  (define (next n)
    (cons-stream
     n
     (random-number-gen (rand-update n) (stream-cdr requests-stream))))

  (let ((req (stream-car requests-stream)))
    (cond ((null? req)
           the-empty-stream)
          ((eq? req 'generate)
           (next number))
          ((and (pair? req) (eq? (car req) 'reset))
           (next (cdr req)))
          (else (error "Unknown command in stream" req)))))

(define (rand-update x) (+ x 1))
(define requests-stream
  (cons-stream
   (cons 'reset 12)
   (cons-stream 'generate
                (cons-stream (cons 'reset 100)
                             (cons-stream 'generate
                                          requests-stream)))))
(display-stream-inf (random-number-gen random-init requests-stream) 20)
