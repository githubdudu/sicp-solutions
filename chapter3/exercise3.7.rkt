#lang racket
(require "exercise3.3.rkt")

(define (make-joint account pw new-pw)
  (lambda (try-pw m)
    (if (eq? try-pw new-pw)
        (account pw m)
        (error "Incorrect password"))))

(define peter-acc (make-account 100 'open-sesame))
(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))

((paul-acc 'rosebud 'withdraw) 40)
