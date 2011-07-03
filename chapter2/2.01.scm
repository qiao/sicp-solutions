(define (make-rat n d)
  (define (sign x)
    (if (< x 0)
        -
        +))
  (let ((g (gcd n d)))
    (cons ((sign (* n d)) (abs (/ n g)))
          (abs (/ d g)))))
