(define (cont-frac n d k)
  (define (recur i)
    (/ (n i)
       (+ (d i)
          (if (= k i)
              0
              (recur (+ 1 i))))))
  (recur 1))


(define (cont-frac-iter n d k)
  (define (iter k acc)
    (if (= 0 k)
        acc
        (iter (- k 1) (/ (n k)
                         (+ (d k) acc)))))
  (iter k 0))
