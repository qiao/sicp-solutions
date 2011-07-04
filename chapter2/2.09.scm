; Suppose we have two intervals, namely x and y.
; let x = [a, b], y = [c, d]
; the width of x is m = (b - a) / 2
; the width of y is n = (d - c) / 2
; 
; For addition:
;     z = x + y = [a + c, b + d]
;     width of z is  ((b + d) - (a + c)) / 2 = ((b - a) + (d - c)) / 2 
;                                            = (b - a) / 2 + (d - c) / 2
;                                            = m + n
;
; For subtraction:
;     z = x + (-y) = [a - c, b - d]
;     width of z is ((b - d) - (a - c)) / 2 = ((b - a) + (- (d - c))) / 2 
;                                           = (b - a) / 2 + (- (d - c)) / 2
;                                           = m - n
;
; For multiplication:
;     let x = [10, 20], y = [0, 5], 
;     then m = 10, n = 5
;     z = x * y = [0, 100]
;     width of z is 100
;
;     let x = [20, 30], y = [0, 5]
;     then m = 10, n = 5
;     z = x * y = [0, 150]
;     width of z is 150
;
;     from the above cases we can see that for the same set of m and n
;     there are multiple values of the width of z. Therefore, the width
;     of multiplication is not a function of the width of the intervals.
;     Neither is the division.
