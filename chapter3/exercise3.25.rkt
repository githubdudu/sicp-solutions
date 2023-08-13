#lang sicp
;; Pass the tough test from
;; https://github.com/roytobin/ntable/blob/2db4e25f74e71f0f75808556db0b48a85f784391/stim#L2C2-L2C2
(#%provide make-table insert! lookup)
;; Use two pairs as a node
(define (key node) (car node))
(define (value node) (cadr node))
(define (content node) (cddr node))
(define (make-node key value) (list key value))
(define (set-value! node value) (set-car! (cdr node) value))
(define (set-content! node value) (set-cdr! (cdr node) value))
;; Modify the local tables in the book.
(define (make-table)
  (let ((local-table (make-node '*table* '())))
    (define (lookup key-list)
      (lookup-helper key-list local-table))
    (define (lookup-helper key-list table)
      (if (null? key-list)
          (value table)
          (let ((subtable
                 (assoc (car key-list) (content table))))
            (if subtable
                (lookup-helper (cdr key-list) subtable)
                false))))
    (define (insert! key-list value)
      (insert-helper! key-list value local-table))
    (define (insert-helper! key-list value table)
      (if (null? key-list)
          (set-value! table value)
          (let ((subtable
                 (assoc (car key-list) (content table))))
            (if subtable
                (insert-helper! (cdr key-list) value subtable)
                (begin (set-content! table
                               (cons (make-node (car key-list) #f)
                                     (content table)))
                 (insert-helper! (cdr key-list) value (car (content table)))))))
      'ok)

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            ((eq? m 'print) local-table)
            (else (error "Unknown operation: TABLE" m))))
    dispatch))

; TEST
(define t (make-table))
((t 'insert-proc!) '(math +) 43)
((t 'insert-proc!) '(math -) 45)
((t 'insert-proc!) '(math -) 44)
((t 'insert-proc!) '(math *) 42)
((t 'insert-proc!) '(letters a) 97)
((t 'insert-proc!) '(letters b) 98)
((t 'insert-proc!) '(let) 98)


((t 'lookup-proc) '(math +))
((t 'lookup-proc) '(math -))
((t 'lookup-proc) '(math *))
((t 'lookup-proc) '(letters a))
((t 'lookup-proc) '(letters b))
((t 'lookup-proc) '(letters c))
(t 'print)

(define (insert! t list value)
  ((t 'insert-proc!) list value))
(define (lookup t list)
  ((t 'lookup-proc) list))
