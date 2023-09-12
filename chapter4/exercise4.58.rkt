#lang sicp

(rule (big-shot ?person)
      (or (not (supervisor ?person ?sup))
          (and (supervisor ?person ?sup)
               (job ?person (?division . ?type-1))
               (not (job ?sup (?division . ?type-2))))))