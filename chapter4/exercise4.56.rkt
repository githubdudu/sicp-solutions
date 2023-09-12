#lang sicp

;;the names of all people who are supervised by Ben Bitdiddle, together with their addresses;
(and (supervisor ?person (Ben Bitdiddle))
     (address ?person ?where))
; b. all people whose salary is less than Ben Bitdiddle’s, together with their salary and Ben Bitdiddle’s salary;
(and (salary ?person ?amount)
     (salary (Ben Bitdiddle) ?ben-bit-amount)
     (lisp-value > ?amount ?ben-bit-amount))
; c. all people who are supervised by someone who is not in the computer division, together with the supervisor’s name and job
(and (supervisor ?person ?supervisor)
     (not (job ?supervisor (computer . ?type)))
     (job ?supervisor ?job))