#lang racket
;; Queue represented by a pair, which constructed with front pointer and rear pointer.
;; So the Lisp printer just print the queue and the last item.
(define (print-queue queue)
  (car queue))