(define (weight pair)
  (+ (square (car pair))
     (square (cadr pair))))

(define pairs (weighted-pairs integers integers weight))
(define numbers (stream-map weight pairs))

(define (filter-numbers s)
  (let* ((x (stream-car s))
         (y (stream-car (stream-car s)))
         (z (stream-car (stream-car (stream-car s)))))
    (if (= x y z)
        (cons-stream x (filter-numbers (stream-cdr (stream-cdr (stream-cdr s)))))
        (filter-numbers (stream-cdr s)))))

(define the-numbers (filter-numbers numbers))
