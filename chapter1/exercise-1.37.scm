(define (cont-frac n d k)
  (define (iter k frac)
    (if (= 0 k) 
        frac
        (iter (- k 1) (/ (n k) (+ (d k) frac)))))
  (iter k 0))

(define (test k count)
  (if (= count k)
      #t
      (begin 
        (display (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k))
        (newline)
        (test (+ k 1) count))))  
; How large must you make
; k in order to get an approximation that is accurate to
; 4 decimal places?
; -- 11
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10) ; .6179775280898876
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 100) ; .6180339887498948
(test 1 10)
(test 1 20)
(define (cont-frac2 n d k)
  (define (frac-rec i) 
     (/ (n i) 
        (+ (d i) 
           (if (> i k) 
               0 
               (frac-rec (+ i 1)))))) 
  (frac-rec 1)) 