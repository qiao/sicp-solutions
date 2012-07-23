;; Calling (pairs s t) will recursively call (pairs (stream-cdr s) (stream-cdr t)).
;; It will lead to an infinite recursion.
