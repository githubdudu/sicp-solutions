#lang sicp
(#%require "eva-lazy.rkt" racket/lazy-require)
(lazy-require ["eva-env.rkt" (prompt-for-input
                              setup-environment
                              announce-output
                              user-print)])
(#%provide driver-loop)

;; Environments
(define input-prompt ";;; L-Eval input:")
(define output-prompt ";;; L-Eval value:")
(define (driver-loop)
  (prompt-for-input input-prompt)
  (let ((input (read)))
    (let ((output
           (actual-value
            input the-global-environment)))
      (announce-output output-prompt)
      (user-print output)))
  (driver-loop))
(define the-global-environment (setup-environment))