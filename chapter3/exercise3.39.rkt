#lang sicp
(define x 10)

(define s (make-serializer))
(parallel-execute
 (s (lambda () (set! x (* x x))))
 (s (lambda () (set! x (+ x 1)))))

 (define s2 (make-serializer))
(parallel-execute
 (lambda () (set! x ((s (lambda () (* x x))))))
 (s (lambda () (set! x (+ x 1)))))

;; 101 and 121 for execution not be interleaved 
; 100, P2 runs completely between the times P1 access x and when P1 performs the assignment.
; 11, P2 begin run after (* x x), and x is set to 11 before set to 100.