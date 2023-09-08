#lang sicp
; Like it said in the text:
; In fact, even accessing
; the car or cdr of a lazy pair need not force the value of a list element.

; I can take advantage of this to implement a lazy-binary-tree, because car is also lazy.