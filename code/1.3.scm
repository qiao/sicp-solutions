; The sum of the squares of the two larger numbers
; equals to the difference of 
; the sum of the squares of the three numbers and
; the square of the minimum number
(define (sum-square-two-larger a b c) 
  (- (+ (square a) 
        (square b) 
        (square c))
     (square (min a b c))))

(define (square x) (* x x))
