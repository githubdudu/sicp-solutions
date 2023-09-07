#lang sicp

;; operator might be treated as an operand and wrapped in `delay-it` as chunk, so we need to unwrap it by `force-it`.11 
;Example
(map + 1 2)
