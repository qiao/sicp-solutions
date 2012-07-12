(define (mul-series s1 s2)
  (cons-stream (* (stream-car s1)
                  (stream-car s2))
               (add-streams (scale-stream (stream-cdr s2) (stream-car s1))
                            (mul-series s1
                                        (stream-cdr s2)))))
