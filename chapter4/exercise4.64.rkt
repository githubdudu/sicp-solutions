#lang sicp
(rule (outranked-by ?staff-person ?boss)
      (or (supervisor ?staff-person ?boss)
          (and (supervisor ?staff-person ?middle-manager)
               (outranked-by ?middle-manager ?boss))))

(rule (outranked-by ?staff-person ?boss)
      (or (supervisor ?staff-person ?boss)
          (and (outranked-by ?middle-manager ?boss)
               (supervisor ?staff-person
                           ?middle-manager))))

(outranked-by (Bitdiddle Ben) ?who)
; There is no assertion `(supervisor (Bitdiddle Ben) ?who)` in the database.
; So the procedure runs `(outranked-by ?A ?who)`. binding `?A` to `?middle-manager`.
; Unfortunately, `?A` do not has a supervisor. And then
; the procedue runs `(outranked-by (Bitdiddle ben) ?who)` again.