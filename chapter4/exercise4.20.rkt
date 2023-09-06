#lang sicp
(define (letrec->let exp)
  (make-let (map (lambda (x) (list (car x) '*unassigned)) (letrec-pairs-list exp))
            (append (map (lambda (x) (apply make-set! x)) (letrec-pairs-list exp))
                    (letrec-body exp))))

(define (letrec-pairs-list exp) (cadr exp))
(define (letrec-body exp) (cddr exp)) ; body might contain multiple exp


;; b 
; letrec means declare variables first and then evaluate each value/body, so in the eval process, 
; all the variables can be found.