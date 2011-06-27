; Note that ``p'' is recursively defined by itself. Therefore, for 
; the applicative-order evaluation, ``p'' will be evaluated in the 
; test, and this will lead to an infinite recursion. While in the 
; normal-order evaluation, the value of p is not evaluated, and 
; thus the test will return 0.
