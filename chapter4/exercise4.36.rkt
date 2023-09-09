#lang sicp

; Just replacing is not adequate. Because i and j will not change, only generate many k.

(define (all-pythagorean-triple)
  (let ((k (an-integer-starting-from 1)))
    (let ((j (an-integer-between 1 k)))
      (let ((i ( an-integer-between 1 j)))
        (require (= (+ (* i i) (* j j)) (* k k)))
        (list i j k)))))
