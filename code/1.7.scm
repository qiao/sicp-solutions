; Exercise 1.7.  
; The good-enough? test used in computing square
; roots will not be very effective for finding the square roots
; of very small numbers. Also, in real computers, arithmetic 
; operations are almost always performed with limited precision.
; This makes our test inadequate for very large numbers. 
; Explain these statements, with examples showing how the test 
; fails for small and large numbers. An alternative strategy for
; implementing good-enough? is to watch how guess changes from 
; one iteration to the next and to stop when the change is a 
; very small fraction of the guess. Design a square-root 
; procedure that uses this kind of end test. Does this work 
; better for small and large numbers? 


; Solution:
; For very small numbers, the approximation may end too early
; due to the comparatively large tolerance, thereby leading
; to a significantly inaccurate result. While for very large
; numbers, the given tolerance may take unbearable time or 
; even impossible to reach since the approximation is too slow
; or the value has gone beyond the machine's floating
; point precision.

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (abs (* guess 0.001))))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))
