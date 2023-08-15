#lang sicp

;; Compare the difference
; In `accept-action-procedure!`, proc is the new procedure.
; For example, in `and-gate`, the `and-action-procedure` is the very procedure that will be run.
; So `after-delay` will be called. What it does is `add-to-agenda!`.

(define (accept-action-procedure! proc)
  (set! action-procedures
        (cons proc action-procedures))
  (proc))
(define (accept-action-procedure2! proc)
  (set! action-procedures
        (cons proc action-procedures)))

; (or-gate a b d)
; (and-gate a b c)
; (inverter c e)
; (and-gate d e s)
;(add-to-agenda! 5 (lambda () (set-signal! d new-value))) a b -> d
;(add-to-agenda! 3 (lambda () (set-signal! c new-value))) a b -> c
;(add-to-agenda! 2 (lambda () (set-signal! e new-value))) c -> e
;(add-to-agenda! 3 (lambda () (set-signal! s new-value))) d e -> s
; 
;; Above agenda will be run in sequence: 
; c -> e, at this time c and e aligned
; a b -> c, at this time a b c e aligned
; d e -> s, at this time d e s aligned
; a b -> d, at this time abcdes all aligned.


;; If we try this below, we can see that the output value changes twice. The first change is because of the
;; code `(proc)`,that add a segment into the agenda (but not execute yet). This change will make
;; the inputs and outputs of inverter aligned before the simulation begin.  
(define input-1 (make-wire))
(define input-2 (make-wire))
(define sum (make-wire))
(probe 'sum sum)
; sum 0 New-value = 0

(inverter input-1 sum)
(set-signal! input-1 1)
(propagate)
; sum 2 New-value = 1        
; sum 2 New-value = 0

;; Before `set-signal!`, we can also run (propagate), at this time all the agendas are that are put into 
;; by (proc), which can be seen as a initialization
;; Although the data structure of agenda (sorted by time and queue) makes the result same, there are some drawback.
;; 1. Misconfuse the initial part with simulation part.
;; 2. The result may flip in one time segment. 