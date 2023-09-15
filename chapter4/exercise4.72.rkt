;Quote from 3.5.3
; This is unsuitable for infinite streams, however, because it takes all the
; elements from the first stream before incorporating the second stream.
; In particular, if we try to generate all pairs of positive integers using
; (pairs integers integers)
; our stream of results will first try to run through all pairs with the first
; integer equal to 1, and hence will never produce pairs with any other
; value of the first integer.