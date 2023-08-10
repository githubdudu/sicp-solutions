#lang sicp

;; The combination of 3.2 and 3.3
(define (make-account balance password)
  (define attempt-times 0)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (call-the-cops amount) (display "911!! The cops are on the way."))
  (define (dispatch password-unknown m)
    (if (eq? password password-unknown)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request: MAKE-ACCOUNT"
                           m)))
        (if (>= attempt-times 7)
            call-the-cops
            (begin
              (set! attempt-times (+ 1 attempt-times))
              (error "Incorrect password")))))

    dispatch)
  ;; Example
  (define acc (make-account 100 'secret-password))
  ((acc 'secret-password 'withdraw) 40)
  ;60
  ((acc 'some-other-password 'deposit) 50)
  ;"Incorrect password"