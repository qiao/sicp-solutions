(define (fast-expt b n)
  (define (fast-iter b counter product)
    (if (= counter 0)
        product
        (if (even? counter)
            (fast-iter (square b) (/ counter 2) product)
            (fast-iter b (- counter 1) (* product b)))))
  (fast-iter b n 1))
