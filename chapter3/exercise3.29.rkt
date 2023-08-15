#lang sicp
; (define (and-gate a1 a2 output) ...)
; (define (inverter input output) ...)
(define (or-gate a1 a2 output)
  (let* ((ant-a1 (make-wire))
         (ant-a2 (make-wire))
         (ant-and (make-wire)))
    (inverter a1 ant-a1)
    (inverter a2 ant-a2)
    (and-gate ant-a1 ant-a2 ant-and)
    (inverter ant-and output)))

;; b
; the delay is the sum of and-gate-delay plus twice inverter-delay.



