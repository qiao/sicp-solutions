;      1
;     1 1
;    1 2 1
;   1 3 3 1
;  1 4 6 4 1
;
;            / 1                              , c = 1 or r = c
; f(r, c) = <  
;            \ f(r - 1, c - 1) + f(r - 1, c)  , otherwise

(define (pascal-triangle r c)
  (if (or (= c 1) (= c r))
      1
      (+ (pascal-triangle (- r 1) (- c 1))
         (pascal-triangle (- r 1) c))))
