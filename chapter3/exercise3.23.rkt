#lang sicp

;; One level of abstraction: select and to modify the front and rear pointers of a queue:
(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))
(define (make-queue) (cons '() '()))

;; Next level abstraction, a new node instead of a new pair as the item
(define (make-item item) (cons (cons item '()) '()))
(define (set-cdar! pair item)
  (if (null? pair)
      (error "PAIR expected" pair)
      (set-cdr! (car pair) item)))
;;
(define (empty-deque? deq)
  (or (null? (front-ptr deq))
      (null? (rear-ptr deq))))
(define (front-deque deq)
  (if (empty-deque? deq)
      (error "FRONT called with an empty dequeue" deq)
      (car (front-ptr deq))))
(define (rear-deque deq)
  (if (empty-deque? deq)
      (error "REAR called with an empty dequeue" deq)
      (car (rear-ptr deq))))

; front-insert-deque!, rear-insert-deque!, front-delete-deque!, and rear-delete-deque!
(define (front-insert-deque! deq item)
  (let ((new-pair (make-item item)))
    (cond ((empty-deque? deq)
           (set-front-ptr! deq new-pair)
           (set-rear-ptr! deq new-pair)
           deq)
          (else
           (set-cdr! new-pair (front-ptr deq))
           (set-cdar! (front-ptr deq) new-pair)
           (set-front-ptr! deq new-pair)
           deq))))
(define (rear-insert-deque! deq item)
  (let ((new-pair (make-item item)))
    (cond ((empty-deque? deq)
           (set-front-ptr! deq new-pair)
           (set-rear-ptr! deq new-pair)
           deq)
          (else
           (set-cdr! (rear-ptr deq) new-pair)
           (set-cdar! new-pair (rear-ptr deq))
           (set-rear-ptr! deq new-pair)
           deq))))

(define (front-delete-queue! deq)
  (cond ((empty-deque? deq)
         (error "DELETE! called with an empty queue" deq))
        (else (set-front-ptr! deq (cdr (front-ptr deq)))
              (if (not (null? (front-ptr deq)))
                  (set-cdar! (front-ptr deq) nil))
              deq)))
(define (rear-delete-queue! deq)
  (cond ((empty-deque? deq)
         (error "DELETE! called with an empty queue" deq))
        (else (set-rear-ptr! deq (cdar (rear-ptr deq)))
              (if (not (null? (rear-ptr deq)))
                  (set-cdr! (rear-ptr deq) nil))
              deq)))
;; TEST
(define q (make-queue))
(rear-insert-deque! q 'a) ;a
(front-insert-deque! q 'b) ;b a
(front-deque q) ;b
(rear-deque q) ;a

(rear-insert-deque! q 'c)  ;b a c
(front-delete-queue! q)  ;a c
(rear-insert-deque! q 'd)  ;a c d
(rear-delete-queue! q)  ;a c
(front-delete-queue! q)  ;c