; The cond statement is wrapped as a function. Therefore, 
; in the applicative-order interpreter, 
; the ``sqrt-iter'' function in the else-clause will be
; evaluated, and this will lead to an infinite recursion until
; stack overflow.
