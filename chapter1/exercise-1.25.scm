(define (expmod-modified base exp m)
  (remainder (fast-expt base exp) m))
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
(define (even? n)
  (= (remainder n 2) 0))


(define (expmod base exp m)
(cond ((= exp 0) 1)
      ((even? exp)
        (remainder (square (expmod base (/ exp 2) m))
                  m))
      (else
        (remainder (* base (expmod base (- exp 1) m))
                  m))))    
(define (report-elapsed-time start-time) 
  (display " *** ")
  (display (- (runtime) start-time))
  (newline)) 

; Test the speed 
(define start-time (runtime)) 
(expmod 999999 1000000 1000000) 
(report-elapsed-time start-time)
; 0

(define start-time (runtime)) 
(expmod-modified 999999 1000000 1000000) 
(report-elapsed-time start-time)
; 70.7