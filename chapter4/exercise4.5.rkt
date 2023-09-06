#lang sicp
(cond ((assoc 'b '((a 1) (b 2))) => cadr)
      (else false))

(define (cond-recip action) (cadr action))
(define (cond-extend-clause? clause)
  (and (tagged-list? (cond-actions clause) '=>)
       (procedure? (cond-recip (cond-actions clause)))))
(define (expand-clauses clauses)
  (if (null? clauses)
      'false                          ; no else clause
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (if (cond-else-clause? first)
            (if (null? rest)
                (sequence->exp (cond-actions first))
                (error "ELSE clause isn't last -- COND->IF"
                       clauses))
            (if (cond-extend-clause? first)
                (make-if (cond-predicate first)
                         ((cond-recip (cond-actions first)) (cond-predicate first))
                         (expand-clauses rest))
                (make-if (cond-predicate first)
                         (sequence->exp (cond-actions first))
                         (expand-clauses rest)))))))