#lang sicp
; (Hint: In
; the exchange problem, each process knows in advance which
; accounts it will need to get access to. Consider a situation
; where a process must get access to some shared resources
; before it can know which additional shared resources it will
; require.)

;; If a process need several steps to access many accounts, and it may not know which acount to access in the
; next step. So it can't protect all the accounts in advance. Thus, deadlock may happen when some other
; user use and lock the accounts that it will be using.