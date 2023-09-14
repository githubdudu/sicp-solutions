#lang sicp

;Warbucks Oliver listed four times, see "query/database.rkt"
(rule (wheel ?person)
      (and (supervisor ?middle-manager ?person)
           (supervisor ?x ?middle-manager)))

; Because there are four assertions that satisfy the `(supervisor ?x ?middle-manager)',