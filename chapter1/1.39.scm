(define (cont-frac-iter n d k)
  (define (iter k acc)
    (if (= 0 k)
        acc
        (iter (- k 1) (/ (n k)
                         (+ (d k) acc)))))
  (iter k 0))

(define (tan-cf x k)
  (define (n i)
    (if (= 1 i)
        x
        (- (square x))))
  (define (d i)
    (- (* 2 i) 1))
  (cont-frac-iter n d k))
