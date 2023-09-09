#lang sicp

; Original Solution
(require (not (= baker 5)))  1 2 3 4
(require (not (= cooper 1)))  2 3 4 5
(require (not (= fletcher 5))) 2 3 4
(require (not (= fletcher 1))) 
(require (> miller cooper))  (3 2) (4 2) (4 3) (5 4) (5 3) (5 2)
(require (not (= (abs (- smith fletcher)) 1))) (1 3) (1 4) (5 3) (2 4) (4 2) (5 2)
(require (not (= (abs (- fletcher cooper)) 1))) 

; smith fletcher cooper (1 3 5)X (1 4 2)yes (5 3 1)X (2 4 1)X (4 2 5)X (5 2 4)X
; baker miller (3 5)yes (5 3)X 

; 4.38 Solution
(require (not (= baker 5)))  1 2 3 4
(require (not (= cooper 1)))  2 3 4 5
(require (not (= fletcher 5))) 2 3 4
(require (not (= fletcher 1))) 
(require (> miller cooper))  (3 2) (4 2) (4 3) (5 4) (5 3) (5 2)
(require (not (= (abs (- fletcher cooper)) 1))) 

; miller fletcher cooper (3 4 2) (3 5 2)X (4 5 2)X (4 5 3)X (4 1 3)X (5 2 4) (5 1 4)X (5 1 3)X (5 4 2)
; baker smith (1 5) (1 3) (3 1) 
; Total 1 + 2 + 2 = 5