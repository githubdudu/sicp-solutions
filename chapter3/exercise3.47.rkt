#lang sicp
;; Mutex
(define (make-mutex)
  (let ((cell (list false)))
    (define (the-mutex m)
      (cond ((eq? m 'acquire)
             (if (test-and-set! cell)
                 (the-mutex 'acquire))) ; retry
            ((eq? m 'release) (clear! cell))))
    the-mutex))
(define (clear! cell) (set-car! cell false))
(define (test-and-set! cell)
  (if (car cell) true (begin (set-car! cell true) false)))

;; Semaphore
;; a
(define (make-semaphore n)
  (let ((size 0) (mutex (make-mutex)))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
             (if (< size n)
                 ((mutex 'acquire)
                  (set! size (+ size 1))
                  (mutex 'release))
                 (the-semaphore 'acquire))) ; retry
            ((eq? m 'release)
             ((mutex 'acuire)
              (set! size (- size 1))
              (mutex 'release)))))
    the-semaphore))

;; b
(define (make-semaphore2 n)
  (define (make-mutex-list size prev)
    (if (= n size)
        prev
        (make-mutex-list (+ 1 size) (cons false prev))))
  (let ((mutex-list (make-mutex-list n '())))
    (define (acquire ls)
      (if (null? ls)
          (acquire mutex-list)
          (if (test-and-set! ls)
              (acquire (cdr ls)))))
    (define (release ls)
      (if (car ls)
          (clear! ls)
          (release (cdr ls))))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire) (acquire mutex-list))
            ((eq? m 'release) (release mutex-list))))
    the-semaphore))