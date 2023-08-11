#lang racket

;; Where is the local state for acc kept? 
; Frame
; 1. The local states for the two accounts each have their own environments.
; 2. The only part of the environment structure that is shared between 'acc' and 'acc2' is the global environment.