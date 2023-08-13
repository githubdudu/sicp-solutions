#lang sicp
; (define (make-table same-key?)
;...
; Just change the `assoc`
;...)

; replace `equal?` with `same-key?`
(define (assoc key records same-key?)
  (cond ((null? records) false)
        ((same-key? key (caar records)) (car records))
        (else (assoc key (cdr records)))))