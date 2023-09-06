#lang sicp
;; add this code in analyze
((unless? expr) (analyze (unless->if expr)))

;; unless expression is very similar to if expression.

(define (unless? expr) (tagged-list? expr 'unless))
(define (unless-predicate expr) (cadr expr))
(define (unless-consequnce expr)
  (if (not (null? (cdddr expr)))
      (cadddr expr)
      'false))
(define (unless-alternative expr) (caddr expr))

(define (unless->if expr)
  (make-if (unless-predicate expr) (unless-consequence expr) (unless-alternative expr)))

;As for actual higher order procedures here's a very clever example borrowed from Xueqiao Xu, binary pattern matching:
(define select-y '(#t #f #t #t))
(define xs '(1 3 5 7))
(define ys '(2 4 6 8))
(define selected (map unless select-y xs ys))