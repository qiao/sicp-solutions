(define (split f g)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split f g) painter (- n 1))))
          (f painter (g smaller smaller))))))
