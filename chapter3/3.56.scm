(define (merge s1 s2)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2)))
           (cond ((< s1car s2car)
                  (cons-stream s1car
                               (merge (stream-cdr s1) s2)))
                 ((> s1car s2car)
                  (cons-stream s2car
                               (merge (stream-cdr s2) s1)))
                 (else
                  (cons-stream s1car
                               (merge (stream-cdr s1)
                                      (stream-cdr s2)))))))))

(define S (cons-stream 1 
                       (merge (merge (scale-stream S 2)
                                     (scale-stream S 3))
                              (scale-stream S 5))))
