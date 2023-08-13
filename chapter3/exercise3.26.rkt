#lang sicp
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (set-left-branch! tree value) (set-car! (cdr tree) value))
(define (set-right-branch! tree value) (set-car! (cddr tree) value))
(define (make-tree entry left right)
  (list entry left right))

;; Further more, a comparator can be applied:
(define (bigger? S1 S2)
  (string>? (if (symbol? S1)
                (symbol->string S1)
                (number->string S1))
            (if (symbol? S2)
                (symbol->string S2)
                (number->string S2))))
(define (smaller? S1 S2)
  (bigger? S2 S1))
;; Modification of `assoc` is necessary
(define (assoc key records)
  (cond ((null? records) false)
        ((equal? key (car (entry records))) (entry records))
        ((smaller? key (car (entry records)))(assoc key (left-branch records)))
        ((bigger? key (car (entry records)))(assoc key (right-branch records)))))


(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup key)
      (let ((record
             (assoc key (cdr local-table))))
        (if record
            (cdr record)
            false)))
    (define (insert! key value)
      (if (null? (cdr local-table))
          (set-cdr! local-table (make-tree (cons key value) '() '()))
          (insert-helper! key value (cdr local-table))))
    (define (insert-helper! key value tree)
      (let ((key2
             (car (entry tree)))
            (new-tree
             (make-tree (cons key value) '() '())))
        (cond ((equal? key key2) (set-cdr! (entry tree) new-tree))
              ((smaller? key key2)
               (if (null? (left-branch tree))
                   (set-left-branch! tree new-tree)
                   (insert-helper! key value (left-branch tree))))
              ((bigger? key key2)
               (if (null? (right-branch tree))
                   (set-right-branch! tree new-tree)
                   (insert-helper! key value (right-branch tree))))))
      'ok)

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            ((eq? m 'print) local-table)
            (else (error "Unknown operation: TABLE" m))))
    dispatch))

; TEST
(define t (make-table))
((t 'insert-proc!) 'a 1)
((t 'insert-proc!) '1 2)
((t 'insert-proc!) 'c 3)

((t 'lookup-proc) 'a)
((t 'lookup-proc) 'b)
((t 'lookup-proc) 'c)
((t 'lookup-proc) 'd)
(t 'print)
