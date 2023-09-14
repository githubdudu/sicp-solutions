#lang sicp

(sum ?amount
     (and (job ?x (computer programmer))
          (salary ?x ?amount)))

(accumulation-function <variable>
                       <query pattern>)

; Ben has realized that one man's salary might be count multiple times. 
; We can build a database with unique names and filter the result by these names to make sure every name will be count only once.