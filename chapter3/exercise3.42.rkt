#lang sicp

;; Looks like it's safe to change, but not 100% sure. 
;In changed version, all the withdraw in one account used the same `protected withdraw`, 
;Hence there will be no concurrency between different withdraws. It may happen that a function is interleaved by itself.
