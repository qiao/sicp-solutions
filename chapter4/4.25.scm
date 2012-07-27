;; In applicative-order Scheme, the procedure will evaluate the arguments 
;; of `unless` first. 
;; Therefore, the expression `(* n (factorial (- n 1))` will always be
;; evaluated regardless of the result of `(= n 1)`. 
;; In consequence, the recursion will not terminate until stack overflow.
