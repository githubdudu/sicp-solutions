#lang sicp
  
(define (run-forever) (run-forever))
(define (try p)
  (if (halts? p p) (run-forever) 'halted))

; (try try) -> 'halted 
; (halts try try) -> true -> run-forever 

; (try try) -> run-forever 
; (halts try try) -> false -> 'halted