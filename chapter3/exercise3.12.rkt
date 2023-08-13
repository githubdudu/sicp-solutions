#lang sicp
(define x (list 'a 'b))
(define y (list 'c 'd))
  ;         +-----++-----+  +-----++-----+                                                                                                    
  ; x ----->|  |  ||  ----->|  |  ||--\--|                                                                                                    
  ;         +--|--++-----+  +--|--++-----+                                                                                                    
  ;            |               |                                                                                                              
  ;            v               v                                                                                                              
  ;            a               b                                                                                                              
                                                                                                                                            
  ;         +-----++-----+  +-----++-----+                                                                                                    
  ; y ----->|  |  ||  ----->|  |  ||--\--|                                                                                                   -
  ;         +--|--++-----+  +--|--++-----+                                                                                                    
  ;            |               |                                                                                                              
  ;            v               v                                                                                                              
  ;            c               d             


(define z (append x y))
  ;         +-----++-----+  +-----++-----+          +-----++-----+  +-----++-----+                                                            
  ; x ----->|  |  ||  ----->|  |  ||--\--|  y ----->|  |  ||  ----->|  |  ||--\--|                                                            
  ;         +--|--++-----+  +--|--++-----+        > +--|--++-----+  +--|--++-----+                                                            
  ;            |               |                -/     |               |                                                                      
  ;            v               v               /       v               v                                                                      
  ;            a               b             -/        c               d                                                                      
  ;                                         /                                                                                                 
  ;            ^               ^          -/                                                                                                  
  ;            |               |         /                                                                                                   -
  ;         +--|--++-----+  +--|--++----/+                                                                                                    
  ; z ----->|  |  ||  ----->|  |  ||  /  |                                                                                                    
  ;         +-----++-----+  +-----++-----+  

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)
(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(cdr x)
;(b)
(define w (append! x y))
  ;         +-----++-----+  +-----++-----+          +-----++-----+  +-----++-----+                                                            
  ; x ----->|  |  ||  ----->|  |  || -------------> |  |  ||  ----->|  |  ||--\--|                                                            
  ;         +--|--++-----+  +--|--++-----+    y --->+--|--++-----+  +--|--++-----+                                                            
  ;        >   |               |                       |               |                                                                      
  ;      -/    v               v                       v               v                                                                      
  ;    -/      a               b                       c               d                                                                      
  ; w /                                                                                                                                       
                            

(cdr x)
;(b c d)