;; a
;because let expression will be substituted as lambda expression, every lambda expression will extend the environment.

;; b
;the new environment is confined to the let expression, it doesn't change the outer environment.

;; c
;Do away with the let - All the (define var '*unassigned*) which was there in the let statements should instead be moved on top of the body. The set! statements should simply replace the earlier defines.
(lambda <vars> (lambda (u v)
                 (set! u <e1>)
                 (set! v <e2>)
                 <e3>)
  '*unassigned* '*unassigned*)
(lambda (<vars> u v)
  (set! u <e1>)
  (set! v <e2>)
  <e3>)