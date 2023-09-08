#lang sicp
; Question so boring.
(define (user-print object)
  (if (compound-procedure? object)
      (display
       (list 'compound-procedure
             (procedure-parameters object)
             (procedure-body object)
             '<procedure-env>))
      (if (tagged-list? object 'cons)
          (disp-cons object)
          (display object))))

(define (disp-cons obj)
  (define (helper obj depth) (
                              (let ((user-car (lambda (z)
                                                (force-it (lookup-variable-value 'x (procedure-environment (cdr z))))))
                                    (user-cdr (lambda (z)
                                                (force-it (lookup-variable-value 'y (procedure-environment (cdr z)))))))
                                (cond
                                  ((>= depth 10)
                                   (display "... )"))
                                  ((null? obj)
                                   (display ""))
                                  (else
                                   (let ((cdr-value (user-cdr obj)))
                                     (display "(")
                                     (display (user-car obj))
                                     (if (tagged-list? cdr-value 'cons)
                                         (begin
                                           (display " ")
                                           (disp-cons cdr-value))
                                         (begin
                                           (display " . ")
                                           (display cdr-value)))
                                     (display ")")))))))
  (helper obj 0))