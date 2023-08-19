#lang sicp
;; s00 s01 s02 s03 s04 ...
;      s00 s01 s02 s03 s04 ...
;; To compute the first element, we need two steps. Call `(sqrt-stream x)` twice, outside and inside.
; To compute the second element, we need to compute the first element.
; So it expands exponentially O(n^2)

;; In other words, `(sqrt-stream x )` is a procedure. While `guess` is a stream data. (a pair)