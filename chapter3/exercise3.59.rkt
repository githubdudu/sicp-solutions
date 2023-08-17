#lang sicp
(#%require "stream/streamfunc.rkt" "stream/streamop.rkt" "stream/stream.rkt")
(#%provide integrate-series exp-series cosine-series sine-series display-stream-inf)
(define (integrate-series stream-a)
  (stream-map / stream-a integers))

(define exp-series
  (cons-stream 1 (integrate-series exp-series)))
(define cosine-series (cons-stream 1 (integrate-series (scale-stream sine-series -1))))
(define sine-series (cons-stream 0 (integrate-series cosine-series)))

(define (stream-for-each-inf proc s n)
  (if (= n 0)
      'done
      (begin (proc (stream-car s))
             (stream-for-each-inf proc (stream-cdr s) (- n 1)))))
(define (display-stream-inf s n)
  (stream-for-each-inf display-line s n))

; (display-stream-inf exp-series 10)
; (display-stream-inf cosine-series 10)
; (display-stream-inf sine-series 10)
