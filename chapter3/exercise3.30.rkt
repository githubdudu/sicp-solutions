#lang sicp
; (define (full-adder a b c-in sum c-out) ...)
(define (ripple-carry-adder Ak Bk Sk C)
  (if (= (length Ak) 1)
      (full-adder (car Ak) (car Bk) 0 (car Sk) C)
      (let ((Ck (make-wire)))
        (full-adder (car Ak) (car Bk) Ck (car Sk) C)
        (ripple-carry-adder (cdr Ak) (cdr Bk) (cdr Sk) Ck))))

;;Delay:
; From the full adder below, we can know that the delay from Cin to Cout is:
; (define Cin-Cout (+ (Max or-gate-delay (+ inverter-delay and-gate-delay)) (and-gate-delay) (and-gate-delay) (or-gate-delay)))
; Total delay would be
; (* n Cin-Cout)


;                  +----------+     +----------+     +----------+
;                  | AND Gate |     | OR Gate  |     | Inverter |
;                  |          |     |          |     |          |
;                  |          |     |          |     |          |
;                  +----------+     +----------+     +----------+




;                                                               +----------+
;                                                     A------|--- OR Gate  |                   +----------+
;                                                            |  |          |-------------------- AND Gate |
;                                                         +------          |                   |          --------SUM
;                                                         |  |  +----------+                   -          |
;                                                         |  |                   +----------+ /+----------+
;                                                         |  |                   | Inverter |/
;                                                         |  |                +---          /
;             +----------+                                |  |  +----------+  |  |          |
;   B------|--- OR Gate  |                   +----------+ |  +--- AND Gate |  |  +----------+
;          |  |          |-------------------- AND Gate | |     |          |--------------+
;       +------          |                   |          --|------          |              |
;       |  |  +----------+                   -          |       +----------+              |
;       |  |                   +----------+ /+----------+                                 |
;       |  |                   | Inverter |/                                              |
;       |  |                +---          /                                         +-----|----+
;       |  |  +----------+  |  |          |                                         | OR Gate  |
;       |  +--- AND Gate |  |  +----------+                                         |          |------------------Cout
;       |     |          |----------------------------------------------------------|          |
; Cin---|------          |                                                          +----------+
;             +----------+

