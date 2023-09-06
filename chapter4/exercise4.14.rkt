;; `(map + '(1 2) '(1 2))` 
;; The `+` would become (list 'primitive +)
;; the `map` could not deal with (list 'primitive +) as first argument.