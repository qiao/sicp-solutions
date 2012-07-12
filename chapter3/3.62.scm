(define (div-series s1 s2)
  (let ((car1 (stream-car s1)))
    (if (= car1 0)
      (error "zero constant term -- DIV-SERIES" s1 s2)
      (scale-stream (mul-series s1
                                (invert-unit-series (scale-stream s2
                                                                  (/ 1 car1))))
                    (/ 1 car1)))))

(define tan-series (div-series sine-series cosine-series))
