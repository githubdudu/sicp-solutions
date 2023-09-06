#lang sicp
((lambda (n)
   ((lambda (fact) (fact fact n))
    (lambda (ft k)
      (if (= k 1)
          1
          (* k (ft ft (- k 1)))))
    ))
 10)

;; Evaluating

((lambda (ft k)
   (if (= k 1)
       1
       (* k (ft ft (- k 1)))))
 (lambda (ft k)
   (if (= k 1)
       1
       (* k (ft ft (- k 1)))))
 10)

(if (= 10 1)
    1
    (* 10 ((lambda (ft k)
             (if (= k 1)
                 1
                 (* k (ft ft (- k 1)))))
           (lambda (ft k)
             (if (= k 1)
                 1
                 (* k (ft ft (- k 1)))))
           9)))


; fib
(define fib
  (lambda (n)
    ((lambda (fact) (fact fact n 0 0 1))
     (lambda (ft k count a b)
       (if (= k count)
           a
           (ft ft k (+ count 1) b (+ a b)))))))
(fib 5)
(fib 6)

;; b


(define (f x)
  ((lambda (even? odd?) (even? even? odd? x))
   (lambda (ev? od? n)
     (if (= n 0) true (od? ev? od? (- n 1))))
   (lambda (ev? od? n)
     (if (= n 0) false (ev? ev? od? (- n 1))))))

(f 1)
(f 2)
(f 3)