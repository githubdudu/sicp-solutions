#lang sicp

; (define (text-of-quotation exp) (cadr exp))

(define (text-of-quotation exp env)
       (define (new-list pair) 
         (if (null? pair) 
             '() 
             (make-procedure 
                 '(m) 
                 (list (list 'm 'car-value 'cdr-value)) 
                 (extend-environment 
                     (list 'car-value 'cdr-value) 
                     (list (car pair) (new-list (cdr pair))) 
                     env)))) 
  
     (let ((text (cadr exp))) 
         (if (not (pair? text)) 
             text 
             (new-list text)))) 
