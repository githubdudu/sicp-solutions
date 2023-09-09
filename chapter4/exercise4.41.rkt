#lang sicp
(define (iter-a baker)
  (define (iter-b cooper)
    (define (iter-c fletcher)
      (define (iter-d miller)
        (define (iter-e smith)
          (if (= smith 6)
              false
              (if (and (not (equal? (abs (- smith fletcher)) 1))
                       (not (equal? (abs (- fletcher cooper)) 1))
                       (not (= baker 5))
                       (not (= cooper 1))
                       (not (= fletcher 5))
                       (not (= fletcher 1))
                       (distinct? (list baker cooper fletcher miller smith))
                       (> miller cooper))
                  (list (list 'baker baker) (list 'cooper cooper) (list 'fletcher fletcher) (list 'miller miller) (list 'smith smith))
                  (iter-e (+ smith 1)))))
        (if (= miller 6)
            false
            (let ((ans (iter-e 1)))
              (if ans
                  ans
                  (iter-d (+ miller 1))))))
      (if (= fletcher 6)
          false
          (let ((ans (iter-d 1)))
            (if ans
                ans
                (iter-c (+ fletcher 1))))))
    (if (= cooper 6)
        false
        (let ((ans (iter-c 1)))
          (if ans
              ans
              (iter-b (+ cooper 1))))))

  (if (= baker 6)
      false
      (let ((ans (iter-b 1)))
        (if ans
            ans
            (iter-a (+ baker 1))))))


(define (distinct? items)
  (cond ((null? items) true)
        ((null? (cdr items)) true)
        ((member (car items) (cdr items)) false)
        (else (distinct? (cdr items)))))
(iter-a 1)