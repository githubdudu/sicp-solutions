#lang sicp

; 1 moore -> Lorna (2 3 5)
; 2 downing -> Melissa (4 hood)
; 3 hall -> Rosalind (2 5)
; 4 hood -> Gabrielle (2 3 5)
; 5 parker -> mary Ann Moore (1 moore)
(define (lornas-father)
  (let ((lorna (amb 1 2 3 4 5)) (melissa (amb 4))
                                (rosalind (amb 1 2 3 4 5)) (gabrielle (amb 1 2 3 4 5))
                                (mary (amb 1)))
    (require (distinct? (list lorna melissa rosalind gabrielle mary)))
    (require (not (= lorna 1)))
    (require (not (= rosalind 3)))
    (require (not (= gabrielle 4)))
    (require (= (yacht gabrielle) 5))

    (list (list 'lorna lorna) (list 'melissa melissa)
          (list 'rosalind rosalind) (list 'gabrielle gabrielle)
          (list 'mary mary))))
(define (yacht n)
  (cond ((= n 1) (amb 2 3 5))
        ((= n 2) (amb 4))
        ((= n 3) (amb 2 5))
        ((= n 4) (amb 2 3 5))
        ((= n 5) (amb 1))))

;  lorna melissa rosalind gabrielle mary
;=> (2 4 5 3 1)
; Lorna's father is Downing.

; If we don't know Mary Ann's family name is Moore, we get: 
; Lorna's father is Downing, or Parker (Since Gabrielle's father can be Moore or Hall)