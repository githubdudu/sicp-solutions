#lang sicp
(let ((a 1))
  (define (f x)
    (define b (+ a x))
    (define a 5)
    (+ a b))
  (f 10))
; The MIT implementors of Scheme support Alyssa on the following grounds: Eva is
; in principle correct—the definitions should be regarded as simultaneous. But it seems
; difficult to implement a general, efficient mechanism that does what Eva requires. In
; the absence of such a mechanism, it is beer to generate an error in the difficult cases
; of simultaneous definitions (Alyssa’s notion) than to produce an incorrect answer (as
; Ben would have it)