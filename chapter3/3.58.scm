(define (expand num den radix)
  (cons-stream
    (quotient (* num radix) den)
    (expand (remainder (* num radix) den) den radix)))

;; ``expand'' returns a stream composed of the digits of a fraction 
;; in a specified radix.
;; e.g.
;; 
;;    (expand 1 7 10) gives '(1 4 2 8 5 7 ...)
;;    
;;    (expand 3 8 10) gives '(3 7 5 0 0 0 ...)
