(define (sum term a next b)
  (define (sum-iter a acc)
    (if (> a b)
        acc
        (sum-iter (next a) (+ (term a) acc))))
  (sum-iter a 0))
