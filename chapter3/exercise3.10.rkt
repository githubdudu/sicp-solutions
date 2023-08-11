#lang racket

(define (make-withdraw initial-amount)
  ((lambda (balance)
     (lambda (amount)
       (if (>= balance amount)
           (begin (set! balance (- balance amount))
                  balance)
           "Insufficient funds")))
   initial-amount))
(define W1 (make-withdraw 100))
(W1 50)
(define W2 (make-withdraw 100))

; E1 -> Global ;initial-amount=100 ;  ((lambda (balance) ...) initial-amount) 
; E2 -> E1 ;balance=initial-amount;  (lambda (amount) ...)
; E3 -> E2 ;amount=50; being evaluated -> (if ...)  

; E4 -> Global (lambda (balance))
; E5 -> E4 (lambda (amount))

;;How do the environment structures differ for the two versions?
; Two additional frame are created and used as the repository of local state: initial-amount